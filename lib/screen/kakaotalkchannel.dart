import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class KakaoChannel extends StatefulWidget {
  _KakaoChannel createState() => _KakaoChannel();
}
class _KakaoChannel extends State<KakaoChannel>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("1:1 상담"),
        centerTitle: true,
        leading: IconButton(
          icon: new Icon(Icons.arrow_back_ios_sharp),
          color: Colors.white,
          onPressed: (){
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute<void>(builder: (context) => MyApp()));
          },
        ),
      ),
      body: Container(),
    );
  }

}