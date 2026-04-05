import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/food_card.dart';
import '../controllers/food_controller.dart';
import 'food_detail_page.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<FoodController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Saved Spots")),
      body: controller.favoriteFoods.isEmpty
          ? const Center(
        child: Text(
          "No saved places yet.\nTap the heart to save your favorite spots.",
          textAlign: TextAlign.center,
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: controller.favoriteFoods.length,
        itemBuilder: (context, index) {
          final item = controller.favoriteFoods[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: FoodCard(
              item: item,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FoodDetailPage()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}