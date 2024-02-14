import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 100.h,
        title: Padding(
          padding: EdgeInsets.only(left: 8.h, top: 50.h),
          child: Text(
            'Settings',
            style: theme.textTheme.headlineLarge,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.fillPrimary,
        child: Column(
          children: [
            _buttonWidget(
              context,
              text: 'Share with friends',
              imagePath: ImageConstant.imgQuestion,
              onTap: () {

              },
            ),
            _buttonWidget(
              context,
              text: 'Privacy Policy',
              imagePath: ImageConstant.imgOtherIcons,
              onTap: () {},
            ),
            _buttonWidget(
              context,
              text: 'Term of use',
              imagePath: ImageConstant.imgOtherIconsOnprimarycontainer,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buttonWidget(BuildContext context,
    {String text = '', String imagePath = '', Function? onTap}) {
  return Container(
    padding: EdgeInsets.all(8.h),
    height: 75.v,
    child: ElevatedButton(
      onPressed: onTap?.call(),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(appTheme.gray300),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 16.h),
                  child: CustomImageView(
                    imagePath: imagePath,
                    fit: BoxFit.fitWidth,
                    color: Colors.black,
                  ),
                ),
                Text(
                  text,
                  style: theme.textTheme.bodyLarge,
                )
              ],
            ),
            CustomImageView(
              imagePath: ImageConstant.imgArrow,
              color: appTheme.green300,
            ),
          ],
        ),
      ),
    ),
  );
}
