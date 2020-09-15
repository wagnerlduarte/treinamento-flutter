import 'dart:io';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:exemplo_9/file.utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File _image;
  final picker = ImagePicker();

  _takePicture() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  _share() {
    FileUtils.getBytesFromFile(_image).then((bytes)
    {
      Share.file(
          'Compartilhar por', basename(_image.path), bytes.buffer.asUint8List(),
          'image/png');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _image == null ? _takePicture : _share,
        child: Icon(_image == null ? Icons.camera_alt : Icons.share),
      ),
      body: Center(
        child: Container(
          child: _image == null
              ? Text('Tire um retrato')
              : Container(
            child: Image.file(
              _image,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
