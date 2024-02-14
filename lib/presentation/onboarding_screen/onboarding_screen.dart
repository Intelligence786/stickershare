import 'package:flutter/material.dart';
import 'package:stickershare/core/app_export.dart';
import 'package:stickershare/widgets/custom_elevated_button.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 100.v),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 55.v),
            Center(
              child: CustomImageView(
                imagePath: ImageConstant.imageOnboardingImage,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(height: 75.v),
            Text(
              'Send stickers to any\nmessanger with our app!',
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomElevatedButton(
              text: 'Get started',
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, AppRoutes.mainScreen);
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              height: 48.v,
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Center(child: Text('Terms of Use / Privacy Policy')),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
