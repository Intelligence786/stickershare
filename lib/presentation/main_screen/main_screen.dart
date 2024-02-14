import 'package:flutter/material.dart';
import 'package:stickershare/presentation/settings_screen/settings_screen.dart';
import 'package:stickershare/presentation/sticker_screen/stiker_screen.dart';

import '../../core/app_export.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentScreenIndex = 0;

  List<Widget> screens = [StickerScreen(), SettingsScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _currentScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentScreenIndex],

      bottomNavigationBar: BottomNavigationBar(
        iconSize: 10,
        onTap: _onItemTapped,
        currentIndex: _currentScreenIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: appTheme.gray50,
        selectedItemColor: appTheme.green300,
        items: [
          BottomNavigationBarItem(
            label: 'Stickers',
            icon: CustomImageView(
              imagePath: ImageConstant.imgStickersIcon ,
              fit: BoxFit.fill,
              color: Colors.black,
            ),
            activeIcon: CustomImageView(
              imagePath: ImageConstant.imgStickersIconActive ,
              fit: BoxFit.fill,
              color: appTheme.green300,
            ),
          ),

          BottomNavigationBarItem(
            label: 'Settings',
            icon: CustomImageView(
              imagePath: ImageConstant.imgSettingsIcon,
              fit: BoxFit.fill,
              color: Colors.black,
            ), activeIcon: CustomImageView(
            imagePath: ImageConstant.imgSettingsIconActive ,
            fit: BoxFit.fill,
            color: appTheme.green300,
          ),
          ),
        ],
      ),
    );
  }
}
