import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uiChallenges/washing_machine/enum_mode_status.dart';
import 'package:uiChallenges/washing_machine/provider/main_provider.dart';
import 'package:uiChallenges/washing_machine/utlits/colors.dart';
import 'package:uiChallenges/washing_machine/widgets/indicator.dart';
import 'package:uiChallenges/washing_machine/widgets/neumorphic_button.dart';

import 'neumorphic_icon_button.dart';

class FunctionListButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var margin = EdgeInsets.only(bottom: 28);
    return Consumer<MainProvider>(
      builder: (context, value, child) {
        return Column(
          children: [
            Padding(
              padding: margin,
              child: Indicator(
                color: value?.selectedMode ?.color,
                blink: value?.modeStatus == ModeStatus.running,
              ),
            ),
            NeumorphicIconButton(
              margin: margin,
                icon: Icon(Icons.power_settings_new),
              color: CustomColors.icon,
              onTap: ()=>value.stop(),
                ),
            NeumorphicIconButton(
              margin: margin,
              icon: Icon(Icons.opacity),
              color: CustomColors.icon,
              onTap: ()=>Scaffold.of(context).openDrawer(),
            ),
            NeumorphicIconButton(
              margin: margin,
              icon: Icon(value.modeStatus == ModeStatus.running ? Icons.pause : Icons.play_arrow),
              color: CustomColors.icon,
              onTap: ()=>value.runOrPause(),
            ),
          ],
        );
      },
    );
  }
}
