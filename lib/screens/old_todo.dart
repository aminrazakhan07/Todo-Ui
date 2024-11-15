// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class StudentsInfo extends StatefulWidget {
  const StudentsInfo({super.key});

  @override
  State<StudentsInfo> createState() => _Todos_DemoState();
}

class _Todos_DemoState extends State<StudentsInfo> {
  final stdNameList = [];
  TextEditingController studentNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.cyan,
          title: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            width: 1,
            color: Colors.amber,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.1),
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          controller: studentNameController,
          decoration: InputDecoration(
            hintText: 'Student Name',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 10),
          ),
        ),
      )),
      body: stdNameList.isEmpty
          ? Center(
              child: Text(
                'No Students Registered yet!',
                style: TextStyle(fontSize: 20),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: ListView.builder(
                itemCount: stdNameList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      /////
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          width: 1,
                          color: Colors.amber,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.1),
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),

                      /////////

                      child: ListTile(
                        // tileColor: Colors.amber,
                        title: Text(
                          '${stdNameList[index]}',
                          style: TextStyle(fontSize: 20),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            stdNameList.removeAt(index);
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.delete_forever,
                            color: Colors.pink[500],
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black,
        backgroundColor: Colors.amber[300],
        onPressed: () {
          setState(() {
            stdNameList.add((studentNameController.text));
            studentNameController.clear();
          });
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
//   final stdNameList = [
//     {'name': 'Ali', 'cours': 'Python Ai', 'sec': 'A'},
//     {'name': 'Bilal', 'cours': 'Flutter', 'sec': 'B'},
//     {'name': 'Danish', 'cours': 'ASP.net', 'sec': 'C'},
//     {'name': 'Ejaz', 'cours': 'Java.net', 'sec': 'C'},
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.cyan,
//       ),
//       body: stdNameList.isEmpty
//           ? Center(
//               child: Text('No Student Registered yet!'),
//             )
//           : ListView.builder(
//               itemCount: stdNameList.length,
//               itemBuilder: (context, index) {
//                 return Container(
//                   padding: EdgeInsets.only(top: 10),
//                   child: ListTile(
//                     tileColor: Colors.amber,
//                     /////////
//                     leading:
//                         IconButton(onPressed: () {}, icon: Icon(Icons.update)),
//                     ///////
//                     title: Text('${stdNameList[index]['name']}'),
//                     trailing: IconButton(
//                         onPressed: () {
//                           stdNameList.removeAt(index);
//                           setState(() {});
//                         },
//                         icon: Icon(Icons.delete_forever)),
//                     ////////
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => StdAbout(
//                             stdData: stdNameList[index],
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
