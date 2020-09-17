import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class UploadStorage {

  String downloadUrl;

  void uploadImage(ImageSource source) async{
    var image = await ImagePicker.pickImage(source: source);

    StorageReference storageReference = FirebaseStorage.instance.ref().child("${DateTime.now()}");
    StorageUploadTask storageUploadTask = storageReference.putFile(image);
    await storageUploadTask.onComplete;
    downloadUrl = await storageReference.getDownloadURL();
  }

  String getDownloadUrl(){
    return downloadUrl;
  }
}