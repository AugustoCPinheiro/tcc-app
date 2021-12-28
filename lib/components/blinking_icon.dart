import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BlinkingIcon extends StatefulWidget {
  IconData _iconData;

  BlinkingIcon(this._iconData);

  @override
  State createState() {
    return _BlinkingIconState();
  }
}

class _BlinkingIconState extends State<BlinkingIcon>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  @override
  void initState() {
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: Icon(
        widget._iconData,
        color: Colors.red,
      ),
    );
  }
}
