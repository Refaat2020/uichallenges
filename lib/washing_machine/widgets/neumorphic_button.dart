import 'package:flutter/material.dart';
import 'package:uiChallenges/washing_machine/widgets/neumorphic_container.dart';

class NeumorphicButton extends StatefulWidget {
final bool pressed;
final double width;
final double heigh;
final Widget child;
final EdgeInsetsGeometry margin;
final GestureTapCallback onTap;
final Color color;
final bool disabled;

  @override
  _NeumorphicButtonState createState() => _NeumorphicButtonState();

const NeumorphicButton({
     this.pressed,
     this.width = 54.5,
     this.heigh = 54.5,
    @required this.child,
     this.margin,
     this.onTap,
     this.color,
     this.disabled,
  });
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: NeumorphicContainer(
        pressed: widget.pressed ?? _isPressed,
        width: widget.width,
        height: widget.heigh,
        child: widget.child,
        margin: widget.margin,
        color: widget.color,
        disabled: widget.disabled,
      ),
    );
  }

  void _onTapDown(TapDownDetails details){
    setState(() {
      _isPressed = true;
    });
    if(widget.onTap != null && widget.disabled != true)
      {
        widget.onTap();
      }
  }
  void _onTapUp(TapUpDetails details){
    setState(() {
      _isPressed = false;
    });
  }
  void _onTapCancel(){
    setState(() {
      _isPressed = false;
    });
  }
}