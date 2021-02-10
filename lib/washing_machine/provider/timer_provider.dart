import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiver/async.dart';

class TimerProvider with ChangeNotifier{
  Duration _pusedRemining;
  CountdownTimer _countdownTimer;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _countdownTimer.cancel();
  }

  Duration get remining{
    if(_pusedRemining != null){
      return _pusedRemining;
    }
    return _countdownTimer ?.isRunning == true ? _countdownTimer.remaining : Duration.zero;
  }

 String get reminingString{
    int totalSeconds = remining.inSeconds;
    int minuts = (totalSeconds / 60 ).floor();
    int second = totalSeconds%60;
    String minutsString = minuts > 9 ? minuts.toString() : "0$minuts";
    String secondsString =  second > 9 ? second.toString() : "0$second";
    return "$minutsString:$secondsString";
 }
 start(Duration duration){
    if(duration == null)
      {
        return;
      }
    reset(true);
    _countdownTimer  = CountdownTimer(duration, Duration(seconds: 1));
    _countdownTimer.listen((event) => notifyListeners());
 }

 reset(bool callNotifyListeners){
_pusedRemining = null;
_countdownTimer?.cancel();

if(callNotifyListeners == true)
  {
    notifyListeners();
  }
 }
 resume(){
    start(_pusedRemining);
 }
 pause(){
    _pusedRemining = remining;
    _countdownTimer?.cancel();
    notifyListeners();
 }
}