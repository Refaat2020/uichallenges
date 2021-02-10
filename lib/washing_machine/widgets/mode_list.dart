import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uiChallenges/washing_machine/enum_mode_status.dart';
import 'package:uiChallenges/washing_machine/models/mode_item.dart';
import 'package:uiChallenges/washing_machine/provider/main_provider.dart';
import 'package:uiChallenges/washing_machine/utlits/colors.dart';
import 'package:uiChallenges/washing_machine/utlits/constant.dart';
import 'package:uiChallenges/washing_machine/widgets/mode_tile.dart';

class ModeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: Global_EDGE_Margin_value),
            child: Text("Mode",style: TextStyle(
              fontSize: 23,
              color: CustomColors.primaryTextColor,
              fontWeight: FontWeight.w700,
            ),
            ),
          ),
          SizedBox(height: 4,),
          Flexible(
              child: Consumer<MainProvider>(
                builder: (context, value, child) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if(index > value.nodes.length -1)return null;
                        ModeItemModel item = value.nodes[index];
                        return ModeTile(
                          pressed: value?.selectedMode == item,
                          indecatorColor: item.color,
                          name: item.name,
                          minutes: item.mint,
                          disable: value.modeStatus == ModeStatus.running,
                          onTap: ()=>value.selectMode(item),
                        );
                      },
                  );
                },
              ),
          ),
        ],
      ),
    );
  }
}
