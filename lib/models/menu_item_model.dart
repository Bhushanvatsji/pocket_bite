class MenuItemModel {
  final String id;
  final String restaurantId;
  final String restaurantName;
  final String foodName;
  final double price;
  final bool isVeg;
  final bool isAvailable;
  
  // Custom properties for comparison
  double? distanceKm; // Computed dynamically, not stored in DB
  int? avgWaitTime;   // Computed dynamically, not stored in DB

  MenuItemModel({
    required this.id,
    required this.restaurantId,
    required this.restaurantName,
    required this.foodName,
    required this.price,
    required this.isVeg,
    required this.isAvailable,
    this.distanceKm,
    this.avgWaitTime,
  });

  factory MenuItemModel.fromMap(Map<String, dynamic> map, String docId) {
    return MenuItemModel(
      id: docId,
      restaurantId: map['restaurantId'] ?? '',
      restaurantName: map['restaurantName'] ?? '',
      foodName: map['foodName'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      isVeg: map['isVeg'] ?? true,
      isAvailable: map['isAvailable'] ?? true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'restaurantId': restaurantId,
      'restaurantName': restaurantName,
      'foodName': foodName,
      'price': price,
      'isVeg': isVeg,
      'isAvailable': isAvailable,
    };
  }

  MenuItemModel copyWith({
    double? distanceKm,
    int? avgWaitTime,
  }) {
    return MenuItemModel(
      id: id,
      restaurantId: restaurantId,
      restaurantName: restaurantName,
      foodName: foodName,
      price: price,
      isVeg: isVeg,
      isAvailable: isAvailable,
      distanceKm: distanceKm ?? this.distanceKm,
      avgWaitTime: avgWaitTime ?? this.avgWaitTime,
    );
  }
}
