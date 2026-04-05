class FoodItem {
  final String id;
  final String name;
  final String shopName;
  final String image;
  final double price;
  final double rating;
  final int timeMin;
  final bool healthy;
  final bool cheapest;
  final bool trending;
  final String category;
  final String description;

  /// NEW
  final List<String> tags;
  final double calories;
  final double protein;
  final String mealType; // breakfast / lunch / snacks / dinner
  final String spotAddress;
  final double lat;
  final double lng;
  final bool isOpenNow;

  /// Computed later
  double distanceKm;

  FoodItem({
    required this.id,
    required this.name,
    required this.shopName,
    required this.image,
    required this.price,
    required this.rating,
    required this.timeMin,
    required this.healthy,
    required this.cheapest,
    required this.trending,
    required this.category,
    required this.description,
    required this.tags,
    required this.calories,
    required this.protein,
    required this.mealType,
    required this.spotAddress,
    required this.lat,
    required this.lng,
    required this.isOpenNow,
    this.distanceKm = 0.0,
  });

  FoodItem copyWith({
    double? distanceKm,
  }) {
    return FoodItem(
      id: id,
      name: name,
      shopName: shopName,
      image: image,
      price: price,
      rating: rating,
      timeMin: timeMin,
      healthy: healthy,
      cheapest: cheapest,
      trending: trending,
      category: category,
      description: description,
      tags: tags,
      calories: calories,
      protein: protein,
      mealType: mealType,
      spotAddress: spotAddress,
      lat: lat,
      lng: lng,
      isOpenNow: isOpenNow,
      distanceKm: distanceKm ?? this.distanceKm,
    );
  }
}