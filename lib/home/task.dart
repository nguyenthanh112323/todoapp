import 'package:flutter/material.dart';
import 'package:todoapp/main.dart';
class Task {
  String congviec;
  String tgian;
  String estimate_time;
  bool completed;

  Task({
    required this.congviec,
    required this.tgian,
    required this.estimate_time,
    this.completed = false


  });

  Map<String, dynamic> toJson() {
    return {
      'cong viec': congviec,
      'tgian': tgian,
      'estimate time': estimate_time,
      'conpleted': completed,

    };
  }
  factory Task.formJson(Map<String,dynamic> json){
    return Task(
      congviec: json['congviec'],
      tgian: json['tgian'],
      estimate_time: json['estimate time'],
      completed: json['conpleted']
    );
  }
}


class listchinh extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return listchinhstate();
  }

}
class listchinhstate extends State<listchinh> {
  List<Task> mantask = [];
  DateTime now = DateTime.now();

  String getDateString(DateTime date) {
    return "${date.year}-${date.month}-${date.day}";

  }
  Future<void> picktime() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2099),
    );
    if (picked != null){
      setState(() {
        now = picked;
      });
    }
  }
  List<Task> pickedday(){
    String date = getDateString(now);
    return mantask.where((task) => task.tgian== date).toList();
  }
  List<Task> completedday(){
    return mantask.where((task) => task.completed).toList();
  }
 void addtask(){
   TextEditingController controllcongviec = TextEditingController();
   TextEditingController controlestimate_time = TextEditingController();
   showDialog(context: context,
       builder:(context){
     return AlertDialog(
       title: Text('Add Task', style: TextStyle(fontSize: 34,color: Colors.white)
       ),
       content: Column(
         children: [
           TextField(
             controller: controllcongviec,
             decoration: InputDecoration(
               hintText: 'Task name'
             ),
           ),
           SizedBox(height: 10,),
           TextField(
             controller: controlestimate_time,
             decoration: InputDecoration(
               hintText: 'Estimate time'
             ),
           )
         ],
       ),
       actions: [
         IconButton(onPressed: (){
           Navigator.pop(context);},
             icon: Icon(Icons.arrow_back),color: Colors.white,

         ),
         TextButton(onPressed: (){
           setState(() {
             mantask.add(
              Task(congviec: controllcongviec.text,
                  tgian: getDateString(now),
                  estimate_time: controlestimate_time.text));
           });
           Navigator.pop(context);
         }, child: Text('Add'))
       ],

     );
       }
   );
 }
 void edittask(Task task){
    TextEditingController editcongviec = TextEditingController(text: task.congviec);
    TextEditingController editestimate = TextEditingController( text: task.estimate_time
    );
    showDialog(
        context: context, 
        builder:(context){
      return AlertDialog(
          title: Text('Edit Task',style: TextStyle(fontSize: 35, color: Colors.white),),
              content: TextField(
          controller: editcongviec,
      ),
        actions: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          },
              icon: Icon(Icons.arrow_back,color: Colors.white)),
          TextButton(onPressed: (){
            setState(() {
              task.congviec = editcongviec.text;
              task.estimate_time = editestimate.text;
            });
            Navigator.pop(context);
          },
              child: Text('Save'))

        ],
        );
 });
        }
Widget buildtask(Task task){
return Container(
  color: Colors.white,
  child:
    Row(
      children: [
        Column(
          children: [
          Text(
           task.congviec,
           style: TextStyle(fontSize: 14),
          ),
          Text(
            task.estimate_time,
            style: TextStyle(fontSize: 12),
          ),
            Row(
              children: [
                IconButton(onPressed: (){
                  edittask(task);
                }, icon: Icon(Icons.edit)),
                GestureDetector(
                  onTap: (){
                    task.completed = !task.completed;
                  },
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black45),
                  color: task.completed ? Colors.green : Colors.transparent,),
                  child: task.completed ? Icon(Icons.check,color: Colors.green) : null,

                          )

                    ),
                IconButton(onPressed: (){
                  setState(() {
                    mantask.remove(task);
                  });
                }, icon: Icon(Icons.delete),)


              ],
            )

          ],
          ),
      ],
    ),


);
}
Widget listalltask(List<Task> list){
    if (list.isEmpty){
      return Center(
        child: Text('no Task', style: TextStyle(color: Colors.black45),),
      );
    }
    return ListView(
      children:
        list.map((task) => buildtask(task) ).toList(),

    );
}
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: DefaultTabController(length: 2,
              child: TabBar(
                isScrollable: false,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.white,
                  indicatorColor:Colors.white,
                padding: EdgeInsets.zero,
                tabs: [
                  Tab(text: "All",icon: Icon(Icons.list),),
                  Tab(text: "Completed",icon: Icon(Icons.check),),
                ],

          ),

        ),
        ),
        Expanded(child: TabBarView(
            children: [
              listalltask(pickedday()),
               listalltask(completedday())
             ]
        ),

        )

      ],

    );




  }
}




