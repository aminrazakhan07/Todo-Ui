// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http_apinstackin;
import 'package:todo_app_crud/todo_app/home_todo_list.dart';

class TodoListItem extends StatefulWidget {
  final Map? todo;
  const TodoListItem({super.key, this.todo});

  @override
  State<TodoListItem> createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    final todo = widget.todo;
    if (todo != null) {
      isEdit = true;
      final title = todo['title'];
      final descrip = todo['description'];

      titleController.text = title;
      descriptionController.text = descrip;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        centerTitle: true,
        title: Text(
          isEdit ? 'Edit Todo' : 'Add Todo',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20),
          child: ListView(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  // focusColor: Colors.white,
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                  // height: 5,
                  ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  // focusColor: Colors.white,
                  hintText: 'Description',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
                keyboardType: TextInputType.multiline,
                minLines: 2,
                maxLines: 8,
              ),
              SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: isEdit ? UpdateData : submitData,
                child: Text(
                  isEdit ? 'Update' : 'Submit',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeTodos_List(),
              ));
        },
        label: Text('Go to List'),
      ),
    );
  }

  Future<void> UpdateData() async {
    final todo = widget.todo;
    if (todo == null) {
      print('You can not call updated witout todo data');
    }
    final id = todo?['_id'];
    final title = titleController.text;
    final descrip = descriptionController.text;

    //// Create the body of the request
    final body = {
      "title": title,
      "description": descrip,
      "is_completed": false,
    };
    /////// Submit Updated Datas
    final url = "https://api.nstack.in/v1/todos/$id";
    final uri = Uri.parse(url);

    // Send the POST request
    final response = await http_apinstackin.put(
      uri,
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    //// Handle the response
    if (response.statusCode == 200) {
      titleController.text = '';
      descriptionController.text = '';

      //// Showing SnackBar
      showSuccessMesage('Updation Success');
      // print(response.body);
    } else {
      showErrorMesage('Updation Failed');
      print(response.body);
    }
  }
  // https://api.nstack.in/v1/todos/6731fde5980a4fd9c55c458e

  Future<void> submitData() async {
    //// Get The data from form
    final title = titleController.text;
    final descrip = descriptionController.text;

    //// Create the body of the request
    final body = {
      "title": title,
      "description": descrip,
      "is_completed": false,
    };

    //// Link of post request
    const url = "https://api.nstack.in/v1/todos";
    final uri = Uri.parse(url);

    //// Send the POST request
    final response = await http_apinstackin.post(
      uri,
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    //// Handle the response
    if (response.statusCode == 201) {
      titleController.text = '';
      descriptionController.text = '';

      //// Showing SnackBar
      showSuccessMesage('Creation Success');
      // print(response.body);
    } else {
      showErrorMesage('Creation Failed');
      print(response.body);
    }
  }

  /////////// Creat SnackBar
  void showSuccessMesage(String mesage) {
    final snackBar = SnackBar(content: Text(mesage));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /////////// Show Error SnackBar
  void showErrorMesage(String mesage) {
    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      content: Text(mesage, style: TextStyle(color: Colors.white)),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
  }
  ////////////
}
