import 'package:bagan/constant/font.dart';
import 'package:bagan/provider/home_screen_provider.dart';
import 'package:bagan/static_data/hotel_static_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../../constant/color.dart';
import '../../generated/locale_keys.g.dart';
import '../../utils/ads.dart';

class HotelDetailsScreen extends StatelessWidget {
  const HotelDetailsScreen({super.key, required this.hotelData});
  final HotelStaticData hotelData;

  @override
  Widget build(BuildContext context) {
    RewardedAdManager rewardedAdManager = RewardedAdManager();
    final List<Widget> imageSliders = hotelData.images
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
              hotelData.name,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      data.launchURL(hotelData.direction);
                    },
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(50),
                      child: Container(

                        padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(50),
                          //border: Border.all(color: primaryColor.withOpacity(0.5)),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.directions,
                              color: primaryColor,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              LocaleKeys.getDirection.tr(),
                              style: kLabelTextStylePrimary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      data.makePhoneCall(hotelData.phone);
                    },
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(50),
                         // border: Border.all(color: primaryColor.withOpacity(0.5)),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.phone,
                              color: primaryColor,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              LocaleKeys.callNow.tr(),
                              style: kLabelTextStylePrimary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  LocaleKeys.aboutHotel.tr(),
                  style:
                      const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,fontFamily: 'Poppins',),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  hotelData.description,
                  style: const TextStyle(
                    fontSize: 14,fontFamily: 'Poppins',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: Text(
                  LocaleKeys.address.tr(),
                  style:
                      const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,fontFamily: 'Poppins',),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hotelData.address,
                      style: const TextStyle(
                        fontSize: 14,fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      hotelData.phone,
                      style: const TextStyle(
                        fontSize: 14,fontFamily: 'Poppins',
                      ),
                    ),
                  ],
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
