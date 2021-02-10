import 'package:flutter/material.dart';
import 'package:uiChallenges/washing_machine/utlits/colors.dart';
import 'package:uiChallenges/washing_machine/utlits/constant.dart';
import 'package:uiChallenges/washing_machine/widgets/neumorphic_icon_button.dart';
import 'package:uiChallenges/washing_machine/widgets/settings_bottom_sheet.dart';
import 'package:uiChallenges/washing_machine/widgets/time_line_panel.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(Global_EDGE_Margin_value, Drawer_BUTTON_MARGIN_TOP, 18, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NeumorphicIconButton(
              icon: Icon(Icons.settings , color: CustomColors.icon,),
            onTap: (){
                showModalBottomSheet(context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => SettingsBottomSheet(),);
            },
          ),
          TimeLinePanel()
        ],
      ),
    );
  }
}
