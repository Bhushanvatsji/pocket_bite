import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ChipButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool active;

  const ChipButton({
    super.key,
    required this.label,
    this.icon,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: active ? AppColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: active ? AppColors.primary : AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16, color: active ? Colors.white : AppColors.textSecondary),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: active ? Colors.white : AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}