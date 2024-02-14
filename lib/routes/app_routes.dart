import 'package:flutter/material.dart';
import 'package:stickershare/presentation/main_screen/main_screen.dart';
import 'package:stickershare/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:stickershare/presentation/settings_screen/settings_screen.dart';
import 'package:stickershare/presentation/sticker_screen/stiker_screen.dart';

class AppRoutes {
  static const String onboardingScreen = '/onboarding_screen';

  static const String stickerScreen = '/sticker_screen';

  static const String settingsScreen = '/settings_screen';

  static const String mainScreen = '/main_screen';

  static Map<String, WidgetBuilder> routes = {
    onboardingScreen: (context) => OnboardingScreen(),
    stickerScreen: (context) => StickerScreen(),
    settingsScreen: (context) => SettingsScreen(),
    mainScreen: (context) => MainScreen(),
  };
}
