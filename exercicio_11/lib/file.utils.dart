import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';

class FileUtils{

  static Future<ByteData> getBytesFromFile(File file) async{
    Uint8List bytes = File(file.path).readAsBytesSync();
    return ByteData.view(bytes.buffer);
  }

}