import 'package:flutter/material.dart';
import 'Task.dart';

class unDone extends StatefulWidget {
  List<Task> doneList;
  unDone(this.doneList);
  _Undone createState() => _Undone(doneList);

}
class _Undone extends State<unDone>{

  List<String> unchecked = List<String>();
  List<Task> doneList;
  _Undone(this.doneList);

  @override
  Widget build(BuildContext context) {

    for(int i = 0; i < doneList.length; i++){
      if(!doneList[i].completed){
        unchecked.add(doneList[i].taskNAme);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Assignmnets: "),
      ),
      body: Container(
        child: Column(
            children: <Widget>[
              Center(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    //itemCount: hm.doneList.length,
                    itemCount: unchecked.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          elevation: 5.0,
                          color: Colors.teal,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: Text(unchecked[index], style: TextStyle(color: Colors.white, fontSize: 25.0)),
                          )
                      );
                    }
                ),
              ),]
        ),
      ),
    );
  }
}