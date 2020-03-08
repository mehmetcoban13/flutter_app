import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:math';
import 'models/imageModel.dart';
import 'widgets/imageList.dart';

class App extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App>{
  ScrollController _controller = new ScrollController();
  int counter = 0;
  var rand = Random.secure();
  List<ImageModel> images = [];

  void fetchImage() async {
    final url = 'https://picsum.photos/id/${rand.nextInt(1000)+1}/info';
    final response = await get(url);
    final imageModel = ImageModel.fromJson(response.body);
    
    setState(() {
      images.add(imageModel);
      ++counter;
    });
    Timer(Duration(milliseconds: 600), () => _controller.jumpTo(_controller.position.maxScrollExtent));
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images, _controller),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
        appBar: AppBar(
          title: Text("Let's See Some Images"),
        ),
      ),
    );
  }
}