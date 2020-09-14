import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_post/main.dart';
import 'package:flutter_post/model/post.dart';
import 'package:flutter_post/screen/postadder.dart';
import 'package:flutter_post/widget/info_dialog.dart';

class PostList extends StatefulWidget{
  _PostList createState() => _PostList();
}

class _PostList extends State<PostList>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("글 목록"),
        centerTitle: true,
        leading: IconButton(
          icon: new Icon(Icons.arrow_back_ios_sharp),
          color: Colors.white,
            onPressed: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute<void>(builder: (context) => MyApp()));
            },
        ),
        actions: <Widget>[
          IconButton(
              color: Colors.white,
              icon: new Icon(Icons.edit),
              onPressed: () {
                InfoDialog().showAlertDialog(context);
              }),
        ],
      ),

    );
  }

}