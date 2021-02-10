import 'package:flutter/material.dart';

class ModeTileIndecator extends StatelessWidget {
  final Color color;

  ModeTileIndecator({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      padding: EdgeInsets.all(4.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color.withAlpha(70),
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color
        ),
      ),
    );
  }
}
