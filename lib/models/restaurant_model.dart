class RestaurantModel {
  final String id;
  final String name;
  final String imageUrl;
  final String address;
  final String phone;
  final double lat;
  final double lng;
  final double rating;
  final int avgWaitTime;
  final bool isOpen;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.phone,
    required this.lat,
    required this.lng,
    required this.rating,
    required this.avgWaitTime,
    required this.isOpen,
  });

  factory RestaurantModel.fromMap(Map<String, dynamic> map, String docId) {
    return RestaurantModel(
      id: docId,
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      address: map['address'] ?? '',
      phone: map['phone'] ?? '',
      lat: map['lat']?.toDouble() ?? 0.0,
      lng: map['lng']?.toDouble() ?? 0.0,
      rating: map['rating']?.toDouble() ?? 0.0,
      avgWaitTime: map['avgWaitTime']?.toInt() ?? 0,
      isOpen: map['isOpen'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'address': address,
      'phone': phone,
      'lat': lat,
      'lng': lng,
      'rating': rating,
      'avgWaitTime': avgWaitTime,
      'isOpen': isOpen,
    };
  }
}
