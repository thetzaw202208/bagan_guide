import 'package:bagan/constant/font.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../constant/color.dart';
import '../../utils/ads.dart';

class KingsOfBaganDetailsScreen extends StatelessWidget {
  const KingsOfBaganDetailsScreen(
      {super.key, required this.kingName, required this.kingDescription});
  final String kingName;
  final String kingDescription;

  @override
  Widget build(BuildContext context) {
    RewardedAdManager rewardedAdManager = RewardedAdManager();
    return Scaffold(
        //backgroundColor:Colors.white.withOpacity(0.9),
        appBar: AppBar(
          //backgroundColor:Colors.white.withOpacity(0.9),
          centerTitle: true,
          iconTheme: const IconThemeData(color: primaryColor),
          title: Text(kingName, style: kAppBarTextStyle),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                kingDescription,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
            //color:Colors.grey,
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
            ))
    );
  }
}
