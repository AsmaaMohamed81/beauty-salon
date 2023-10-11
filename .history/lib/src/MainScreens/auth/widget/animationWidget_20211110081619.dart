import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimationWidget extends StatelessWidget {
  final Widget child;
  final int index;

  const AnimationWidget({Key key, this.child, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      delay: Duration(milliseconds: 300),
      child: SlideAnimation(
        duration: Duration(milliseconds: 300),
        verticalOffset: 50.0,
        child: FadeInAnimation(child: child),
      ),
    );
  }
}
