// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo_app_crud/todo_app/todo_list_item.dart';

class NewTodos_app extends StatefulWidget {
  const NewTodos_app({super.key});

  @override
  State<NewTodos_app> createState() => _NewTodos_appState();
}

class _NewTodos_appState extends State<NewTodos_app> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(children: [
          searchBox(),
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 50, bottom: 20),
                  child: Text(
                    'All ToDos',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TodoListItem(),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

Widget searchBox() => Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(18),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              maxWidth: 20,
            ),
            hintText: 'search'),
      ),
    );
