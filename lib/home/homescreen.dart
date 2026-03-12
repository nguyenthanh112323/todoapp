import 'package:flutter/material.dart';
import 'task.dart';
import 'widget_task_card.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});
  @override
  State<StatefulWidget> createState() {
   return _HomescreenState();
  }
}
class _HomescreenState extends State<Homescreen>{
  List<Task> tasklist = [];
  DateTime now = DateTime.now();
  DateTime hournow = DateTime.now();
  String getDateString(DateTime date) {
    return "${date.day}-${date.month}-${date.year}";

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
    return tasklist.where((task) => task.date== date).toList();
  }
  List<Task> completedday(){
    return tasklist.where((task) => task.completed).toList();
  }
  Widget culender() {
    return Container(
    color: Color(0xFF2D2F5F),
    margin: EdgeInsets.all(0) ,
    height: 70,

    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: picktime ,
          child: Text('${now.day}. ${now.month}. ${now.year}',
              style: TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                  backgroundColor: Color(0xFF2D2F5F)),
          )
          ),
        ElevatedButton(onPressed:null,
            style: ElevatedButton.styleFrom(
              disabledBackgroundColor: Color(0xFF2D2F5F),
              disabledForegroundColor: Colors.white,

            ),
            child:
            Text('${hournow.hour} : ${hournow.minute}', style: TextStyle(fontSize: 34),))
      ],
    )
  ) ;
}
  void addtask(){
   TextEditingController controlltitle = TextEditingController();
   TextEditingController controlestimate_time = TextEditingController();
   showDialog(context: context,
       builder:(context){
     return Container(
           decoration: BoxDecoration(
               gradient: LinearGradient(
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                 colors: [
                   Color(0xFF1E1FA3),
                   Color(0xFF8E90C5),
                 ],
               )),
       padding: EdgeInsets.all(0),
       child: Container(

         child: AlertDialog(
           backgroundColor: Color(0xFF8E90C5),
           title: Text('Add Task', style: TextStyle(fontSize: 34,color: Colors.white)
           ),
           content: Column(
             children: [
               TextField(
                 controller: controlltitle,
                 decoration: InputDecoration(
                   hintStyle:TextStyle(color: Colors.white),
                   hintText: 'Task name'
                 ),
               ),
               SizedBox(height: 10,),
               TextField(
                 controller: controlestimate_time,
                 decoration: InputDecoration(
                     hintStyle:TextStyle(color: Colors.white),
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
                 tasklist.add(
                  Task(title: controlltitle.text,
                      date: getDateString(now),
                      estimate_time: controlestimate_time.text));
               });
               Navigator.pop(context);
             }, child: Text('Add',style: TextStyle(color: Colors.white)))
           ],

         ),
       ),
     );
       }
   );
 }
 void edittask(Task task){
    TextEditingController edittitle = TextEditingController(text: task.title);
    TextEditingController editestimate = TextEditingController( text: task.estimate_time
    );
    showDialog(
        context: context,
        builder:(context){
      return AlertDialog(
          title: Text('Edit Task',style: TextStyle(fontSize: 35, color: Colors.white),),
              content: TextField(
          controller: edittitle,
      ),
        actions: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          },
              icon: Icon(Icons.arrow_back,color: Colors.white)),
          TextButton(onPressed: (){
            setState(() {
              task.title = edittitle.text;
              task.estimate_time = editestimate.text;
            });
            Navigator.pop(context);
          },
              child: Text('Save'))

        ],
        );
 });
        }

  Widget buildTaskList(List<Task> list){

    if(list.isEmpty){
      return const Center(child: Text("No Task"));
    }

    return ListView(
      children: list.map((task){

        return TaskCard(

          task: task,

          onToggle: (){
            setState(() {
              task.completed = !task.completed;
            });
          },

          onDelete: (){
            setState(() {
              tasklist.remove(task);
            });
          },

          onEdit: (){
            edittask(task);
          },

        );

      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
   return DefaultTabController(length: 2,
       child:Scaffold(
         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
         floatingActionButton: FloatingActionButton(
             onPressed: addtask,
         child: const Icon(Icons.add)),
       appBar: AppBar(title: Text('TODO TASK', style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24
              ),
              ),

              backgroundColor: Colors.black,
              toolbarHeight: 80,

              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(Icons.calendar_today,
                          color: Colors.lightBlueAccent,
                          size: 35),
                      Positioned(
                        bottom: 4,
                        child: Text(
                          "15",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],

       ),
       body: Container(
         decoration: BoxDecoration(
             gradient: LinearGradient(
               begin: Alignment.topCenter,
               end: Alignment.bottomCenter,
               colors: [
                 Color(0xFF1E1FA3),
                 Color(0xFF8E90C5),
               ],
             )),
         child: Column(
             children: [
               culender(),
          Container(
         color: Colors.white,
            child:  TabBar(
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
           Expanded(child: TabBarView(children:[
             buildTaskList(pickedday()),
             buildTaskList(completedday())
           ] ))
             ]

         ),

       )

       )
   );
              }

}