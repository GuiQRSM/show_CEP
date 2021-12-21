import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:show_cep/Class_Coments.dart';

class DataWebList extends StatefulWidget {
  const DataWebList({Key? key}) : super(key: key);

  @override
  _DataWebListState createState() => _DataWebListState();
}

var pickColor = Color.fromRGBO(255, 214, 51, 1);
var helperColor = Color.fromRGBO(204, 163, 0, 1);

class _DataWebListState extends State<DataWebList> {

  Future<List<Coments>> _getDataList () async {

    http.Response response;
    var url = Uri.parse("https://jsonplaceholder.typicode.com/comments");
    response = await http.get(url);

    var dataJson = json.decode(response.body);

    List<Coments> _receiver = [];
    for(var runner in dataJson){
      
      Coments inst = Coments(runner["id"], runner["name"], runner["email"]);
      _receiver.add(inst);
      
    }

    return _receiver;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: helperColor,
      body: FutureBuilder<List<Coments>>(
        future: _getDataList(),
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
                print("Erro ao carregar dados!");
              }else{

                return ListView.builder(
                  itemCount: snapshot.data!.length,
                    itemBuilder: (context, index){

                    return ListTile(
                      title: Text(
                        "Teste\n"
                        "Teste",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                      ),),
                      subtitle: Text(
                          "Teste",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        ),),

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
