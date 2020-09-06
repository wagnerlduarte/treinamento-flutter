import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );

    /*_animation =
        Tween<double>(begin: 40, end: 300).animate(_animationController);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        _animationController.reverse();
      else if (status == AnimationStatus.dismissed)
        _animationController.forward();
    });
*/

    _animation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController)
        ..addStatusListener((status) {
      if (status == AnimationStatus.completed)
        _animationController.reverse();
      else if (status == AnimationStatus.dismissed)
        _animationController.forward();
    });


    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();

    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: PresuntoTransition(
      animation: _animation,
      child: FlutterLogo(),
    )));
  }
}

class AnimatedLogo extends AnimatedWidget {
  final Animation<double> animation;

  AnimatedLogo({this.animation}) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: animation.value,
          width: animation.value,
          child: FlutterLogo()),
    );
  }
}

class PresuntoTransition extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  final sizeTween = Tween<double>(begin: 40, end: 300);
  final opacityTween = Tween<double>(begin: 0.1, end: 1);

  PresuntoTransition({this.animation, this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedBuilder(
      child: child,
      animation: animation,
      builder: (context, child) {
        return Opacity(
          opacity: opacityTween.evaluate(animation).clamp(0.1, 1.0),
          child: Container(
            width: sizeTween.evaluate(animation),
            height: sizeTween.evaluate(animation),
            child: child,
          ),
        );
      },
    ));
  }
}
