import 'package:flutter/material.dart';
import 'package:todo_app_crud/screens/about.dart';

// class List_Datas extends StatefulWidget {
//   const List_Datas({super.key});

//   @override
//   State<List_Datas> createState() => _List_DatasState();
// }

// class _List_DatasState extends State<List_Datas> {
//   List stdinfo = [
//     {'name': 'Ali', 'course': 'AI', 'sec': 'A'},
//     {'name': 'Bilal', 'course': 'Data analysis', 'sec': 'A'},
//     {'name': 'Danish', 'course': 'Flutter', 'sec': 'B'},
//     {'name': 'Ejaz', 'course': 'Web dev', 'sec': 'B'}
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: stdinfo.length,
//         itemBuilder: (context, index) {
//           return Container(
//             padding: EdgeInsets.only(bottom: 6),
//             child: ListTile(
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => About_page(
//                         studentData: stdinfo[index],
//                       ),
//                     ));
//               },
//               tileColor: Colors.amber,
//               title: Text(stdinfo[index]['name']!),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

///////////////
class StudentsList extends StatefulWidget {
  const StudentsList({super.key});

  @override
  State<StudentsList> createState() => _StudentsListState();
}

class _StudentsListState extends State<StudentsList> {
  List studentInfo = [
    {'name': 'Ali', 'course': 'AI', 'sec': 'A'},
    {'name': 'Babar', 'course': 'Data analysis', 'sec': 'A'},
    {'name': 'Danish', 'course': 'Web dev', 'sec': 'B'},
    {'name': 'Ejaz', 'course': 'App dev', 'sec': 'B'},
    {'name': 'Faheem', 'course': 'Ms office', 'sec': 'C'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: studentInfo.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(bottom: 6),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StdAbout(
                              studentData: studentInfo[index],
                              stdData: const {},
                            )));
              },
              tileColor: Colors.amber,
              title: Text(studentInfo[index]['name']),
            ),
          );
        },
      ),
    );
  }
}



///////////////////////

// class NeuMorphismButton extends StatefulWidget {
//   const NeuMorphismButton({super.key});

//   @override
//   State<NeuMorphismButton> createState() => _NeuMorphismButtonState();
// }

// class _NeuMorphismButtonState extends State<NeuMorphismButton> {
//   bool isPressed = true;

//   @override
//   Widget build(BuildContext context) {
//     final bgColor = Color(0xffe7ecef);
//     final distance = isPressed ? Offset(4, 3) : Offset(8, 8);
//     final blur = isPressed ? 10.0 : 20.0;

//     return Scaffold(
//       backgroundColor: bgColor,
//       body: Center(
//         child: GestureDetector(
//           onTap: () => setState(() {
//             isPressed = !isPressed;
//           }),
//           child: AnimatedContainer(
//             duration: Duration(milliseconds: 200),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(30),
//               color: bgColor,
//               boxShadow: [
//                 BoxShadow(
//                   blurRadius: blur,
//                   offset: -distance,
//                   color: Colors.white,
//                 ),
//                 BoxShadow(
//                   blurRadius: blur,
//                   offset: distance,
//                   color: Color(0xFFA7A9AF),
//                 ),
//               ],
//             ),
//             child: SizedBox(height: 200, width: 200),
//           ),
//         ),
//       ),
//     );
//   }
// }
