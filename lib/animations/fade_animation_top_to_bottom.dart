import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

// Create enum that defines the animated properties
enum AniProps { opacity, translateY }

class FadeAnimationTopToBottom extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimationTopToBottom(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    /*final tween = MultiTrackTween([
      Track("opacity")
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateY").add(
          Duration(milliseconds: 500), Tween(begin: -130.0, end: 0.0),
          curve: Curves.easeOut)
    ]);*/
    final _tween = TimelineTween<AniProps>()
      ..addScene(
              begin: Duration(milliseconds: 0),
              duration: Duration(milliseconds: 500))
          .animate(AniProps.opacity, tween: Tween(begin: 0.0, end: 1.0))
      ..addScene(
              begin: Duration(milliseconds: 0),
              duration: Duration(milliseconds: 500))
          .animate(AniProps.translateY, tween: Tween(begin: -130.0, end: 0.0));

    /*return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(0, animation["translateY"]), child: child),
      ),
    );*/

    return PlayAnimation<TimelineValue<AniProps>>(
      tween: _tween,
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: _tween.duration,
      child: child,
      builder: (context, child, value) {
        return Opacity(
          opacity: value.get(AniProps.opacity),
          child: Transform.translate(
            offset: Offset(0, value.get(AniProps.translateY)),
            child: child,
          ),
        );
      },
    );
  }
}
