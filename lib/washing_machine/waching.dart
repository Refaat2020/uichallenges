import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uiChallenges/washing_machine/provider/theme_provider.dart';
import 'package:uiChallenges/washing_machine/utlits/colors.dart';
import 'package:uiChallenges/washing_machine/utlits/constant.dart';
import 'package:uiChallenges/washing_machine/widgets/function_list_button.dart';
import 'package:uiChallenges/washing_machine/widgets/mode_list.dart';
import 'package:uiChallenges/washing_machine/widgets/top_bar.dart';
import 'package:uiChallenges/washing_machine/widgets/washing_machine_case.dart';
import 'package:uiChallenges/washing_machine/widgets/water_drawer.dart';

class WashingMachineMainPage extends StatefulWidget {
  @override
  _WashingMachineMainPageState createState() => _WashingMachineMainPageState();
}

class _WashingMachineMainPageState extends State<WashingMachineMainPage> {
  static const margin = EdgeInsets.only(left: Global_EDGE_Margin_value);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) {
        return Container(
          color: CustomColors.primaryColor,
          child: Scaffold(
            backgroundColor:CustomColors.primaryColor,
            appBar:PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: SafeArea(
                child: TopBar(),
              ),
            ),
            drawerScrimColor: Colors.black.withAlpha(50),
            drawer: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(45),
                bottomRight: Radius.circular(45),
              ),
              child: WaterDrawer(),
            ),
            body: SingleChildScrollView(

              child: Container(
                child: Stack(
                  children: [
                    Positioned(
                      right: 9,
                      child: Transform.translate(
                        offset: Offset(100,120),
                        child: WashingMachineCase(
                          height: 380,
                          width: 380,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      SizedBox(height: 25,),
                        Padding(
                          padding: margin,
                          child: Text("Smart Washing",style: TextStyle(
                            fontSize: 28,
                            color: CustomColors.primaryTextColor,
                            fontWeight: FontWeight.w800,

                          ),),
                        ),
                        SizedBox(height: 2,),
                        Padding(
                          padding: margin,
                          child: Text("Machine",style: TextStyle(
                            fontSize: 26,
                            color: CustomColors.primaryTextColor,
                            fontWeight: FontWeight.w400,

                          ),),
                        ),
                        SizedBox(height: 70,),
                        Padding(
                          padding: margin,
                          child: FunctionListButton(),
                        ),
                        SizedBox(height: 60,),
                        ModeList(

                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
