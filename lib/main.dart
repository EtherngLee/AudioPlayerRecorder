import 'package:permission_handler/permission_handler.dart';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

import 'player.dart';
import 'recorder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Audio",
      debugShowCheckedModeBanner: false,
      home: new MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;
  int currentIndex = 0;
  final screens = [Recorder(), Player()];
  // @override
  // void initstate() {
  //   super.initState();
  //   initRecorder();
  // }

  // @override
  // void dispose() {
  //   recorder.closeRecorder();

  //   super.dispose();
  // }

  // Future initRecorder() async {
  //   final status = await Permission.microphone.request();

  //   if (status != PermissionStatus.granted) {
  //     throw "Microphone permision not granted";
  //   }

  //   await recorder.openRecorder();

  //   isRecorderReady = true;
  //   recorder.setSubscriptionDuration(
  //     const Duration(milliseconds: 500),
  //   );
  // }

  // Future record() async {
  //   if (!isRecorderReady) return;
  //   await recorder.startRecorder(toFile: "audio");
  // }

  // Future stop() async {
  //   if (!isRecorderReady) return;
  //   final path = await recorder.stopRecorder();
  //   // final audioFile = File(path!);

  //   // print("Recorded audio: $audioFile");
  // }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: IndexedStack(
          //keeps current state for each of the pages
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.blue,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            iconSize: 30,
            showUnselectedLabels: false,
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.multitrack_audio_rounded),
                label: "Recorder",
                backgroundColor: Colors.red,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.audiotrack),
                label: "Player",
                backgroundColor: Colors.blue,
              ),
            ]),
      );
}
