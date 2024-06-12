
import 'package:bagan/screens/hotel/hotel_details_screen.dart';
import 'package:bagan/utils/screen_route_ext.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/color.dart';
import '../../generated/locale_keys.g.dart';
import '../../provider/home_screen_provider.dart';
import '../../static_data/hotel_static_data.dart';
import '../pagoda_history/history_of_pagodas_details_screen.dart';

class HotelBaganScreen extends StatefulWidget {
  const HotelBaganScreen({super.key});

  @override
  State<HotelBaganScreen> createState() => _HotelBaganScreenState();
}

class _HotelBaganScreenState extends State<HotelBaganScreen> {
  @override
  Widget build(BuildContext context) {
    final homeScreenProvider = Provider.of<HomeScreenProvider>(context, listen: false);
    homeScreenProvider.init(context);
    List<HotelStaticData> hotelList = [
      HotelStaticData(
        LocaleKeys.baganViewHotel.tr(),
        LocaleKeys.baganViewHotelAddress.tr(),
        '+959444790476',
        LocaleKeys.baganViewHotelDescription.tr(),
        ['assets/images/bagan-view-hotel/2.png', 'assets/images/bagan-view-hotel/1.png', 'assets/images/bagan-view-hotel/3.png', 'assets/images/bagan-view-hotel/4.png', 'assets/images/bagan-view-hotel/5.png', 'assets/images/bagan-view-hotel/6.png'],
        'https://maps.app.goo.gl/Ryvq3eMXk938fVxD6',
      ),
      HotelStaticData(
        LocaleKeys.aLittleBitHotel.tr(),
        LocaleKeys.aLittleBitHotelAddress.tr(),
        '+95 9 204 3601',
        LocaleKeys.aLittleBitHotelDescription.tr(),
        ['assets/images/alittle-bit-of-bagan/1.png', 'assets/images/alittle-bit-of-bagan/2.png', 'assets/images/alittle-bit-of-bagan/3.png', 'assets/images/alittle-bit-of-bagan/4.png', 'assets/images/alittle-bit-of-bagan/5.png', 'assets/images/alittle-bit-of-bagan/6.png'],
        'https://maps.app.goo.gl/tLDU5CPuvNtUo8ex9',
      ),
      HotelStaticData(
        LocaleKeys.heritageHotel.tr(),
        LocaleKeys.heritageHotelAddress.tr(),
        '+95 61 246 1193',
        LocaleKeys.heritageHotelDescription.tr(),
        ['assets/images/heritage/1.png', 'assets/images/heritage/2.png', 'assets/images/heritage/3.png', 'assets/images/heritage/4.png', 'assets/images/heritage/5.png', 'assets/images/heritage/6.png', 'assets/images/heritage/7.png', 'assets/images/heritage/8.png'],
        'https://maps.app.goo.gl/MoDJDDsoQkwvoEgQ7',
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

              itemCount: hotelList.length,
              itemBuilder: (context,index)=>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                       context.navigateAndRemoveUntil(HotelDetailsScreen(hotelData: hotelList[index]), true);
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
                                            image: AssetImage(hotelList[index].images[0]),
                                            fit: BoxFit.cover
                                        )
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(hotelList[index].name,style: const TextStyle(
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
