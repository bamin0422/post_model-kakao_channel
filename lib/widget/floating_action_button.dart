import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_post/screen/kakaotalkchannel.dart';
import 'package:flutter_post/screen/postlist.dart';

class ServiceButton extends StatefulWidget {
  _ServiceButton createState() => _ServiceButton();
}

class _ServiceButton extends  State<ServiceButton> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  bool isOpend = false;
  Animation<Color> _animateColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;


  Kakaochannel() {
    return new Container(
      child: FloatingActionButton(
        heroTag: "kakaochannel",
        onPressed: (){
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute<void>(builder: (BuildContext context){
             return KakaoChannel();
          }));
        },
        tooltip: 'kakaochannel',
        child: Icon(Icons.message, color: Colors.brown,),
        backgroundColor: Colors.yellowAccent,
      ),
    );
  }

  Posting() {
    return new Container(
      child: FloatingActionButton(
        heroTag: "posting",
        onPressed: (){
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute<void>(builder: (BuildContext context){
            return PostList();
          }));
        },
        tooltip: 'posting',
        child: Icon(Icons.edit, color: Colors.white,),
        backgroundColor: Colors.orangeAccent,
      ),
    );
  }

  Menu() {
    return new Container(
      child: FloatingActionButton(
        tooltip: "menu",
        backgroundColor: _animateColor.value,
        onPressed: animate,
        child: AnimatedIcon(
          color: Colors.white,
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500))
        ..addListener(() {
          setState(() {});
        });
    _animateIcon =Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animateColor = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        0.00,
      )
    ));
    _translateButton = Tween<double>(
      begin:56.0,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0, 0.75, curve: _curve
      ),
    ));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if(!isOpend){
      _animationController.forward();
    }else {
      _animationController.reverse();
    }isOpend = !isOpend;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(transform: Matrix4.translationValues(0.0, _translateButton.value * 2.0, 0.0),
            child: Posting()),

        Transform(transform: Matrix4.translationValues(0.0, _translateButton.value * 1.0, 0.0),
            child: Kakaochannel()),
        Menu()],
    );
  }
}