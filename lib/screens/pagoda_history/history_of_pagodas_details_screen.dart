import 'package:bagan/constant/font.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../constant/color.dart';
import '../../utils/ads.dart';

class PagodasHistoryDetailsScreen extends StatelessWidget {
  const PagodasHistoryDetailsScreen(
      {super.key,
      required this.pagodaName,
      required this.pagodaImage,
      required this.pagodaDescription});
  final String pagodaName;
  final String pagodaImage;
  final String pagodaDescription;
  @override
  Widget build(BuildContext context) {
    RewardedAdManager rewardedAdManager = RewardedAdManager();
    return Scaffold(
        //backgroundColor:Colors.white.withOpacity(0.9),
        appBar: AppBar(
          //backgroundColor:Colors.white.withOpacity(0.9),
          centerTitle: true,
          iconTheme: const IconThemeData(color: primaryColor),
          title: Text(
            pagodaName,
            style: kAppBarTextStyle,
          ),
        ),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(pagodaImage,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 200.0)
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                pagodaDescription,
                style: kLabelTextStyleNormal,
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
            )));
  }
}
