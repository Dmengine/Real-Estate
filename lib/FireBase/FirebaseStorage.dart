import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:real_estate/Models/ParanomalModel.dart';
import 'package:real_estate/Notifier/ParanomalModelNotifier.dart';

class FireBaseStorage{

  Future<List<String>> uploadFiles(List<ParanomalModel> data) async {
    var imageUrls = await Future.wait(data.map((data) => uploadFile(data.image)).toList());
    print(imageUrls);
    return imageUrls;
  }

  Future<String> uploadFile(File _image) async {
    print("uploadind");
    final uploadTask = await FirebaseStorage.instance
        .ref(_image.path.split("/").last);
    await uploadTask.putFile(_image);
    return await uploadTask.getDownloadURL();
  }
}