import 'package:flutter/material.dart';
import 'package:goalify/core/theme/app_color.dart';

class AppStrings {
  
  AppStrings._();
  
  //App Info
  static const String appName = "Goalify";


  //onboarding screen
  static const List<Map<String, dynamic>> onBoardingPages = [
    {
      'title': 'Easy Planning',
      'description':
          'Organize your study sessions easily and let AI help you manage your time effectively.',
      'icon': Icons.calendar_month,
      'color': AppColors.primary,
    },
    {
      'title': 'AI-Powered Suggestions',
      'description':
          'Get personalized study recommendations based on your progress and learning habits.',
      'icon': Icons.psychology,
      'color': AppColors.secondary,
    },
    {
      'title': 'Track Your Progress',
      'description':
          'Visualize your learning journey with detailed analytics and achievement tracking.',
      'icon': Icons.trending_up,
      'color': const Color(0xFF4CAF50),
    },
  ];
}




/*
class AppStrings {
  // منع إنشاء Object من الـ Class
  AppStrings._();

  // ═══════════════════════════════════════
  // App Info
  // ═══════════════════════════════════════
  static const String appName = 'Goalify';
  static const String appTagline = 'Study smarter, not harder';

  // ═══════════════════════════════════════
  // Splash Screen
  // ═══════════════════════════════════════
  static const String splashLoading = 'Initializing your workspace...';
  static const String splashPoweredBy = 'POWERED BY ARTIFICIAL INTELLIGENCE';

  // ═══════════════════════════════════════
  // Onboarding Screen
  // ═══════════════════════════════════════
  static const String onboardingSkip = 'Skip';
  static const String onboardingNext = 'Next';
  static const String onboardingGetStarted = 'Get Started';

  // Onboarding Page 1
  static const String onboarding1Title = 'Easy Planning';
  static const String onboarding1Desc = 
      'Organize your study sessions easily and let AI help you manage your time effectively.';

  // Onboarding Page 2
  static const String onboarding2Title = 'AI-Powered Suggestions';
  static const String onboarding2Desc = 
      'Get personalized study recommendations based on your progress and learning habits.';

  // Onboarding Page 3
  static const String onboarding3Title = 'Track Your Progress';
  static const String onboarding3Desc = 
      'Visualize your learning journey with detailed analytics and achievement tracking.';

  // ═══════════════════════════════════════
  // Auth Screens
  // ═══════════════════════════════════════
  static const String login = 'Login';
  static const String register = 'Register';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String fullName = 'Full Name';
  static const String forgotPassword = 'Forgot Password?';
  static const String dontHaveAccount = "Don't have an account?";
  static const String alreadyHaveAccount = 'Already have an account?';
  static const String signUp = 'Sign Up';
  static const String signIn = 'Sign In';

  // ═══════════════════════════════════════
  // Bottom Navigation
  // ═══════════════════════════════════════
  static const String navHome = 'Home';
  static const String navPlanner = 'Planner';
  static const String navProgress = 'Progress';
  static const String navAiTips = 'AI Tips';
  static const String navSettings = 'Settings';

  // ═══════════════════════════════════════
  // Common
  // ═══════════════════════════════════════
  static const String save = 'Save';
  static const String cancel = 'Cancel';
  static const String delete = 'Delete';
  static const String edit = 'Edit';
  static const String add = 'Add';
  static const String done = 'Done';
  static const String error = 'Error';
  static const String success = 'Success';
  static const String loading = 'Loading...';
  static const String retry = 'Retry';
}

 */