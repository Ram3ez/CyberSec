//import "dart:io";

import "package:cyber_sec/components/base_page.dart";
import "package:cyber_sec/components/custom_dialog.dart";
import "package:flutter/material.dart";
//import "package:video_player_win/video_player_win.dart";
//import 'package:video_player/video_player.dart';

class VideoTestPage extends StatelessWidget {
  const VideoTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    //var controller = VideoPlayerController.file(File("E:\\test.mp4"));
    return BasePage(
      dialog: CustomDialog(title: "Video Test", body: "Random Test"),
      title: "Video Tester",
      child: Scaffold(body: Column()),
    );
  }
}
