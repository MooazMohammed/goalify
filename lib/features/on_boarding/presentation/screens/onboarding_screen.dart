import 'package:flutter/material.dart';
import 'package:goalify/core/constants/app_strings.dart';
import 'package:goalify/features/on_boarding/presentation/widgets/build_onboarding_footer.dart';
import 'package:goalify/features/on_boarding/presentation/widgets/build_onboarding_header.dart';
import 'package:goalify/features/on_boarding/presentation/widgets/onboarding_page_view.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    if (_currentPage < AppStrings.onBoardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToAuth();
    }
  }

  void _navigateToAuth() {
    debugPrint('Navigate to Auth');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            BuildOnboardingHeader(onPressed: _navigateToAuth),

            // PageView
            Expanded(child: _buildPageView()),

            // Footer (Dots + Button)
            BuildOnboardingFooter(
              currentPage: _currentPage,
              onPressed: _onNextPressed,
            ),
          ],
        ),
      ),
    );
  }

 


  Widget _buildPageView() {
    return PageView.builder(
      controller: _pageController,
      itemCount: AppStrings.onBoardingPages.length,
      onPageChanged: (index) {
        setState(() {
          _currentPage = index;
        });
      },
      itemBuilder: (context, index) {
        return OnboardingPageView(
          title: AppStrings.onBoardingPages[index]['title'],
          description: AppStrings.onBoardingPages[index]['description'],
          icon: AppStrings.onBoardingPages[index]['icon'],
          iconColor: AppStrings.onBoardingPages[index]['color'],
        );
      },
    );
  }
}
