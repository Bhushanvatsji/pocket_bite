class UserModel {
  final String id;
  final String name;
  final List<String> favoriteRestaurants;
  final List<String> favoriteFoods;

  UserModel({
    required this.id,
    required this.name,
    this.favoriteRestaurants = const [],
    this.favoriteFoods = const [],
  });

  factory UserModel.fromMap(Map<String, dynamic> map, String docId) {
    return UserModel(
      id: docId,
      name: map['name'] ?? '',
      favoriteRestaurants: List<String>.from(map['favoriteRestaurants'] ?? []),
      favoriteFoods: List<String>.from(map['favoriteFoods'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'favoriteRestaurants': favoriteRestaurants,
      'favoriteFoods': favoriteFoods,
    };
  }

  UserModel copyWith({
    String? name,
    List<String>? favoriteRestaurants,
    List<String>? favoriteFoods,
  }) {
    return UserModel(
      id: id,
      name: name ?? this.name,
      favoriteRestaurants: favoriteRestaurants ?? this.favoriteRestaurants,
      favoriteFoods: favoriteFoods ?? this.favoriteFoods,
    );
  }
}
