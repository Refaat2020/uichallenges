
import 'package:get_it/get_it.dart';
import 'package:uiChallenges/washing_machine/provider/main_provider.dart';
import 'package:uiChallenges/washing_machine/provider/setting_provider.dart';
import 'package:uiChallenges/washing_machine/provider/theme_provider.dart';
import 'package:uiChallenges/washing_machine/provider/timer_provider.dart';
import 'package:uiChallenges/washing_machine/widgets/washing_machine_controller.dart';

GetIt  getIt = GetIt.instance;

class ServicesLocator{
  static init(){
    getIt.registerSingleton<ThemeProvider>(ThemeProvider());
    getIt.registerSingleton<TimerProvider>(TimerProvider());
    getIt.registerSingleton<WashingMachineController>(WashingMachineController(ballsCount: 16));
    getIt.registerSingleton<SettingsProvider>(SettingsProvider());
    getIt.registerSingleton<MainProvider>(MainProvider());

  }
  static T get<T>(){
    return getIt.get<T>();
  }
}