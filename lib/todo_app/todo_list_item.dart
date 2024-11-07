// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {
          print('Clicked on Tado Item');
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
        tileColor: Colors.white,
        leading: Icon(
          Icons.check_box,
          color: Colors.green,
        ),
        title: Text(
          'Check mail',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough),
        ),
        trailing: IconButton(
          onPressed: () {
            print('Clicked on Delete item');
          },
          color: Colors.red,
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}
