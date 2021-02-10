
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uiChallenges/washing_machine/provider/timer_provider.dart';
import 'package:uiChallenges/washing_machine/widgets/neumorphic_container.dart';
import 'package:uiChallenges/washing_machine/utlits/colors.dart';

class TimeLinePanel extends StatefulWidget {
  TimeLinePanel({Key key}) : super(key: key);

  @override
  _TimeLinePanelState createState() => _TimeLinePanelState();
}

class _TimeLinePanelState extends State<TimeLinePanel> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicContainer(
      width: 115,
      height: 52,
      pressed: true,
      border: Border.all(color: CustomColors.timerPanelBorder,
        width: 2
      ),
      child: Center(
       child: Consumer<TimerProvider>(
         builder: (context, value, child) {
           return Text(value.reminingString, style: TextStyle(
               color: CustomColors.secondaryTextColor,
             letterSpacing: 3,
             fontSize: 22,
           ),
           );
         },
       )
      ),
    );
  }
}