import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lecle_social_share/lecle_social_share.dart';
import 'package:share_plus/share_plus.dart';
import 'package:social_share/social_share.dart';
import 'package:stickershare/widgets/app_bar/custom_app_bar.dart';
import 'package:stickershare/widgets/custom_icon_button.dart';

import '../../core/app_export.dart';

class StickerScreen extends StatefulWidget {
  @override
  State<StickerScreen> createState() => _StickerScreenState();
}

class _StickerScreenState extends State<StickerScreen> {
  late List<String> imagePathsList;

  @override
  void initState() {
    imagePathsList = [
      ImageConstant.imgTravelMap64x64,
      ImageConstant.imgActionCamera64x64,
      ImageConstant.imgBags,
      ImageConstant.imgBrochure64x64,
      ImageConstant.imgCamping64x64,
      ImageConstant.imgCarabiner,
      ImageConstant.imgDuffleBag,
      ImageConstant.imgKit,
      ImageConstant.imgKnifeSwiss,
      ImageConstant.imgLifesaverVest,
      ImageConstant.imgOxygenTank,
      ImageConstant.imgPassport,
      ImageConstant.imgPlace,
      ImageConstant.imgPlaneTicket,
      ImageConstant.imgTravel1,
      ImageConstant.imgTravel2,
      ImageConstant.imgTravel,
      ImageConstant.imgTravelBag,
      ImageConstant.imgTravelGuide,
      ImageConstant.imgTravelLuggage,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 100.h,
        title: Padding(
          padding: EdgeInsets.only(left: 8.h, top: 50.h),
          child: Text(
            'Stickers',
            style: theme.textTheme.headlineLarge,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.fillPrimary,
        child: GridView.builder(
          itemCount: imagePathsList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 35.0,
            mainAxisSpacing: 35.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return _stickerItem(context, imagePathsList[index]);
          },
        ),
      ),
    );
  }
}

Widget _stickerItem(BuildContext context, String imagePath) {
  return Container(
    child: InkWell(
      onTap: () {
        showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              //insetPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 250),
              title: Material(
                type: MaterialType.transparency,
                child: Container(
                  padding: const EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  child: CustomImageView(
                    width: 150.h,
                    height: 150.v,
                    imagePath: imagePath,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*Divider(
                    color: Colors.grey,
                    height: 40,
                    indent:1,
                  ),*/
                  Text(
                    'Send to messenger',
                    style: theme.textTheme.bodyLarge,
                  ),
                  Row(
                    children: [
                      //Twitter
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0, right: 8.0),
                        child: Material(
                          borderRadius: BorderRadius.all(Radius.circular(15.h)),
                          child: CustomIconButton(
                            //decoration: AppDecoration.fillPrimary,
                            height: 40.adaptSize,
                            width: 40.adaptSize,
                            padding: EdgeInsets.all(8.h),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgFrameLightBlue40001,
                              color: appTheme.lightBlue400,
                            ),
                            onTap: () async {
                              final image = await rootBundle.load(imagePath);
                              final buffer = image.buffer;
                              final result = await Share.shareXFiles(
                                [
                                  XFile.fromData(
                                    buffer.asUint8List(
                                      image.offsetInBytes,
                                      image.lengthInBytes,
                                    ),
                                    name: 'Sticker',
                                    mimeType: 'image/png',
                                  ),
                                ],
                              );

                              if (result.status == ShareResultStatus.success) {
                                print('Thank you for sharing the picture!');
                              }
                             /* final image = await rootBundle.load(imagePath);

                              LecleSocialShare.TW.shareFileToTwitter(
                                filePath:imagePath,
                                fileProviderPath: 'assets/images/',
                                fileType: AssetType.image,

                              );*/
                            },
                          ),
                        ),
                      ),
                      //Facebook
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.all(Radius.circular(15.h)),
                          child: CustomIconButton(
                            onTap: () async {
                              final image = await rootBundle.load(imagePath);
                              final buffer = image.buffer;
                              final result = await Share.shareXFiles(
                                [
                                  XFile.fromData(
                                    buffer.asUint8List(
                                      image.offsetInBytes,
                                      image.lengthInBytes,
                                    ),
                                    name: 'Sticker',
                                    mimeType: 'image/png',
                                  ),
                                ],
                              );

                              if (result.status == ShareResultStatus.success) {
                                print('Thank you for sharing the picture!');
                              }
                            },
                            height: 40.adaptSize,
                            width: 40.adaptSize,
                            padding: EdgeInsets.all(8.h),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgFrameBlueA400,
                              color: appTheme.blueA400,
                            ),
                          ),
                        ),
                      ),
                      //Telegram
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.all(Radius.circular(15.h)),
                          child: CustomIconButton(
                            height: 40.adaptSize,
                            width: 40.adaptSize,
                            padding: EdgeInsets.all(8.h),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgFrameLightBlue400,
                              color: appTheme.lightBlue400,
                            ),
                            onTap: () async {
                              final image = await rootBundle.load(imagePath);
                              final buffer = image.buffer;
                              final result = await Share.shareXFiles(
                                [
                                  XFile.fromData(
                                    buffer.asUint8List(
                                      image.offsetInBytes,
                                      image.lengthInBytes,
                                    ),
                                    name: 'Sticker',
                                    mimeType: 'image/png',
                                  ),
                                ],
                              );

                              if (result.status == ShareResultStatus.success) {
                                print('Thank you for sharing the picture!');
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style:
                        theme.textTheme.bodyLarge?.copyWith(color: Colors.red),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: CustomImageView(
        imagePath: imagePath,
      ),
    ),
  );
}
