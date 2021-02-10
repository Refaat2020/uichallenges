
import 'package:flutter/material.dart';

import 'main_screen.dart';

class HairSalonsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: "Hair Salons App",
      home: MainScreen(),
    );
  }
}
