// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_declarations

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:todo_app_crud/todo_app/todo_add_item.dart';
import 'package:http/http.dart' as httpl;

class HomeTodos_List extends StatefulWidget {
  const HomeTodos_List({super.key});

  @override
  State<HomeTodos_List> createState() => _HomeTodos_appState();
}

class _HomeTodos_appState extends State<HomeTodos_List> {
  late var isloding = false;
  List items = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTodo();
  }

  bool isAplayLoadin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        elevation: 5,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,
            ),
            Text(
              'To do List',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/plant.png'),
              ),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: fetchTodo,
        child: Visibility(
          visible: items.isNotEmpty,
          replacement: Center(
            child: Text(
              'No Todo Data',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index] as Map;
              final id = item['_id'] as String;
              return Card(
                shadowColor: Colors.grey,
                color: Colors.grey[850],
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[700],
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    item['title'],
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    item['description'],
                    style: TextStyle(color: Colors.white),
                  ),
                  ///////// Popup Menu Button
                  trailing: PopupMenuButton(
                    // color: Colors.black12,
                    iconColor: Colors.white,
                    onSelected: (value) {
                      if (value == 'edit') {
                        /// Opene Edit page
                        navigateToEditPage(item);
                      } else if (value == 'delete') {
                        deleteByid(id);
                      }
                    },
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          value: 'edit',
                          child: Text(
                            'Edit',
                            // style: TextStyle(color: Colors.white),
                          ),
                        ),
                        PopupMenuItem(
                          value: 'delete',
                          child: Text(
                            'Delete',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ];
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed:
            // () {
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => TodoListItem(),
            //       ));
            // },

            navigateToAddPage, //// نیوی کی جگہ یہ فنکشن بھی یوز کر سکتے ہیں
        label: Text('Add Todo'),
      ),
    );
  }

///// For Adding Naem
  Future<void> navigateToAddPage() async {
    final route = MaterialPageRoute(
      builder: (context) => TodoListItem(),
    );
    await Navigator.push(context, route);
    setState(() {
      isloding = true;
    });
    fetchTodo();
  }

///// For Editing
  Future<void> navigateToEditPage(Map item) async {
    final route =
        MaterialPageRoute(builder: (context) => TodoListItem(todo: item));
    await Navigator.push(context, route);
  }

///////// For Delete
  Future<void> deleteByid(String id) async {
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await httpl.delete(uri);
    showSuccessMesage('Deleted Success');
    if (response.statusCode == 200) {
      /// Remove item the list
      final filter = items.where((element) => element['_id'] != id).toList();

      setState(() {
        items = filter;
      });
    } else {
      showSuccessMesage('Deletion Failed');
    }
  }

  Future<void> fetchTodo() async {
    final url = 'https://api.nstack.in/v1/todos?page=1&limit=12';
    final uri = Uri.parse(url);
    final respone = await httpl.get(uri);

///////////// 1st methord
    if (respone.statusCode == 200) {
      final jsond = jsonDecode(respone.body) as Map;
      final result = jsond['items'] as List;

      setState(() {
        items = result;
      });
    } else {
      print('Error: ${respone.statusCode}');
    }

////////////  2nd methord
//      if (respone.statusCode == 200) {
//   final json = jsonDecode(respone.body) as Map;
//   if (json.containsKey('items')) {
//     final result = json['items'] as List;
//     setState(() {
//       items = result;
//     });
//   } else {
//     print('No items found');
//   }
// } else {
//   print('Error: ${respone.statusCode}');
// }
////////////////
  }

  ////// Snack Bar
  void showSuccessMesage(String mesage) {
    final snackBar = SnackBar(content: Text(mesage));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
