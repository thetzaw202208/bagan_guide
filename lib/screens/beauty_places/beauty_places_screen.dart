import 'package:flutter/material.dart';

class BeautyPlacesOfBaganScreen extends StatelessWidget {
  const BeautyPlacesOfBaganScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor:Colors.white.withOpacity(0.9),
      body: Center(
        child: Image.asset(
          'assets/images/stay_tuned.png',
          fit: BoxFit.cover,
        )
      ),);
  }
}
