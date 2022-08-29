import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_app/download.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imageUrl = "https://picsum.photos/250?image=9";
  late File file = File("");

  Future<void> askPermission() async {
    await Permission.storage.request();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    askPermission().then((value) {
      getApplicationDocumentsDirectory().then((Directory directory) {
        final dir = directory;
        file = File("${dir.path}/image.jpg");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //elevated button to read the json file
          Image.file(file),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  DownLoad.downloadImage(imageUrl, 'image.jpg');
                });
              },
              child: const Text("download image")),
          ElevatedButton(
            child: const Text('Read Image'),
            onPressed: () {
              setState(() {
                file = File(file.path);
              });
            },
          )
        ],
      ),
    );
  }
}
