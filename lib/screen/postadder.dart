import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_post/model/post.dart';
import 'package:flutter_post/screen/postlist.dart';

class PostAdder extends StatefulWidget {
  _PostAdder createState() => _PostAdder();
}

class _PostAdder extends State<PostAdder>{

  Firestore posting = Firestore.instance;
  TextEditingController nameController = TextEditingController(text: "이름");
  TextEditingController phoneNumberController = TextEditingController(text: "전화번호");
  TextEditingController emailController = TextEditingController(text: "email");
  TextEditingController addressController = TextEditingController(text: "주소");
  TextEditingController subjectController = TextEditingController(text: "제목");
  TextEditingController contentsController = TextEditingController(text: "내용");

  // 수정 예정
  addPost() {
    return posting.collection('post').document('${subjectController.text}').setData({
      'name': nameController.text,
      'phoneNumber': phoneNumberController.text,
      'email': emailController.text,
      'address': addressController.text,
      'subject': subjectController.text,
      'contents': contentsController.text
    }).then((value) => print("Post Added"));
  }

  @override
  Widget build(BuildContext context) {
    return showPostAdder(context);
  }
  Widget showPostAdder(BuildContext context) {

    Post post;

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
                  addPost();
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