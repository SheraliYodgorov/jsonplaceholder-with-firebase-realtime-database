import 'package:database/pages/home_page.dart';
import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/network.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List<Post> data = [];
  @override
  void initState() {
    Network.getPost(Network.apiPost, {"userId": '${indx + 1}'}).then((value) {
      if (value != null) {
        setState(() {
          data = value;
        });
      } else {}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        data.length,
        (index) => Expanded(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.green[100],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'id: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          TextSpan(
                            text: data[index].id.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 14.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Title: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          TextSpan(
                            text: data[index].title ?? '',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 14.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'body: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          TextSpan(
                            text: data[index].body,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
