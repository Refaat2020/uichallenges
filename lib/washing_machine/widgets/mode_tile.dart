import 'package:flutter/material.dart';
import 'package:uiChallenges/washing_machine/utlits/colors.dart';
import 'package:uiChallenges/washing_machine/utlits/constant.dart';
import 'package:uiChallenges/washing_machine/widgets/indicator.dart';
import 'package:uiChallenges/washing_machine/widgets/neumorphic_button.dart';

import 'mode_tile_indecator.dart';

class ModeTile extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final String name;
  final int minutes;
  final bool pressed;
  final Color indecatorColor;
  final GestureTapCallback onTap;
  final bool disable;

  ModeTile({this.margin, this.name, this.minutes, this.pressed,
      this.indecatorColor, this.onTap, this.disable});

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onTap: onTap,
        color: indecatorColor,
        width: 120,
        disabled: disable,
        margin: EdgeInsets.only(
            left: Global_EDGE_Margin_value,
          top: 15,
          bottom: 15,
        ),
        pressed: pressed,
        child: Padding(
          padding: EdgeInsets.only(
            left: 5,
            top: 5,
            right: 8,
            bottom: 8,
          ),
          child: Column(
            children: [
              ModeTileIndecator(
                color: indecatorColor,
              ),
              Expanded(
                  child: Container(),
              ),
              Text(name,style: TextStyle(
                fontSize: 16,
                color: CustomColors.primaryTextColor,
                fontWeight: FontWeight.w700,

              ),
              ),
              SizedBox(height: 6,),
              Text("$minutes minutes",style: TextStyle(
                fontSize: 13,
                color: CustomColors.secondaryTextColor,
                fontWeight: FontWeight.w400,
              ),)
            ],
          ),
        ),
    );
  }
}
