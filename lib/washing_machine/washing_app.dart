import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uiChallenges/washing_machine/locator/service_locator.dart';
import 'package:uiChallenges/washing_machine/provider/main_provider.dart';
import 'package:uiChallenges/washing_machine/provider/setting_provider.dart';
import 'package:uiChallenges/washing_machine/provider/theme_provider.dart';
import 'package:uiChallenges/washing_machine/provider/timer_provider.dart';
import 'package:uiChallenges/washing_machine/waching.dart';

class WashingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(
          create: (context) => ServicesLocator.get<ThemeProvider>(),
      ),
        ChangeNotifierProvider(
          create: (context) => ServicesLocator.get<TimerProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => ServicesLocator.get<MainProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => ServicesLocator.get<SettingsProvider>(),
        ),
      ],
        child: MaterialApp(
          home: WashingMachineMainPage(),
        ));
  }
}
