import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class DownLoad {
  static void downloadImage(String url, String fileName) async {
    Dio dio = Dio();
    var dir = await getApplicationDocumentsDirectory();
    var imageFile = File("${dir.path}/$fileName");
    await dio
        .download(url, imageFile.path)
        .then((value) => print('download success'));
  }
}
