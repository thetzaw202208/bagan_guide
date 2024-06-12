import 'package:bagan/constant/font.dart';
import 'package:bagan/provider/foods_provider.dart';
import 'package:bagan/provider/home_screen_provider.dart';
import 'package:bagan/static_data/hotel_static_data.dart';
import 'package:bagan/static_data/souvenir_menu_list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../constant/color.dart';
import '../../generated/locale_keys.g.dart';
import '../../utils/ads.dart';

class FoodDetailsScreen extends StatelessWidget {
  const FoodDetailsScreen({super.key, required this.souvenirData});
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
    return ChangeNotifierProvider<FoodsProvider>(
      create: (context) => FoodsProvider(),
      child: Consumer<FoodsProvider>(
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
                //https://youtu.be/9a8SY6Z_x1A
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.grey,
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: YoutubePlayer(
                          controller: data.controller!,
                          topActions: [
                            SizedBox(width: 8,),
                            Text(data.controller!.metadata.title)
                          ],
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: Colors.blueAccent,
                          onReady: () {
                            data.controller?.addListener(() {
                              data.playerState = data.controller!.value.playerState;
                              data.videoMetaData = data.controller!.metadata;
                            });
                            print('Player is ready.');
                          },
                          onEnded: (datas) {
                            data.controller?.load('iLnmTe5Q2Qw');
                          },
                        ),
                      ),
                    )


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
      ),
    );
  }
}
