import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_post/model/post.dart';
import 'package:flutter_post/model/upload_storage.dart';
import 'package:flutter_post/screen/postlist.dart';
import 'package:flutter_post/widget/floating_action_button_post.dart';
import 'package:image_picker/image_picker.dart';

class PostAdder extends StatefulWidget {
  _PostAdder createState() => _PostAdder();
}

class _PostAdder extends State<PostAdder>{


  UploadStorage upload = UploadStorage();
  Firestore posting = Firestore.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController contentsController = TextEditingController();

  // 수정 예정
  addPost(String imgUrl, String fileUrl) {
    return posting.collection('post').document('${subjectController.text}').setData({
      'name': nameController.text,
      'phoneNumber': phoneNumberController.text,
      'email': emailController.text,
      'address': addressController.text,
      'subject': subjectController.text,
      'contents': contentsController.text,
      'time': '${DateTime.now().year}년 ${DateTime.now().month}월 ${DateTime.now().day}일',
      'photoUrl': imgUrl,
      'fileUrl': fileUrl,
    }).then((value) => print("Post Added"));
  }

  @override
  Widget build(BuildContext context) {
    return showPostAdder(context);
  }
  Widget showPostAdder(BuildContext context) {

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

                  addPost(upload.getDownloadUrl(), "");
                  return PostList();
                }));
              })
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
          children:   <Widget>[
            Container(
                color: Colors.blueGrey,
                child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(icon: Icon(Icons.photo_camera),
                    color: Colors.white,
                    onPressed: (){
                        upload.uploadImage(ImageSource.camera);
                    }),
                IconButton(icon: Icon(Icons.photo),
                    color: Colors.white,
                    onPressed: (){
                      upload.uploadImage(ImageSource.gallery);
                    }),
                IconButton(icon: Icon(Icons.attach_file),
                    color: Colors.white,
                    onPressed: (){}),
              ],)
            ),
            Padding(padding: EdgeInsets.fromLTRB(5, 10, 10, 5),
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
      floatingActionButton: adderButton(),

    );
  }
}