import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Class_Todos.dart';

class ListFrame extends StatefulWidget {
  const ListFrame({Key? key}) : super(key: key);

  @override
  _ListFrameState createState() => _ListFrameState();

}

var pickColor = Color.fromRGBO(255, 214, 51, 1);
var helperColor = Color.fromRGBO(204, 163, 0, 1);

class _ListFrameState extends State<ListFrame> {



  Future<List<Todos>> _getMyItems() async {

    http.Response response;
    var url = Uri.parse("https://jsonplaceholder.typicode.com/todos");
    response = await http.get(url);

    var dataJson = json.decode(response.body);

    List<Todos> _receiver = [];
    for(var runner in dataJson){

      Todos inst = Todos(runner["id"], runner["title"], runner["completed"]);
      _receiver.add(inst);

    }
    return _receiver;
  }

  @override
  Widget build(BuildContext context) {

    _getMyItems();

    return Scaffold(
      backgroundColor: helperColor,
      appBar: AppBar(
        title: Text(
            "ListFrameExpanded",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: pickColor,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: FutureBuilder<List<Todos>>(
        future: _getMyItems(),
        builder: (context, snapshot) {

          var widget;

          switch(snapshot.connectionState){
            case ConnectionState.waiting :
              widget = Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );

              break;
            case ConnectionState.done :
              if(snapshot.hasError){
                print("Erro no codígo fonte(URL)!");
              }else{
                return ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index){



                    return ListTile(
                      onTap: (){

                        showDialog(
                            context: context,
                            builder: (context){

                              return AlertDialog(
                                backgroundColor: pickColor,
                                title: Text(
                                  "teste",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black
                                  ),),
                                titlePadding: EdgeInsets.all(32),
                                content: Text(
                                  "teste",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black
                                  ),
                                ),
                                actions: <Widget>[
                                  RaisedButton(
                                    padding: EdgeInsets.only(top:10, bottom: 10),
                                    color: helperColor,
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Fechar",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black
                                      ),
                                    ),
                                  )
                                ],
                              );
                            });
                      },
                      title: Text(
                        "teste",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        ),),
                      subtitle: Text(
                       "teste",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black
                        ),
                      ),
                    );
                  },
                );
              }
          }
          return widget;
        },
      ),
    );
  }
}


/*

 */