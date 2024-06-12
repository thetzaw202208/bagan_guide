import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../utils/ads.dart';

class HorseRentalBaganScreen extends StatelessWidget {
  const HorseRentalBaganScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RewardedAdManager rewardedAdManager = RewardedAdManager();
    return Scaffold(
      //backgroundColor:Colors.white.withOpacity(0.9),
      body: Center(
          child: Image.asset(
            'assets/images/stay_tuned.png',
            fit: BoxFit.cover,
          )
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
