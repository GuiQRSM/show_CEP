import 'package:flutter/material.dart';

class ListFrame extends StatefulWidget {
  const ListFrame({Key? key}) : super(key: key);

  @override
  _ListFrameState createState() => _ListFrameState();

}

var pickColor = Color.fromRGBO(255, 214, 51, 1);
var helperColor = Color.fromRGBO(204, 163, 0, 1);

class _ListFrameState extends State<ListFrame> {

  List _myItems = [];

  void _getItems (){

    for(int g = 0; g <= 10; g++){

      Map<String, dynamic> items = Map();
      items["title"] = "Elemento: ${g}";
      items["desc"] = "Informações sobre o elemento ${g}";
      _myItems.add(items);

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: helperColor,
      appBar: AppBar(
        title: Text(
            "ListFrame",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: pickColor,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        width: double.infinity,
        child: ListView.builder(
          padding: EdgeInsets.all(22),
            itemCount: 9,
            itemBuilder: (context, indice){

            return ListTile(
              title: Text(
                  indice.toString(),
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),),
              subtitle: Text(
                "-List Test-",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
            },
        ),
      ),
    );
  }
}
