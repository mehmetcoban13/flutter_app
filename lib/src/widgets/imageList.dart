import 'package:flutter/material.dart';
import '../models/imageModel.dart';

class ImageList extends StatelessWidget{
  final List<ImageModel> images;
  ScrollController _controller;

  ImageList(this.images, this._controller);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index) {
        return buildImage(images[index]);
      },
      shrinkWrap: true,
      controller: _controller,
    );
  } //nabıyon bea

  Widget buildImage(ImageModel image) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Padding(
            child: Image.network(image.url),
            padding: EdgeInsets.only(bottom: 8.0),
          ),
          Text(image.author),
        ],
      ),
    );
  }
}