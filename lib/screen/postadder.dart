import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_post/model/post.dart';
import 'package:flutter_post/screen/postlist.dart';

class PostAdder extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return showPostAdder(context);
  }

  Widget showPostAdder(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController subjectController = TextEditingController();
    TextEditingController contentsController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: GlobalKey<ScaffoldState>(),
      appBar: AppBar(title: Text("글 작성"),
        centerTitle: true,
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute<void>(builder: (BuildContext context){
              return PostList();
            }));
          },
        ),
        actions: <Widget>[
          IconButton(
              color: Colors.white,
              icon: Icon(Icons.save),
              onPressed: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute<void>(builder: (BuildContext context){
                  Post.init(nameController.text.toString(), phoneNumberController.text.toString(), emailController.text.toString(), addressController.text.toString(), subjectController.text.toString(), contentsController.text.toString());
                  return PostList();
                }));
              })
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
          children:   <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
            child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '이름',
                    hoverColor: Colors.greenAccent
                )
            ),),


            Padding(padding: EdgeInsets.fromLTRB(5, 10, 10, 5),
              child: TextField(
                controller: phoneNumberController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '휴대폰',
                    hoverColor: Colors.greenAccent
                )
            ),
      ),
            Padding(padding: EdgeInsets.fromLTRB(5, 10, 10, 5),
              child:TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'email',
                    hoverColor: Colors.greenAccent
                )
              ),
            ),
      Padding(padding: EdgeInsets.fromLTRB(5, 10, 10, 5),
        child: TextField(
                controller: addressController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '주소',
                    hoverColor: Colors.greenAccent
                )
            ),),

      Padding(padding: EdgeInsets.fromLTRB(5, 10, 10, 5),

        child: TextField(
                controller: subjectController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '제목',
                    hoverColor: Colors.greenAccent
                )
            ),),

      Padding(padding: EdgeInsets.fromLTRB(5, 10, 10, 5),
        child: TextField(
          keyboardType: TextInputType.multiline,
                maxLines: 8,
                controller: contentsController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                    border: OutlineInputBorder(),
                    labelText: '내용',
                    hoverColor: Colors.greenAccent
                )
            ),),
          Padding(padding: EdgeInsets.fromLTRB(10, 300, 10, 0))
          ],
        ),)
      ),

    );
  }
}