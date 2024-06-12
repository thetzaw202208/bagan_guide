
import 'package:bagan/screens/hotel/hotel_details_screen.dart';
import 'package:bagan/screens/souvenir/souvenir_details_screen.dart';
import 'package:bagan/static_data/souvenir_menu_list.dart';
import 'package:bagan/utils/screen_route_ext.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/color.dart';
import '../../generated/locale_keys.g.dart';
import '../../provider/home_screen_provider.dart';
import '../../static_data/hotel_static_data.dart';
import '../pagoda_history/history_of_pagodas_details_screen.dart';

class SouvenirScreen extends StatefulWidget {
  const SouvenirScreen({super.key});

  @override
  State<SouvenirScreen> createState() => _SouvenirScreenState();
}

class _SouvenirScreenState extends State<SouvenirScreen> {
  @override
  Widget build(BuildContext context) {
    final homeScreenProvider = Provider.of<HomeScreenProvider>(context, listen: false);
    homeScreenProvider.init(context);
    List<SouvenirData> souvenirList = [
      SouvenirData(
        LocaleKeys.lacquerWare.tr(),
        LocaleKeys.lacquerWareDescription.tr(),

        ['assets/images/souvenir/lacqureware.png', 'assets/images/souvenir/lac1.png', 'assets/images/souvenir/lac2.png', 'assets/images/souvenir/lac3.png', 'assets/images/souvenir/lac4.png'],

      ),
      SouvenirData(
        LocaleKeys.ponyaygyi.tr(),
        LocaleKeys.ponyaygyiDescription.tr(),

        ['assets/images/souvenir/pone1.png', 'assets/images/souvenir/pone.png', 'assets/images/souvenir/pone2.png', 'assets/images/souvenir/pone3.png', 'assets/images/souvenir/pone4.png','assets/images/souvenir/pone5.png','assets/images/souvenir/pone6.png'],

      ),
      SouvenirData(
        LocaleKeys.yotethay.tr(),
        LocaleKeys.yotethayDescription.tr(),

        ['assets/images/souvenir/yokethay.png', 'assets/images/souvenir/yokethay6.png', 'assets/images/souvenir/yokethay2.png', 'assets/images/souvenir/yotethay1.png', 'assets/images/souvenir/yokethay4.png', 'assets/images/souvenir/yokethay5.png', 'assets/images/souvenir/yokethayshow.png'],

      ),
    ];
    return Scaffold(
      //backgroundColor:Colors.white.withOpacity(0.9),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*150,
            child: ListView.builder(

              itemCount: souvenirList.length,
              itemBuilder: (context,index)=>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        context.navigateAndRemoveUntil(SouvenirDetailsScreen(souvenirData: souvenirList[index]), true);
                      },
                      child: Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height*0.2,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)
                                        ),
                                        image:  DecorationImage(
                                            image: AssetImage(souvenirList[index].images[1]),
                                            fit: BoxFit.cover
                                        )
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(souvenirList[index].name,style: const TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor
                                    ),),
                                  )
                                ]
                            ),
                          )
                      ),
                    ),
                  ),
            ),
          ),
        ));
  }
}
