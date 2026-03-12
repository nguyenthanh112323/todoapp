import 'package:flutter/material.dart';
import 'home/homescreen.dart';
void main() {
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp( { super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'todo app',
      home: const Homescreen(),
    );
  }
}

// class MyApp extends StatefulWidget {
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SafeArea(
//           child:  Scaffold(
//             appBar: AppBar(
//               title: Text('TODO TASK', style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 24
//               ),
//               ),
//
//               backgroundColor: Colors.black,
//               toolbarHeight: 80,
//
//               actions: [
//                 Padding(
//                   padding: EdgeInsets.only(right: 16),
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Icon(Icons.calendar_today,
//                           color: Colors.lightBlueAccent,
//                           size: 35),
//                       Positioned(
//                         bottom: 4,
//                         child: Text(
//                           "15",
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//               ],
//
//
//
//             ),
//
//             body: Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Color(0xFF1E1FA3),
//                     Color(0xFF8E90C5),
//                   ],
//                 ),
//               ),
//
//
//               child: Column(
//                 children: [
//                   Timedate(),
//                   listchinh()
//                 ],
//
//               ),),
//             // floatingActionButton: addtask(),
//             // floatingActionButtonLocation: FloatingActionButtonLocation
//             //     .centerFloat,
//
//       ),
//       ),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//   class  Timedate extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return timedatestate();
//   }
// }
//
//
//
// class timedatestate extends State<Timedate>{
//   List<Task> mantask = [];
//     DateTime now = DateTime.now();
//
//     String getDateString(DateTime date) {
//       return "${date.year}-${date.month}-${date.day}";
//
//     }
//     Future<void> picktime() async {
//       final picked = await showDatePicker(
//         context: context,
//         initialDate: now,
//         firstDate: DateTime(2000),
//         lastDate: DateTime(2099),
//       );
//       if (picked != null){
//         setState(() {
//           now = picked;
//         });
//       }
//     }
//    List<Task> pickedday(){
//       String date = getDateString(now);
//       return mantask.where((task) => task.tgian== date).toList();
//    }
//    List<Task> completedday(){
//       return pickedday().where((task) => task.completed).toList();
//    }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//   return Container(
//     color: Color(0xFF2D2F5F),
//     margin: EdgeInsets.all(0) ,
//     height: 70,
//
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         GestureDetector(
//           onTap: picktime ,
//           child: Text('${now.day}. ${now.month}. ${now.year}',
//               style: TextStyle(
//                   fontSize: 34,
//                   color: Colors.white,
//                   backgroundColor: Color(0xFF2D2F5F)),
//           )
//           ),
//         ElevatedButton(onPressed:null,
//             style: ElevatedButton.styleFrom(
//               disabledBackgroundColor: Color(0xFF2D2F5F),
//               disabledForegroundColor: Colors.white,
//
//             ),
//             child:
//             Text('${now.hour} : ${now.minute}', style: TextStyle(fontSize: 34),))
//       ],
//     )
//   );
//   }

// }
// class nutbam extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//    return nutbamstate();
//   }
//
// }
// class nutbamstate extends State<nutbam>{
//   @override
//   Widget build(BuildContext context) {
//    return Container(
//      margin: EdgeInsets.all(0) ,
//      color: Colors.white,
//      child: Container(
//        child: Row(
//          children: [
//            ElevatedButton(
//              onPressed: () {},
//              style: ElevatedButton.styleFrom(
//                backgroundColor: Colors.white,
//                minimumSize: Size(205, 65),
//                padding: EdgeInsets.all(10),
//                shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.zero,
//                ),
//              ),
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: [
//                  Icon(Icons.list, size: 25),
//                  Text("All"),
//                ],
//              ),
//            ),
//            ElevatedButton(
//              onPressed: () {},
//              style: ElevatedButton.styleFrom(
//                backgroundColor: Colors.white,
//                minimumSize: Size(205, 65),
//                padding: EdgeInsets.all(10),
//                shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.zero,
//                ),
//              ),
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: [
//                  Icon(Icons.check, size: 25),
//                  Text("Completed"),
//
//                ],
//              ),
//            )
//          ],
//        ),
//      ),
//
//    );
//   }
//
// }
// class nutadd extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//    return nutaddstate();
//   }
//
// }
// class nutaddstate extends State<nutadd>{
//   @override
//   Widget build(BuildContext context) {
//      return SizedBox(
//         width: 70,
//         height: 70,
//         child: FloatingActionButton(
//           onPressed: addtask,
//           backgroundColor: Color(0xFF2E2F5E),
//           shape: CircleBorder(),
//           child: Icon(Icons.add, size: 35),
//     ),
//      );
//
//   }
//
// }







