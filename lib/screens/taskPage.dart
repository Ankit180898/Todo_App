import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/database_helper.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/screens/homepage.dart';
import 'package:todo_list/widgets.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(

          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24.0,bottom:6.0 ),
                  child: Row(
                    children: [

                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Image(
                            image: AssetImage('assets/back_arrow_icon.png'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          onSubmitted: (value) async{


                            if(value!=""){
                              DatabaseHelper _dbHelper=DatabaseHelper();
                              Task _newTask=Task(
                                title: value
                              );
                             await _dbHelper.inserTask(_newTask);

                            }

                          },
                          decoration: InputDecoration(
                            hintText: "Enter task Title",
                            border: InputBorder.none,

                          ),
                          style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF211551),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter Description for the task",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 24.0
                    )
                  ),
                ),
                SizedBox(height: 12.0,),
                TodoWidget(
                  text: 'Create your first task',
                  isDone: true,
                ),
                TodoWidget(text:"Groceries",isDone: false,),
                TodoWidget(text:"Stationary",isDone: true,),
              ],
        ),
              Positioned(
                bottom: 24.0,
                right: 24.0,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskPage()));
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                        gradient: LinearGradient(
                            colors: [Color(0xFF7349FE),Color(0xFF643FDB)],
                            begin: Alignment(0.0,-1.0),
                            end: Alignment(0.0,1.0)
                        ),

                    ),
                    child: Image(
                      image: AssetImage("assets/delete_icon.png"),
                    ),

                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
