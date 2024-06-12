import 'package:bagan/constant/font.dart';
import 'package:bagan/provider/home_screen_provider.dart';
import 'package:bagan/static_data/hotel_static_data.dart';
import 'package:bagan/static_data/souvenir_menu_list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../../constant/color.dart';
import '../../generated/locale_keys.g.dart';
import '../../utils/ads.dart';

class SouvenirDetailsScreen extends StatelessWidget {
  const SouvenirDetailsScreen({super.key, required this.souvenirData});
  final SouvenirData souvenirData;

  @override
  Widget build(BuildContext context) {
    RewardedAdManager rewardedAdManager = RewardedAdManager();
    final List<Widget> imageSliders = souvenirData.images
        .map((item) => Container(
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.asset(item, fit: BoxFit.cover, width: MediaQuery.of(context).size.width,)

            ],
          )),
    ))
        .toList();
    return Consumer<HomeScreenProvider>(
      builder: (context,data,_)=>
          Scaffold(
            //backgroundColor:Colors.white.withOpacity(0.9),
              appBar: AppBar(
                //backgroundColor:Colors.white.withOpacity(0.9),
                centerTitle: true,
                iconTheme: const IconThemeData(color: primaryColor),
                title: Text(
                  souvenirData.name,
                  style: kAppBarTextStyle,
                ),
              ),
              body: ListView(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      initialPage: 0,
                      autoPlay: true,
                    ),
                    items: imageSliders,
                  ),
                  SizedBox(
                    height: 20,
                  ),




                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      souvenirData.description,
                      style: const TextStyle(
                        fontSize: 14,fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
          ),
    );
  }
}
