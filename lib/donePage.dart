import 'package:flutter/material.dart';
import 'Task.dart';

class Done extends StatefulWidget {
  List<Task> doneList;
  Done(this.doneList);
  _Done createState() => _Done(doneList);

}
class _Done extends State<Done>{

  //_MyPage hm = new _MyPage();
  List<String> checked = List<String>();
  List<Task> doneList;
  _Done(this.doneList);

  @override
  Widget build(BuildContext context) {

    for(int i = 0; i < doneList.length; i++){
      if(doneList[i].completed){
        checked.add(doneList[i].taskNAme);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("You have DONE: "),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/check2.png"),
                fit: BoxFit.cover
            )
        ),
        child: Column(
            children: <Widget>[
              Center(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    //itemCount: hm.doneList.length,
                    itemCount: checked.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          elevation: 5.0,
                          color: Colors.teal,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: Text(checked[index], style: TextStyle(color: Colors.white, fontSize: 25.0)
                            ),
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
