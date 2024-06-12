import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../generated/locale_keys.g.dart';
import 'language_switch_provider.dart';

class HomeScreenProvider extends LanguageSwitchProvider {
int selectedIndex = 0;
late PlayerState playerState;
bool isPlayerReady = false;
late YoutubeMetaData videoMetaData;
late YoutubePlayerController controller;
  HomeScreenProvider() {
    controller = YoutubePlayerController(
      initialVideoId: '9a8SY6Z_x1A',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    videoMetaData = const YoutubeMetaData();
    playerState = PlayerState.unknown;
notifyListeners();
  }
void listener() {
  if (isPlayerReady &&  !controller.value.isFullScreen) {

    playerState = controller.value.playerState;
    videoMetaData = controller.metadata;

  }
}
void selectIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
  @override
  void init(BuildContext context) {
    super.init(context);
  }

void launchURL(String urlString) async {
  if (await canLaunchUrl(Uri.parse(urlString))) {
    await launchUrl(Uri.parse(urlString));
    notifyListeners();
  } else {
    throw 'Could not launch $urlString';
  }
}
void makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
  notifyListeners();
}
  @override
  void showPopupMenu(BuildContext context) => super.showPopupMenu(context);
}