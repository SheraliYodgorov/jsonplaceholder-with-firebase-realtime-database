import 'package:flutter/material.dart';

import '../models/photo.dart';
import '../services/network.dart';
import 'home_page.dart';

class Photos extends StatefulWidget {
  const Photos({super.key});

  @override
  State<Photos> createState() => _PhotosState();
}

List<Photo> photos = [];

class _PhotosState extends State<Photos> {
  @override
  void initState() {
    Network.getPhoto(Network.apiPhoto, {"albumId": "${indx + 1} "})
        .then((value) {
      if (value != null) {
        photos = value;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(8),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: List.generate(
        photos.length,
        (index) => Image.network(
          photos[index].albumId.toString(),
        ),
      ),
    );
  }
}

Widget photo() {
  return Container(
    color: Colors.amber,
  );
}
