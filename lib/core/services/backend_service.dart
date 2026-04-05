import '../../models/restaurant_model.dart';
import '../../models/menu_item_model.dart';
import '../../models/user_model.dart';

class BackendService {
  // This is a Mock Backend Service representing Firestore calls.
  // When ready, replace these Lists with actual FirebaseCollection references.

  final List<RestaurantModel> _restaurants = [
    RestaurantModel(
      id: 'rest_001',
      name: 'Sharma Fast Food',
      imageUrl: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1',
      address: 'Near CU Gate 2',
      phone: '9876543210',
      lat: 30.765,
      lng: 76.575,
      rating: 4.2,
      avgWaitTime: 7,
      isOpen: true,
    ),
    RestaurantModel(
      id: 'rest_002',
      name: 'Campus Wraps',
      imageUrl: 'https://images.unsplash.com/photo-1626804475297-41609ea0dc4eb',
      address: 'Hostel Lane',
      phone: '9876543211',
      lat: 30.766,
      lng: 76.578,
      rating: 4.6,
      avgWaitTime: 5,
      isOpen: true,
    ),
  ];

  final List<MenuItemModel> _menuItems = [
    // SNACKS
    MenuItemModel(id: 'm1', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Veg Burger', price: 50, isVeg: true, isAvailable: true),
    MenuItemModel(id: 'm2', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Cheese Burger', price: 60, isVeg: true, isAvailable: true),
    MenuItemModel(id: 'm3', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Veg Noodles', price: 80, isVeg: true, isAvailable: true),
    MenuItemModel(id: 'm4', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Hakka Noodles', price: 90, isVeg: true, isAvailable: true),
    MenuItemModel(id: 'm5', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Cheese Noodles', price: 100, isVeg: true, isAvailable: true),
    MenuItemModel(id: 'm6', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Spring Roll', price: 60, isVeg: true, isAvailable: true),
    MenuItemModel(id: 'm7', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Fried/Steamed Momos', price: 60, isVeg: true, isAvailable: true),
    MenuItemModel(id: 'm8', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Veg Maggi', price: 40, isVeg: true, isAvailable: true),
    MenuItemModel(id: 'm9', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'French Fries', price: 60, isVeg: true, isAvailable: true),
    MenuItemModel(id: 'm10', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Chilli Potato', price: 100, isVeg: true, isAvailable: true),
    MenuItemModel(id: 'm11', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'White Sauce Pasta', price: 90, isVeg: true, isAvailable: true),
    
    // SANDWICHES
    MenuItemModel(id: 'm12', restaurantId: 'rest_002', restaurantName: 'Campus Wraps', foodName: 'Veg Grilled Sandwich', price: 60, isVeg: true, isAvailable: true),
    MenuItemModel(id: 'm13', restaurantId: 'rest_002', restaurantName: 'Campus Wraps', foodName: 'Paneer Korma Sandwich', price: 90, isVeg: true, isAvailable: true),
    MenuItemModel(id: 'm14', restaurantId: 'rest_002', restaurantName: 'Campus Wraps', foodName: 'Cheese Sandwich', price: 80, isVeg: true, isAvailable: true),
    
    // INDIAN FOOD
    MenuItemModel(id: 'm15', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Rajma Rice', price: 60, isVeg: true, isAvailable: true),
    MenuItemModel(id: 'm16', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Veg Fried Rice', price: 80, isVeg: true, isAvailable: true),
    MenuItemModel(id: 'm17', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Aloo Prantha with Butter', price: 45, isVeg: true, isAvailable: true),

    // SHAKES & BEVERAGES
    MenuItemModel(id: 'm18', restaurantId: 'rest_002', restaurantName: 'Campus Wraps', foodName: 'Kitkat Shake', price: 70, isVeg: true, isAvailable: true),
    MenuItemModel(id: 'm19', restaurantId: 'rest_002', restaurantName: 'Campus Wraps', foodName: 'Oreo Shake', price: 70, isVeg: true, isAvailable: true),
    MenuItemModel(id: 'm20', restaurantId: 'rest_002', restaurantName: 'Campus Wraps', foodName: 'Cold Coffee', price: 60, isVeg: true, isAvailable: true),
    MenuItemModel(id: 'm21', restaurantId: 'rest_002', restaurantName: 'Campus Wraps', foodName: 'Sweet Lassi', price: 30, isVeg: true, isAvailable: true),
    MenuItemModel(id: 'm22', restaurantId: 'rest_002', restaurantName: 'Campus Wraps', foodName: 'Virgin Mojito', price: 60, isVeg: true, isAvailable: true),
    MenuItemModel(id: 'm23', restaurantId: 'rest_002', restaurantName: 'Campus Wraps', foodName: 'Tea', price: 15, isVeg: true, isAvailable: true),
    MenuItemModel(id: 'm24', restaurantId: 'rest_002', restaurantName: 'Campus Wraps', foodName: 'Aloo Patty', price: 20, isVeg: true, isAvailable: true),

    // NON VEG & EGGS
    MenuItemModel(id: 'm25', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Egg Noodles', price: 100, isVeg: false, isAvailable: true),
    MenuItemModel(id: 'm26', restaurantId: 'rest_001', restaurantName: 'Sharma Fast Food', foodName: 'Egg Fried Rice', price: 100, isVeg: false, isAvailable: true),
    MenuItemModel(id: 'm27', restaurantId: 'rest_002', restaurantName: 'Campus Wraps', foodName: 'Egg Bhurji (2 Egg)', price: 50, isVeg: false, isAvailable: true),
  ];

  final UserModel _currentUser = UserModel(
    id: 'user_001',
    name: 'Student',
    favoriteRestaurants: ['rest_001'],
    favoriteFoods: ['menu_001'],
  );

  // --- MOCK API METHODS (Simulating Firebase) ---

  /// Fetch nearby restaurants (In MVP, just fetching all)
  Future<List<RestaurantModel>> getNearbyRestaurants() async {
    await Future.delayed(const Duration(milliseconds: 800)); // Simulate network latency
    return _restaurants;
  }

  /// Search food comparison logic across all restaurants
  Future<List<MenuItemModel>> searchFoodAcrossRestaurants(String query) async {
    await Future.delayed(const Duration(milliseconds: 600)); 

    // 1. Find matching menu items
    final matches = _menuItems.where((item) {
      return item.foodName.toLowerCase().contains(query.toLowerCase());
    }).toList();

    // 2. Attach restaurant info (like wait time, calculating distance)
    for (var i = 0; i < matches.length; i++) {
        final rest = _restaurants.firstWhere((r) => r.id == matches[i].restaurantId);
        
        // Simulating distance calculation from user location
        double fakeDistance = (rest.rating - 4.0) * 1.5; // just a dummy math for km
        
        matches[i] = matches[i].copyWith(
           distanceKm: fakeDistance > 0 ? fakeDistance : 0.5,
           avgWaitTime: rest.avgWaitTime,
        );
    }

    return matches;
  }

  /// Fetch specific restaurant details
  Future<RestaurantModel> getRestaurantDetails(String restaurantId) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _restaurants.firstWhere((r) => r.id == restaurantId);
  }

  /// Fetch all menu items for a specific restaurant
  Future<List<MenuItemModel>> getRestaurantMenu(String restaurantId) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _menuItems.where((m) => m.restaurantId == restaurantId).toList();
  }

  /// Toggle Favorite Restaurant
  Future<void> toggleFavoriteRestaurant(String restId) async {
    // In Firebase: FirebaseFirestore.instance.collection('users').doc(userId).update({...})
    if (_currentUser.favoriteRestaurants.contains(restId)) {
      _currentUser.favoriteRestaurants.remove(restId);
    } else {
      _currentUser.favoriteRestaurants.add(restId);
    }
  }

  /// Get Current User
  Future<UserModel> getUserProfile() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _currentUser;
  }
}
