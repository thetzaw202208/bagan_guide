import 'package:bagan/provider/home_screen_provider.dart';
import 'package:bagan/provider/language_switch_provider.dart';
import 'package:bagan/screens/splash_screen.dart';
import 'package:bagan/utils/ads.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'generated/codegen_loader.g.dart';

void main() {
  initialization();
  runApp( EasyLocalization(
    supportedLocales: const [
      Locale(
        'en',
      ),
      Locale("my"),

    ],
    startLocale: const Locale('en'),
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
    useFallbackTranslations: true,
    useOnlyLangCode: true,
    assetLoader: const CodegenLoader(),
    child: const MyApp(),
  ));
}
initialization()async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  RewardedAdManager.initialization();

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [

        ChangeNotifierProvider<LanguageSwitchProvider>(
            create: (_) => LanguageSwitchProvider()),
        ChangeNotifierProvider<HomeScreenProvider>(
            create: (_) => HomeScreenProvider()),
      ],
      child: MaterialApp(
      localizationsDelegates:context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
