import 'package:database/pages/home_page.dart';
import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../services/network.dart';

class Todos extends StatefulWidget {
  const Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  List<Todo> data = [];
  bool value = false;
  @override
  void initState() {
    Network.getTodo(Network.apiTodos, {"userId": '${indx + 1}'}).then((value) {
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
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.green[100],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
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
                                  text: 'completed: ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                TextSpan(
                                  text: data[index].completed.toString(),
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
                                  text: 'Title: ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                TextSpan(
                                  text: data[index].title ?? '',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Checkbox(
                    value: value,
                    onChanged: (value) {
                      setState(() {
                        this.value = value!;
                      });
                    },
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
