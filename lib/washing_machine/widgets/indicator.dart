import 'package:flutter/material.dart';
import 'package:uiChallenges/washing_machine/utlits/colors.dart';

class Indicator extends StatefulWidget {

final Color color;
final bool blink;
const Indicator({
   this.color,
   this.blink,
});

  @override
  _IndicatorState createState() => _IndicatorState();

}

class _IndicatorState extends State<Indicator> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation colorTween;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
     vsync: this,
      duration: Duration(milliseconds: 700),
    );
    setupAnimation();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }
  void setupAnimation(){
     Color startColor = CustomColors.primaryTextColor.withAlpha(150);
     Color endColor = CustomColors.primaryTextColor.withAlpha(150);
    if(widget.color !=null) startColor  = widget.color;
    _animationController.reset();
    colorTween = ColorTween(begin: startColor,end: endColor).animate(_animationController);
    if(widget.blink == true)
      {
        _animationController.repeat(reverse: true);
      }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      padding: EdgeInsets.all(8.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: CustomColors.indicatorBackground,
        boxShadow: [
          BoxShadow(
            color: CustomColors.containerInnerShadowTop,
           blurRadius: 10 ,
            offset: -Offset(6,6)
          ),
          BoxShadow(
              color: CustomColors.containerInnerShadowBottom,
              blurRadius: 10 ,
              offset: Offset(6,6)
          ),
        ]
      ),
      child: AnimatedBuilder(
        animation: colorTween,
        // child: childWidget,
        builder: (BuildContext context, Widget child) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: colorTween.value
            ),
          );
        },
      ),
    );
  }
}