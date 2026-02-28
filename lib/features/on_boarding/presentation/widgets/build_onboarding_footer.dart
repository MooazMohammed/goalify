import 'package:flutter/material.dart';

import 'build_onboarding_button.dart';
import 'build_onboarding_dots.dart';

class BuildOnboardingFooter extends StatelessWidget {
  const BuildOnboardingFooter({
    super.key,
    required this.currentPage,
    void Function()? onPressed,
  });
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          BuildOnboardingDots(currentPage: currentPage),
          const SizedBox(height: 32),
          BuildOnboardingButton(currentPage: currentPage),
        ],
      ),
    );
  }
}
