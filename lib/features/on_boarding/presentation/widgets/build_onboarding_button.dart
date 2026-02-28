import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';

class BuildOnboardingButton extends StatelessWidget {
  const BuildOnboardingButton({
    super.key,
    this.onPressed,
    required this.currentPage,
  });
  final void Function()? onPressed;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          currentPage == AppStrings.onBoardingPages.length - 1
              ? 'Get Started'
              : 'Next',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
