
import 'package:flutter/material.dart';

class AnimationPractice extends StatefulWidget {
  @override
  _AnimationPracticeState createState() => _AnimationPracticeState();
}

class _AnimationPracticeState extends State<AnimationPractice> with TickerProviderStateMixin{

  AnimationController _controller;
  Animation<double> sizeAnimation;
  Animation<double> opacityAnimation;
  Animation<Color> colorAnimation;

  @override
  void initState(){
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 2),
    vsync: this,
    );
    sizeAnimation = Tween<double>(begin:0,end: 64).animate(_controller);
    opacityAnimation = Tween<double>(begin: 0.5,end: 1).animate(_controller);
    colorAnimation = ColorTween(begin: Color(0Xff0000),end:Color(0Xff808080)).animate(_controller);

    _controller.forward(); //used in animation start
//    _controller.addListener((){ //if animation builder is used setstate is not necessary
//      setState(() {
//
//      });
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          onPressed: (){
            _controller.forward(from: 0.001);
          },
          child: Text('Animate'),
          ),
        AnimatedBuilder(
          animation: _controller,
          builder: (context,child){
            return Container(
              padding: EdgeInsets.all(20),
              color:colorAnimation.value,
              child: Opacity(
                opacity: opacityAnimation.value,
                child: FlutterLogo(
                  size: sizeAnimation.value,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
