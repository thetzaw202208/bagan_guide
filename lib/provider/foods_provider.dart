import 'package:flutter/foundation.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FoodsProvider extends ChangeNotifier {
  late PlayerState playerState;
  late YoutubeMetaData videoMetaData;
   YoutubePlayerController? controller;

  ///Constructor
  FoodsProvider() {

    controller = YoutubePlayerController(
      initialVideoId: '9a8SY6Z_x1A',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    videoMetaData = const YoutubeMetaData();
    playerState = PlayerState.unknown;
    notifyListeners();
  }



}