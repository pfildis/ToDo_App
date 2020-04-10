import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'donePage.dart';
import 'unDonePage.dart';
import 'Task.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primaryTextTheme: TextTheme(
          title: TextStyle(
            color: Colors.deepPurpleAccent
          ),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.lightGreenAccent,
        ),
      ),
      title: "Todo_app",
      debugShowCheckedModeBanner: false,
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  _MyPage createState() => _MyPage();

}
  class _MyPage extends State<MyHomePage>{

    List<Task> taskList = List<Task>();

  Widget _MyWidget(){
      return Center(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: taskList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 5.0,
              color: Color.fromRGBO(255, 255, 255, 0.5),
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                children: <Widget>[
                  Checkbox(
                    value: taskList[index].completed,
                    onChanged: (bool value){
                      setState(() {
                        if(value){
                        taskList[index].completed = true;
                        }else{
                          taskList[index].completed = false;
                        }
                      });
                    },
                  ),
                Text(taskList[index].taskNAme),

                  IconButton(
                    icon: Icon(Icons.edit),
                    iconSize: 30.0,
                    onPressed: (){

                      String inputText = "";
                      return showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return AlertDialog(
                              title: Text("Add some : "),
                              content: TextField(
                                autofocus: true,
                                decoration: InputDecoration(
                                  hintText: taskList[index].taskNAme,
                                ),
                                onChanged: (text){
                                  inputText = text;
                                },
                              ),
                              actions: <Widget>[ FlatButton(
                                child: Text("OK"),
                                onPressed: (){
                                  setState(() {
                                    taskList[index].taskNAme = inputText;
                                  });
                                  Navigator.of(context).pop();
                                },
                              )
                              ],
                            );
                          }
                      );
                    },
                  ),

                  IconButton(
                    alignment: Alignment.centerLeft,
                      icon: Icon(Icons.cancel),
                      onPressed: (){
                        setState(() {
                          taskList.removeAt(index);
                          print(index);
                          print(taskList);
                        });
                      }
                  ),
                ]
                ),
              )
            );
          }
        )
      );
  }

@override
  Widget build(BuildContext context){

    _addTODO(){
      String inputText = "";
      return showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text("Add some : "),
              content: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Write here..."
                ),
                onChanged: (text){
                  inputText = text;
                },
              ),
               actions: <Widget>[ FlatButton(
                  child: Text("OK"),
                  onPressed: (){
                    setState(() {
                      Task task = new Task(inputText, false);
                      taskList.add(task);
                      print(taskList);
                    });
                    Navigator.of(context).pop();
                  },
                )
            ],
            );
          }
      );
    }

    return Scaffold(

      appBar: AppBar(
        title: Text("ToDo List", textAlign: TextAlign.center),
        actions: <Widget>[
         IconButton(
           icon: Icon(Icons.assignment_turned_in),
           onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => Done(taskList)));
           },
         ),
          IconButton(
            icon: Icon(Icons.assignment_late),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => unDone(taskList)));
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/deer.png"),
            fit: BoxFit.cover
          )
        ),
      child: Center(
          child: Column(
          children: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              color: Colors.deepPurpleAccent,
              splashColor: Colors.yellow[200],
              child: Text("Add", style: TextStyle(color: Colors.white),),
              onPressed: (){
                setState(() {
                  _addTODO();
                });
              },
            ),
            _MyWidget()
          ]
          )
        ),
      ),
    );
  }
}