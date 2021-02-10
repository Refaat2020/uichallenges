import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uiChallenges/video.dart';
import 'package:uiChallenges/washing_machine/locator/service_locator.dart';
import 'package:uiChallenges/washing_machine/washing_app.dart';
import 'coffee_berw/screens/dashboard.dart';
import 'hair_salons/hair_main.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator.init();
  runApp(WashingApp());
  SystemChrome.setEnabledSystemUIOverlays([
    SystemUiOverlay.bottom,
  ]);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: VideoScreen(),
    );
  }
}
