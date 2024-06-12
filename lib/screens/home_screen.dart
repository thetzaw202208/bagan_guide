import 'package:bagan/constant/color.dart';
import 'package:bagan/constant/font.dart';
import 'package:bagan/screens/beauty_places/beauty_places_screen.dart';
import 'package:bagan/screens/foods/foods_screen.dart';
import 'package:bagan/screens/horse_rental/horse_rental_screen.dart';
import 'package:bagan/screens/hotel/hotel_screen.dart';
import 'package:bagan/screens/prominent_people/kings_of_bagan.dart';
import 'package:bagan/screens/souvenir/souvenir_screen.dart';
import 'package:bagan/utils/screen_route_ext.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../generated/locale_keys.g.dart';
import '../provider/home_screen_provider.dart';
import 'app_info_screen.dart';
import 'pagoda_history/history_of_pagodas_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = [
    const HistoryOfPagodasScreen(),
    const KingsOfBaganScreen(),
    const HotelBaganScreen(),
    const SouvenirScreen(),
    const FoodsScreen(),
    const BeautyPlacesOfBaganScreen(),
    const HorseRentalBaganScreen(),
    // Add more pages here
  ];

  @override
  Widget build(BuildContext context) {
    final homeScreenProvider =
        Provider.of<HomeScreenProvider>(context, listen: false);
    homeScreenProvider.init(context);

    List<String> bannerMenuList = [
      LocaleKeys.historyofpagodas.tr(),
      LocaleKeys.kingsofbagan.tr(),
      LocaleKeys.hotel.tr(),
      LocaleKeys.souvenir.tr(),
      LocaleKeys.food.tr(),
      LocaleKeys.beautyplaces.tr(),
      LocaleKeys.horsecarriage.tr(),
      // Add more menu items here
    ];

    return Scaffold(
      //backgroundColor: primaryColor.withOpacity(0.8),

      appBar: AppBar(
        //backgroundColor:primaryColor.withOpacity(0.5),
        title: Text(LocaleKeys.appName.tr(), style: kAppBarTextStyle),
        actions: [
          IconButton(
            onPressed: () => homeScreenProvider.showPopupMenu(context),
            icon: const Icon(
              Icons.language,
              color: primaryColor,
            ),
          ),
          IconButton(
            onPressed: () {
              context.navigateAndRemoveUntil(const AppInfoScreen(), true);
            },
            icon: const Icon(Icons.info, color: primaryColor),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: bannerMenuList.length * 400.0,
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: bannerMenuList.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    homeScreenProvider.selectedIndex = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 3,
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            color: homeScreenProvider.selectedIndex == index
                                ? primaryColor
                                : secondaryColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                            child: Text(
                          bannerMenuList[index],
                          style: TextStyle(
                              color: homeScreenProvider.selectedIndex == index
                                  ? textSecondaryColor
                                  : textPrimaryColor,
                              fontFamily: 'Poppins'),
                        ))),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: _pages[homeScreenProvider.selectedIndex],
          ),
        ],
      ),
    );
  }
}
