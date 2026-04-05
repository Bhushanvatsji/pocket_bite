import 'package:flutter/material.dart';
import '../../models/food_item.dart';
import '../theme/app_colors.dart';

class FoodCard extends StatelessWidget {
  final FoodItem item;
  final VoidCallback? onTap;
  final bool compact;

  const FoodCard({
    super.key,
    required this.item,
    this.onTap,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: compact ? 180 : double.infinity,
        margin: const EdgeInsets.only(right: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: compact ? 110 : 160,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
                gradient: const LinearGradient(
                  colors: [Color(0xFFEAFBF5), Color(0xFFD7F7EA)],
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Text(item.image, style: const TextStyle(fontSize: 54)),
                  ),
                  if (item.trending)
                    Positioned(
                      top: 12,
                      left: 12,
                      child: _badge("Trending", Colors.orange.shade100, Colors.orange.shade800),
                    ),
                  if (item.healthy)
                    Positioned(
                      top: 12,
                      right: 12,
                      child: _badge("Healthy", AppColors.lightGreen, AppColors.primaryDark),
                    ),
                  if (item.cheapest)
                    Positioned(
                      bottom: 12,
                      left: 12,
                      child: _badge("Cheapest", const Color(0xFFFFF3E0), Colors.deepOrange),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.shopName,
                    style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "₹${item.price.toInt()}",
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.star_rounded, color: Colors.amber, size: 18),
                      const SizedBox(width: 4),
                      Text(item.rating.toString()),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.place_outlined, size: 16, color: AppColors.textSecondary),
                      const SizedBox(width: 4),
                      Text("${item.distanceKm}m", style: const TextStyle(fontSize: 12)),
                      const SizedBox(width: 12),
                      const Icon(Icons.access_time_rounded, size: 16, color: AppColors.textSecondary),
                      const SizedBox(width: 4),
                      Text("${item.timeMin} min", style: const TextStyle(fontSize: 12)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _badge(String text, Color bg, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: textColor),
      ),
    );
  }
}