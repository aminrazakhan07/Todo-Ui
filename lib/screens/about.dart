// class About_page extends StatelessWidget {
//   final Map studentData;
//   About_page({required this.studentData});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Student Datas'),
//       ),
//       body: Container(
//         padding: EdgeInsets.only(left: 5),
//         child: Column(
//           children: [
//             Text(studentData['name'], style: TextStyle(fontSize: 20.0)),
//             Text(studentData['course'], style: TextStyle(fontSize: 20.0)),
//             Text(studentData['sec'], style: TextStyle(fontSize: 20.0)),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

//////////  Get Students Data From Home

class StdAbout extends StatelessWidget {
  final Map stdDetail;
  const StdAbout({super.key, required this.stdDetail, required studentData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            color: Colors.blue,
            padding: const EdgeInsets.only(left: 15, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(stdDetail['name']),
                Text(stdDetail['cours']),
                Text(stdDetail['sec']),
                ////
              ],
            ),
          ),
        ],
      ),
    );
  }
}
