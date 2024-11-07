// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Todos_Demo extends StatefulWidget {
  const Todos_Demo({super.key});

  @override
  State<Todos_Demo> createState() => _Todos_DemoState();
}

class _Todos_DemoState extends State<Todos_Demo> {
  final stdName = [];
  TextEditingController studentNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
          child: TextField(
            controller: studentNameController,
          ),
        ),
      ),
      body: stdName.isEmpty
          ? Center(
              child: Text(
                'No Students Registered yet!',
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: stdName.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(bottom: 6, left: 6, right: 6),
                  child: ListTile(
                    tileColor: Colors.amber,
                    title: Text(
                      '${stdName[index]}',
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        stdName.removeAt(index);
                        setState(() {});
                      },
                      icon: Icon(Icons.delete_forever),
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          stdName.add((studentNameController.text));
          studentNameController.clear();
          setState(() {});
        },
        child: Text('Add'),
      ),
    );
  }
}

//////////  Dynamic List Data passing

// class StudentsInfo extends StatefulWidget {
//   const StudentsInfo({super.key});

//   @override
//   State<StudentsInfo> createState() => _StudentsInfoState();
// }

// class _StudentsInfoState extends State<StudentsInfo> {
//   final stdInfo = [
//     {'name': 'Ali', 'cours': 'Python Ai', 'sec': 'A'},
//     {'name': 'Bilal', 'cours': 'Flutter', 'sec': 'B'},
//     {'name': 'Danish', 'cours': 'ASP.net', 'sec': 'C'},
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: stdInfo.isEmpty
//           ? Center(
//               child: Text('No Student Registered yet!'),
//             )
//           : ListView.builder(
//               itemCount: stdInfo.length,
//               itemBuilder: (context, index) {
//                 return Container(
//                   padding: EdgeInsets.only(top: 10),
//                   child: ListTile(
//                     tileColor: Colors.amber,
//                     /////////
//                     leading:
//                         IconButton(onPressed: () {}, icon: Icon(Icons.update)),
//                     ///////
//                     title: Text('${stdInfo[index]['name']}'),
//                     trailing: IconButton(
//                         onPressed: () {
//                           stdInfo.removeAt(index);
//                           setState(() {});
//                         },
//                         icon: Icon(Icons.delete_forever)),
//                     ////////
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => StdAbout(
//                             stdData: stdInfo[index],
//                             studentData: null,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
