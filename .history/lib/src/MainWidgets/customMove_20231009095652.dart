import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomMoveList extends StatelessWidget {
  final List<Widget>? data;

  const CustomMoveList({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: data!.length,
        itemBuilder: (_, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: Duration(milliseconds: 200),
            child: SlideAnimation(
              duration: Duration(milliseconds: 200),
              verticalOffset: 300.0,
              child: FadeInAnimation(child: data![index]),
            ),
          );
        },
      ),
    );
  }
}
