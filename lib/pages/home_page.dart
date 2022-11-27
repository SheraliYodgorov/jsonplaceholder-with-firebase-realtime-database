// ignore_for_file: avoid_print

import 'package:database/pages/list_item.dart';
import 'package:database/models/user.dart';
import 'package:database/services/network.dart';
import 'package:database/services/rtdb_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

String forData = "noData"; // NoData, please waiting, data, null
List<User> users = [];
int indx = 0;

class _MyHomePageState extends State<MyHomePage> {
  void onUserAdded(User user) {
    setState(() {
      users.add(user);
    });
  }

  @override
  void initState() {
    DBService.getUser(onUserAdded);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User"),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.arrow_down_to_line_alt),
            onPressed: () {
              DBService.downloadAndUpload().then(print);
            },
            splashRadius: 20,
          ),
          //   SizedBox(
          //     height: 56,
          //     child: Center(
          //       child: users.isEmpty
          //           ? const SizedBox()
          //           : Text(
          //               "${users.length} users",
          //               style: const TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 18,
          //               ),
          //             ),
          //     ),
          //   ),
        ],
      ),
      body: forData == "noData"
          ? noData()
          : forData == "please waiting"
              ? please()
              : forData == "data"
                  ? data() //data(users)
                  : forData == "null"
                      ? forNull
                      : null,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            forData = "please waiting";
          });
          Network.getUser(Network.apiUser, null).then((value) {
            if (value != null) {
              setState(() {
                forData = "data";
                // print(value.toString());
                users = value;
              });
            } else {
              setState(() {
                forData = "null";
              });
            }
          });
        },
        backgroundColor: Colors.deepPurpleAccent,
      ),
    );
  }

  Widget noData() {
    return const Center(
      child: Text(
        'No Data',
        style: TextStyle(fontSize: 22, color: Colors.amber),
      ),
    );
  }

  Widget please() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget forNull() {
    return Expanded(
        child: Container(
      color: Colors.amber,
    ));
  }

  data() {
    return ListView.separated(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return ListItem(
            name: users[index].name ?? 'No name',
            email: users[index].email ?? 'No email');
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
    );
  }
}

  // data(List<User> users) {
  //   return ListView(
  //     children: List.generate(users.length, (index) {
  //       return Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 6),
  //         child: Card(
  //           color: Colors.green[100],
  //           elevation: 2,
  //           child: ListTile(
  //             onTap: () {
  //               setState(() {
  //                 indx = index;
  //                 // Get.to(SecondPage());
  //                 print("indx = $indx");
  //                 Navigator.push(
  //                     context,
  //                     MaterialPageRoute(
  //                         builder: (context) => const SecondPage()));
  //               });
  //             },
  //             leading: const CircleAvatar(
  //               backgroundColor: Colors.greenAccent,
  //             ),
  //             title: Text(users[index].name ?? "no username"),
  //             subtitle: Text(users[index].email ?? "no email"),
  //           ),
  //         ),
  //       );
  //     }),
  //   );
  // }
