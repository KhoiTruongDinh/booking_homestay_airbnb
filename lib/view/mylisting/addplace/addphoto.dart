import 'dart:io';

import 'package:booking_homestay_airbnb/models/place.dart';
import 'package:booking_homestay_airbnb/services/firbase_api.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class AddPhoto extends StatefulWidget {

  @override
  AddPhotoState createState() => AddPhotoState();
}

class AddPhotoState extends State<AddPhoto> {
  File _image;
  UploadTask task;
  String urlImage;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      print('Image Path $_image');
    });
    uploadFile();
  }

  Future uploadFile() async {

    final fileName = basename(_image.path);
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, _image);
    setState(() {});

    if (task == null) return;

    final snapshot = await task.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
    setState(() {
      urlImage = urlDownload;
      print('Image Path $_image');
    });
  }

  @override
  Widget build(BuildContext context) {
    final fileName = _image != null ? basename(_image.path) : 'Chưa chọn hình ảnh';
    context.read<Place>().setUrlPic = urlImage;
    return Column(

      children: <Widget>[

        urlImage != null ?
        Image.network(urlImage, height: 150,) :
        SizedBox(height: 8),

        TextButton(
          child: const Text('Chọn hình ảnh'),
          onPressed: (){
            getImage();
            context.read<Place>().setUrlPic = urlImage;
            },
        ),
        SizedBox(height: 8),
        Text(
          fileName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 20),
        //task != null ? Text('đợi tý') : Container(),
      ],
    );
}
}