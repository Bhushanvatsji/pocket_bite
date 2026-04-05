import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../data/dummy_data.dart';
import '../../../../models/food_item.dart';

class FoodController extends ChangeNotifier {
  /// Simulated current user location (later GPS se replace karenge)
  double userLat = 30.7338;
  double userLng = 76.7790;

  /// User preferences (local for now)
  String userName = "Bhushan";
  bool prefersHealthy = false;
  double maxBudget = 100;

  /// Filters
  String searchQuery = '';
  bool healthyOnly = false;
  bool openNowOnly = false;
  double maxDistanceKm = 2.0;
  double maxPrepTime = 20;
  double minRating = 0.0;
  Set<String> selectedMealTypes = {};
  Set<String> selectedTags = {};

  /// Favorites
  Set<String> favoriteIds = {};

  /// Source data
  List<FoodItem> allFoods = [];

  FoodController() {
    _init();
  }

  Future<void> _init() async {
    allFoods = demoFoods.map((e) {
      final d = _distanceInKm(userLat, userLng, e.lat, e.lng);
      return e.copyWith(distanceKm: d);
    }).toList()
      ..sort((a, b) => a.distanceKm.compareTo(b.distanceKm));

    await loadFavorites();
    notifyListeners();
  }

  // ----------------------------
  // Search / Filters
  // ----------------------------
  void updateSearch(String value) {
    searchQuery = value.trim().toLowerCase();
    notifyListeners();
  }

  void toggleHealthyOnly() {
    healthyOnly = !healthyOnly;
    notifyListeners();
  }

  void toggleOpenNowOnly() {
    openNowOnly = !openNowOnly;
    notifyListeners();
  }

  void setMaxDistance(double value) {
    maxDistanceKm = value;
    notifyListeners();
  }

  void setMaxPrepTime(double value) {
    maxPrepTime = value;
    notifyListeners();
  }

  void setMinRating(double value) {
    minRating = value;
    notifyListeners();
  }

  void setBudget(double value) {
    maxBudget = value;
    notifyListeners();
  }

  void toggleMealType(String type) {
    if (selectedMealTypes.contains(type)) {
      selectedMealTypes.remove(type);
    } else {
      selectedMealTypes.add(type);
    }
    notifyListeners();
  }

  void toggleTag(String tag) {
    if (selectedTags.contains(tag)) {
      selectedTags.remove(tag);
    } else {
      selectedTags.add(tag);
    }
    notifyListeners();
  }

  void resetFilters() {
    searchQuery = '';
    healthyOnly = false;
    openNowOnly = false;
    maxDistanceKm = 2.0;
    maxPrepTime = 20;
    minRating = 0.0;
    selectedMealTypes.clear();
    selectedTags.clear();
    maxBudget = 100;
    notifyListeners();
  }

  // ----------------------------
  // Derived lists
  // ----------------------------
  List<FoodItem> get filteredFoods {
    return allFoods.where((item) {
      final q = searchQuery.isEmpty ||
          item.name.toLowerCase().contains(searchQuery) ||
          item.shopName.toLowerCase().contains(searchQuery) ||
          item.category.toLowerCase().contains(searchQuery) ||
          item.tags.any((t) => t.toLowerCase().contains(searchQuery));

      final healthy = !healthyOnly || item.healthy;
      final openNow = !openNowOnly || item.isOpenNow;
      final distance = item.distanceKm <= maxDistanceKm;
      final prep = item.timeMin <= maxPrepTime;
      final rating = item.rating >= minRating;
      final budget = item.price <= maxBudget;

      final mealType = selectedMealTypes.isEmpty || selectedMealTypes.contains(item.mealType);
      final tags = selectedTags.isEmpty || selectedTags.any((tag) => item.tags.contains(tag));

      return q && healthy && openNow && distance && prep && rating && budget && mealType && tags;
    }).toList()
      ..sort((a, b) {
        // Better ranking = cheaper + nearer + higher rating + healthy preference
        final scoreA = _score(a);
        final scoreB = _score(b);
        return scoreB.compareTo(scoreA);
      });
  }

  List<FoodItem> get bestForYou => filteredFoods.take(5).toList();

  List<FoodItem> get healthyToday =>
      filteredFoods.where((e) => e.healthy || e.tags.contains('healthy')).toList();

  List<FoodItem> get budgetPicks =>
      filteredFoods.where((e) => e.price <= 80).toList();

  List<FoodItem> get nearestSpots =>
      filteredFoods.where((e) => e.distanceKm <= 1.0).toList();

  List<FoodItem> get trendingToday =>
      filteredFoods.where((e) => e.trending).toList();

  List<FoodItem> get breakfastPicks =>
      filteredFoods.where((e) => e.mealType == 'breakfast').toList();

  List<FoodItem> get lunchPicks =>
      filteredFoods.where((e) => e.mealType == 'lunch').toList();

  List<FoodItem> get snackPicks =>
      filteredFoods.where((e) => e.mealType == 'snacks').toList();

  List<FoodItem> get favoriteFoods =>
      allFoods.where((e) => favoriteIds.contains(e.id)).toList();

  // ----------------------------
  // Compare price logic
  // ----------------------------
  List<FoodItem> compareByKeyword(String keyword) {
    final key = keyword.toLowerCase();
    final list = allFoods.where((e) =>
    e.name.toLowerCase().contains(key) ||
        e.category.toLowerCase().contains(key) ||
        e.tags.any((t) => t.toLowerCase().contains(key))).toList();

    list.sort((a, b) => a.price.compareTo(b.price));
    return list;
  }

  // ----------------------------
  // Daily health logic
  // ----------------------------
  List<FoodItem> get dailyHealthPicks {
    final list = allFoods.where((e) =>
    e.healthy ||
        e.calories <= 350 ||
        e.protein >= 15 ||
        e.tags.contains('healthy') ||
        e.tags.contains('protein')).toList();

    list.sort((a, b) {
      final aScore = (a.protein * 2) - (a.calories / 100);
      final bScore = (b.protein * 2) - (b.calories / 100);
      return bScore.compareTo(aScore);
    });

    return list;
  }

  // ----------------------------
  // Favorites
  // ----------------------------
  Future<void> toggleFavorite(String id) async {
    if (favoriteIds.contains(id)) {
      favoriteIds.remove(id);
    } else {
      favoriteIds.add(id);
    }
    notifyListeners();
    await saveFavorites();
  }

  bool isFavorite(String id) => favoriteIds.contains(id);

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorite_ids', favoriteIds.toList());
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    favoriteIds = (prefs.getStringList('favorite_ids') ?? []).toSet();
  }

  // ----------------------------
  // Recommendation
  // ----------------------------
  FoodItem? recommendOne({
    String mode = 'Affordable',
    int budget = 100,
  }) {
    final pool = allFoods.where((e) => e.price <= budget).toList();
    if (pool.isEmpty) return null;

    pool.sort((a, b) {
      double score(FoodItem i) {
        double s = 0;
        if (mode == 'Affordable') s += (150 - i.price);
        if (mode == 'Quick Bite') s += (20 - i.timeMin) * 4;
        if (mode == 'Healthy') s += (i.healthy ? 40 : 0) + i.protein - (i.calories / 100);
        if (mode == 'Surprise Me') s += (i.trending ? 25 : 0) + i.rating * 10;
        s += (5 - i.distanceKm) * 4 + i.rating * 8;
        return s;
      }

      return score(b).compareTo(score(a));
    });

    return pool.first;
  }

  // ----------------------------
  // Helpers
  // ----------------------------
  double _score(FoodItem i) {
    double s = 0;
    s += (150 - i.price);
    s += (5 - i.distanceKm) * 8;
    s += i.rating * 10;
    s += (20 - i.timeMin) * 3;
    if (prefersHealthy && i.healthy) s += 25;
    if (i.trending) s += 8;
    if (i.cheapest) s += 10;
    return s;
  }

  double _distanceInKm(double lat1, double lon1, double lat2, double lon2) {
    const R = 6371; // km
    final dLat = _deg2rad(lat2 - lat1);
    final dLon = _deg2rad(lon2 - lon1);
    final a =
        sin(dLat / 2) * sin(dLat / 2) +
            cos(_deg2rad(lat1)) * cos(_deg2rad(lat2)) *
                sin(dLon / 2) * sin(dLon / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return R * c;
  }

  double _deg2rad(double deg) => deg * (pi / 180);
}