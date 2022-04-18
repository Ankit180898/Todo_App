import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/database_helper.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/screens/taskPage.dart';
import 'package:todo_list/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseHelper _dbHelper=DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child:Container(
          width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        color: Color(0xFFF6F6F6),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 32.0,
                    bottom: 32.0
                  ),
                  child: Image(
                    image: AssetImage("assets/logo.png"),
                  ),

                ),
                Expanded(
                    child: FutureBuilder(
                      future: _dbHelper.getTasks(),
                      builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {

                        return ScrollConfiguration(
                          behavior: NoGlowBehavior(),
                          child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder:(context,index){
                              return TaskCardWidget(
                                title: snapshot.data![index].title,
                                desc: snapshot.data![index].description,

                              );
                            },

                          ),
                        );
                      },
                  ),
                )

              ],
            ),
            Positioned(
              bottom: 24.0,
              right: 0.0,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskPage())).then((value) {
                    setState(() {
                    });
                  });
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
                    image: AssetImage("assets/add_icon.png"),
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
