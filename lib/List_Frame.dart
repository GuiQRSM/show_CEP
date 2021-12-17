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

  void _getMyItems(){

    _myItems = [];
    for(int g = 0; g <= 10; g++){

      Map<String, dynamic> items = Map();
      items["title"] = "Elemento ${g};";
      items["desc"] = "Descrição do elemento ${g}!";
      _myItems.add(items);

    }

  }

  @override
  Widget build(BuildContext context) {

    _getMyItems();

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
          padding: EdgeInsets.all(16),
          itemCount: _myItems.length,
            itemBuilder: (context, indice){

            Map<String, dynamic> items = _myItems[indice];
            dynamic title = items["title"];
            dynamic desc = items["desc"];

              return ListTile(
                onTap: (){

                  showDialog(
                      context: context,
                      builder: (context){

                        return AlertDialog(
                          backgroundColor: pickColor,
                          title: Text(
                            title.toString(),
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                          ),),
                          titlePadding: EdgeInsets.all(32),
                          content: Text(
                            desc.toString(),
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                            ),
                          ),
                        );
                       });
                },
                title: Text(
                    title.toString(),
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
                ),),
                subtitle: Text(
                    desc.toString(),
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black
                  ),
                ),
              );
            },
        ),
      ),
    );
  }
}
