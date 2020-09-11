import 'dart:io';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:exercicio_11/file.utils.dart';
import 'package:exercicio_11/loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sprintf/sprintf.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File _image;
  final picker = ImagePicker();
  double _latitude;
  double _longitude;
  String _apiPath = 'https://www.google.com/maps/search/?api=1&query=%s,%s';
  bool _isLoading = false;

  void initState() {
    super.initState();

    _takePicture();
  }

  _getLocation() async {
    setState(() {
      _isLoading = true;
    });

    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _latitude = position.latitude;
      _longitude = position.longitude;
      _apiPath = sprintf(_apiPath, [_latitude, _longitude]);
      _isLoading = false;
    });
  }

  _takePicture() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    _getLocation();

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  _share(BuildContext context) {
    FileUtils.getBytesFromFile(_image).then((bytes) {
      Share.file(
        'Compartilhar por',
        basename(_image.path),
        bytes.buffer.asUint8List(),
        'image/png',
        text: 'Partiu dar um rolê? Local: $_apiPath',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_image == null) return Container();

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              child: Image.file(
                _image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              color: Colors.grey[800],
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Align(
                      alignment: FractionalOffset.centerLeft,
                      child: Text(
                        'Ver no mapa',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _isLoading
                        ? Loader()
                        : Column(
                            children: [
                              InkWell(
                                child: Text(
                                  _apiPath,
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 16),
                                ),
                                onTap: () async => {launch(_apiPath)},
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Align(
                                alignment: FractionalOffset.centerRight,
                                child: RaisedButton(
                                  onPressed:() { _share(context); },
                                  child: Text(
                                    'Compartilhar Rolê',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
