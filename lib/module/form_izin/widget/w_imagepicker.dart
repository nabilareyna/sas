import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WImagePicker(),
    );
  }
}

class WImagePicker extends StatefulWidget {
  @override
  _WImagePickerState createState() => _WImagePickerState();
}

class _WImagePickerState extends State<WImagePicker> {
  ImagePicker picker = ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      image =
                          await picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        //update UI
                      });
                    },
                    child: Text("Pick Image")),
                image == null ? Container() : Image.file(File(image!.path))
              ],
            )));
  }
}
