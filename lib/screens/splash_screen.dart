import 'dart:async';
import 'package:bagan/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
  }
  init()async{

      Future.delayed(const Duration(seconds: 2),(){
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
                (Route<dynamic> route) => false);
      });

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
            body: Image.asset("assets/images/bagan1.png",fit: BoxFit.cover,height: MediaQuery.of(context).size.height,),
          );}



}
