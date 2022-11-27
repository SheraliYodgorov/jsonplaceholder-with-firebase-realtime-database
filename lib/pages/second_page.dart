import 'package:database/models/album.dart';
import 'package:database/pages/albums.dart';
import 'package:database/pages/home_page.dart';
import 'package:database/pages/photos.dart';
import 'package:database/pages/posts.dart';
import 'package:database/pages/todos.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<Album> albums = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: appBar(),
        body: const TabBarView(
          children: [
            Albums(),
            Todos(),
            Posts(),
            Photos(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    final args = ModalRoute.of(context)?.settings.arguments as String;
    return AppBar(
      title: Text(
        '$args',
        // users[indx].name ?? "no username",
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      bottom: const TabBar(
        tabs: [
          Tab(text: 'Albums'),
          Tab(text: 'Todos'),
          Tab(text: 'Posts'),
          Tab(text: 'Photos'),
        ],
      ),
    );
  }
}
