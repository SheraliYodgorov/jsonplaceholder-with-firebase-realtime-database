import 'package:database/pages/second_page.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String name;
  final String email;

  const ListItem({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade100,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      elevation: 3,
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              settings: RouteSettings(arguments: name),
              builder: (
                context,
              ) =>
                  const SecondPage(),
            ),
          );
        },
        leading: const CircleAvatar(backgroundColor: Colors.lime),
        title: Text(name),
        subtitle: Text(email),
      ),
    );
  }
}
