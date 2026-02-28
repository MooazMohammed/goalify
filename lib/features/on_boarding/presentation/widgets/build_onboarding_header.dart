import 'package:flutter/material.dart';
import 'package:goalify/core/theme/app_color.dart';

class BuildOnboardingHeader extends StatelessWidget {
  const BuildOnboardingHeader({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Goalify',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          TextButton(
            onPressed: onPressed,
            child: Text(
              'Skip',
              style: TextStyle(color: AppColors.primary, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
