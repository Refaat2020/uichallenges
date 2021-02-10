import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uiChallenges/washing_machine/provider/setting_provider.dart';
import 'package:uiChallenges/washing_machine/provider/theme_provider.dart';
import 'package:uiChallenges/washing_machine/utlits/colors.dart';

import 'neumorphic_icon_button.dart';

class SettingsBottomSheet extends StatefulWidget {
  @override
  _SettingsBottomSheetState createState() => _SettingsBottomSheetState();
}

class _SettingsBottomSheetState extends State<SettingsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: CustomColors.primaryColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(48), topRight: Radius.circular(48)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ThemeProvider>(
            builder: (context, value, _) {
              return NeumorphicIconButton(
                icon: Icon(Icons.brightness_low),
                color: CustomColors.icon,
                pressed: value.darkMode,
                onTap: () {
                  setState(() {
                    value.darkMode = !value.darkMode;
                  });
                },
              );
            },
          ),
          SizedBox(
            width: 60,
          ),
          Consumer<SettingsProvider>(
            builder: (context, value, _) {
              return NeumorphicIconButton(
                icon: Icon(value.devMode ? Icons.blur_off : Icons.blur_on),
                color: CustomColors.icon,
                onTap: () {
                  setState(() {
                    value.devMode = !value.devMode;
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}