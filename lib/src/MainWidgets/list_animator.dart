import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ListAnimator extends StatefulWidget {
  final List data;
  final Function child;
  final int duration;
  final double verticalOffset;
  final double horizontal;
  final bool reverse;

  const ListAnimator({
    Key key,
    this.data,
    this.duration,
    this.verticalOffset,
    this.child,
    this.horizontal,
    this.reverse,
  }) : super(key: key);

  @override
  _ListAnimatorState createState() => _ListAnimatorState();
}

class _ListAnimatorState extends State<ListAnimator> {
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.data.length,
        scrollDirection:
            widget.horizontal == null ? Axis.vertical : Axis.horizontal,
        reverse: widget.reverse ?? false,
        itemBuilder: (_, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: Duration(milliseconds: 400),
            child: SlideAnimation(
              duration: Duration(milliseconds: widget.duration ?? 400),
              verticalOffset: widget.verticalOffset ?? 50.0,
              horizontalOffset: widget.horizontal ?? 50,
              child: FadeInAnimation(
                child: widget.child(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
