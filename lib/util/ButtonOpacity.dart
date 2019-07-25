import 'package:flutter/material.dart';

class ButtonOpacity extends StatefulWidget {
  Widget child;
  void Function() onPressed, onLongPress;
  int duration;
  double opacity;
  ButtonOpacity(
      {Key key,
      this.onLongPress,
      this.child,
      this.onPressed,
      this.duration = 1000,
      this.opacity = 0.3})
      : super(key: key);

  _ButtonOpacityState createState() => _ButtonOpacityState();
}

class _ButtonOpacityState extends State<ButtonOpacity>
    with TickerProviderStateMixin {
  AnimationController scoreSizeAnimationController;

  @override
  void dispose() {
    scoreSizeAnimationController.stop();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    scoreSizeAnimationController = new AnimationController(
        value: 1,
        vsync: this,
        duration: new Duration(milliseconds: (widget.duration / 2).round()),
        lowerBound: widget.opacity,
        upperBound: 1.0);
    scoreSizeAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        scoreSizeAnimationController.reverse();
      }
    });
    scoreSizeAnimationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: scoreSizeAnimationController.value,
      child: GestureDetector(
        onLongPress: () {
          if (widget.onLongPress != null) {
            widget.onLongPress();
          }
        },
        onLongPressEnd: (tap) {
          scoreSizeAnimationController.forward(from: widget.opacity).then((f) {
            scoreSizeAnimationController.forward(from: 1);
          });
        },
        onTapDown: (tap) {
          scoreSizeAnimationController.reverse(from: 1).then((f) {
            scoreSizeAnimationController.reverse(from: widget.opacity);
          });
        },
        onTapUp: (tap) {
          scoreSizeAnimationController.forward(from: widget.opacity).then((f) {
            scoreSizeAnimationController.forward(from: 1);
          });
          if (widget.onPressed != null) {
            widget.onPressed();
          }
        },
        child: widget.child,
      ),
    );
  }
}
