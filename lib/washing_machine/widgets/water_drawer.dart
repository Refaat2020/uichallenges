import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uiChallenges/washing_machine/provider/main_provider.dart';
import 'package:uiChallenges/washing_machine/utlits/colors.dart';
import 'package:uiChallenges/washing_machine/utlits/constant.dart';
import 'package:uiChallenges/washing_machine/widgets/water_slider.dart';

import 'neumorphic_icon_button.dart';

class WaterDrawer extends StatelessWidget {
const WaterDrawer({Key key}) : super(key: key);

@override
Widget build(BuildContext context) {
  return Consumer<MainProvider>(
    builder: (context, viewModel, _) {
      return Container(
        color: CustomColors.primaryColor,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: Global_EDGE_Margin_value,
              top: Drawer_BUTTON_MARGIN_TOP,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                NeumorphicIconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                    color: CustomColors.icon,
                  ),
                  onTap: () => Navigator.pop(context),
                ),
                SizedBox(height: 35),
                Text(
                  'Choose water',
                  style: TextStyle(
                    fontSize: 26,
                    color: CustomColors.primaryTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Please save choice',
                  style: TextStyle(
                    fontSize: 14,
                    color: CustomColors.primaryTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 40),
                Expanded(
                    child: WaterSlider(
                      minValue: 200,
                      maxValue: 1200,
                      initValue: viewModel.waterValue,
                      onValueChanged: (newValue) => viewModel.waterValue = newValue,
                    )
                ),
                SizedBox(height: 80),
                RichText(
                  text: TextSpan(
                    text: 'Current  ',
                    style: TextStyle(
                      color: CustomColors.primaryTextColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: viewModel.waterValue.toStringAsFixed(0),
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      );
    },
  );
}
}