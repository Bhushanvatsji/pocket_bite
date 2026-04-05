import 'package:flutter/material.dart';
import '../../../../core/widgets/food_card.dart';
import '../../../../models/food_item.dart';
import 'food_detail_page.dart';

class SeeAllPage extends StatelessWidget {
  final String title;
  final List<FoodItem> items;

  const SeeAllPage({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: items.isEmpty
          ? const Center(child: Text("No items found"))
          : ListView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
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