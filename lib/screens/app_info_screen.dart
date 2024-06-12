import 'package:bagan/constant/font.dart';
import 'package:bagan/constant/string.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../constant/color.dart';
import '../generated/locale_keys.g.dart';
import '../utils/ads.dart';

class AppInfoScreen extends StatefulWidget {
  const AppInfoScreen({super.key});

  @override
  State<AppInfoScreen> createState() => _AppInfoScreenState();
}

class _AppInfoScreenState extends State<AppInfoScreen> {
  RewardedAdManager rewardedAdManager = RewardedAdManager();
  @override
  void initState() {

    super.initState();
    rewardedAdManager.loadRewardAd();

  }
  @override
  Widget build(BuildContext context) {
    rewardedAdManager.loadRewardAd();
    return Scaffold(
      //backgroundColor:Colors.white.withOpacity(0.9),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: primaryColor),
        title:  Text(LocaleKeys.appInfoTitle.tr(),style: kAppBarTextStyle,),
        actions: [
          IconButton(
              onPressed: () {
                rewardedAdManager.showRewardAd();
              },
              icon: Text(LocaleKeys.help.tr(),style: kLabelTextStylePrimary,))

        ],
      ),
      body: ListView(
        children:[

          Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(LocaleKeys.appinfo.tr(),style: kLabelTextStyleNormal,),
        ),

        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(5.0),
        child: IgnorePointer(
          ignoring: true,
          child: SizedBox(
            height: 50,
            child: AdWidget(
              ad: rewardedAdManager.getBannerAd()..load(),
              key: UniqueKey(),
            ),
          ),
        )

      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(15.0),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text(LocaleKeys.version.tr(),style: kSmallLabelTextStylePrimary,),
      //       SizedBox(width: 10,),
      //       Text(appVersion,style: kSmallLabelTextStylePrimary,),
      //     ],
      //   ),
      // ),
    );
  }
}
