import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/images.dart';

class LanguageSwitchProvider extends ChangeNotifier {

  String selectedLan = "", showLan = "";
  void showPopupMenu(BuildContext context) {
    // Display the popup menu when the custom text is tapped
    final RenderBox bar = context.findRenderObject() as RenderBox;
    final Offset position = bar.localToGlobal(Offset.zero);

    showMenu<String>(
      surfaceTintColor: Colors.white.withOpacity(0.5),
      color: const Color(0xfff6f6f6),
      context: context,
      position: RelativeRect.fromLTRB(
        580,
        kToolbarHeight + 20,
        position.dx,
        position.dy + kToolbarHeight + bar.size.height,
      ),
      items: <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'English',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Image.asset(
                  kUSAFlagPath,
                  width: 20,
                  height: 20,
                  // width: 18,
                  // height: 20,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text('  English', textAlign: TextAlign.start),
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                (selectedLan == "English") ? kCheckedImgPath : kNoCheckImgPath,
                width: 24,
                height: 30,
              ),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'မြန်မာ',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Image.asset(
                  kMyanmarFlagBigPath,
                  width: 20,
                  height: 20,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  'မြန်မာ',
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                (selectedLan == "မြန်မာ") ? kCheckedImgPath : kNoCheckImgPath,
                width: 24,
                height: 30,
              ),
            ],
          ),
        ),
      ],
    ).then((value) async {
      if (value != null) {
        SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

        selectedLan = value;
        showLan = selectedLan;

        if (selectedLan == "English") {
          sharedPreferences.setString("lan", "en");
          context.setLocale(const Locale('en'));
        }
        if (selectedLan == "မြန်မာ") {
          sharedPreferences.setString("lan", "my");
          context.setLocale(const Locale('my'));
        }
        notifyListeners();
        // Handle the selected menu item here
      }
    });
  }

  init(BuildContext context) async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    var lan = sh.getString("lan");
    if (lan == "en" || lan == null) {
      context.setLocale(const Locale("en"));
      selectedLan = "English";
      showLan = selectedLan;
      notifyListeners();
    }
    if (lan == "my") {
      context.setLocale(const Locale("my"));
      selectedLan = "မြန်မာ";
      showLan = selectedLan;
      notifyListeners();
    }
  }
}