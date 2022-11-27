import 'package:database/pages/home_page.dart';
import 'package:flutter/material.dart';
import '../models/album.dart';
import '../services/network.dart';

class Albums extends StatefulWidget {
  const Albums({super.key});

  @override
  State<Albums> createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {
  List<Album> data = [];
  @override
  void initState() {
    Network.getAlbum(Network.apiAlbum, {"userId": '${indx + 1}'}).then((value) {
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
              color: Colors.green[200],
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
                            text: 'userId: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          TextSpan(
                            text: data[index].userId.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
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
                            text: 'id: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          TextSpan(
                            text: data[index].id.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
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
                            text: 'title: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          TextSpan(
                            text: data[index].title ?? "",
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




// Align(
//                   alignment: Alignment.bottomLeft,
//                   child: Text(
//                     "title: ${data[index].title ?? ''}",
//                     style: const TextStyle(fontSize: 14),
//                   ),
//                 ),

// 
//           subtitle: 
        
