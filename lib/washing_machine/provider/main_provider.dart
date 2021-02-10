import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:uiChallenges/washing_machine/enum_mode_status.dart';
import 'package:uiChallenges/washing_machine/locator/service_locator.dart';
import 'package:uiChallenges/washing_machine/models/mode_item.dart';
import 'package:uiChallenges/washing_machine/provider/timer_provider.dart';

import 'package:uiChallenges/washing_machine/widgets/washing_machine_controller.dart';
class MainProvider with ChangeNotifier {
  MainViewModel() {
    selectMode(nodes.first);
  }

  List<ModeItemModel> nodes = const [
    ModeItemModel(
      name: 'Standard',
      mint: 32,
      color: Color.fromRGBO(61, 111, 252, 1),
    ),
    ModeItemModel(
      name: 'Gentle',
      mint:  24,
      color: Color.fromRGBO(50, 197, 253, 1),
    ),
    ModeItemModel(
      name: 'Fast',
      mint: 12,
      color: Color.fromRGBO(253, 133, 53, 1),
    ),
  ];

  double get waterValue => _waterValue;

  set waterValue(double value) {
    _waterValue = value;
    notifyListeners();
  }

  ModeItemModel get selectedMode => _selectedMode;

  ModeStatus get modeStatus => _modeStatus;

  double _waterValue = 600.0;
  ModeItemModel _selectedMode;
  ModeStatus _modeStatus = ModeStatus.notStarted;

  runOrPause() {
    if (selectedMode == null) {
      return;
    }

    var timerVM = ServicesLocator.get<TimerProvider>();
    var washingMachineController = ServicesLocator.get<WashingMachineController>();

    if (modeStatus == ModeStatus.running) {
      _modeStatus = ModeStatus.paused;
      timerVM.pause();
      washingMachineController.setAngularVelocity(0, seconds: 1);
    } else if (modeStatus == ModeStatus.paused) {
      _modeStatus = ModeStatus.running;
      washingMachineController.setAngularVelocity(-15, seconds: 7);
      timerVM.resume();
    } else if (modeStatus == ModeStatus.notStarted) {
      _modeStatus = ModeStatus.running;

      if (!washingMachineController.hasBalls()) {
        washingMachineController.initializeBalls();
      }

      timerVM.start(Duration(minutes: selectedMode.mint));

      Timer.periodic(Duration(seconds: !washingMachineController.hasBalls() ? 2 : 0), (timer) {
        timer.cancel();
        if (modeStatus != ModeStatus.running) {
          return;
        }

        washingMachineController.setAngularVelocity(-15, seconds: 7);
      });
    }

    notifyListeners();
  }

  stop() {
    var washingMachineController = ServicesLocator.get<WashingMachineController>();
    var timerVM = ServicesLocator.get<TimerProvider>();

    washingMachineController.setAngularVelocity(0, seconds: 3);
    _modeStatus = ModeStatus.notStarted;
    timerVM.reset(true);

    notifyListeners();
  }

  selectMode(ModeItemModel mode) {
    if (mode == _selectedMode) {
      return;
    }
    if (_modeStatus == ModeStatus.running) {
      return;
    }
    _selectedMode = mode;
    _modeStatus = ModeStatus.notStarted;

    var timerVM = ServicesLocator.get<TimerProvider>();
    timerVM.reset(true);
    notifyListeners();

    int sign = Random().nextBool() ? 1 : -1;
    ServicesLocator.get<WashingMachineController>().setAngularVelocity(9.0 * sign, stopAtEnd: true, seconds: 0.6);
  }
}