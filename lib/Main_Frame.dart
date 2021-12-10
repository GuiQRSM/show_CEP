import 'package:flutter/material.dart';
import 'package:http/http.dart' as getApi;




class MainFrame extends StatefulWidget {
  const MainFrame({Key? key}) : super(key: key);

  @override
  _MainFrameState createState() => _MainFrameState();
}

var pickColor = Color.fromRGBO(255, 214, 51, 1);
var helperColor = Color.fromRGBO(204, 163, 0, 1);

class _MainFrameState extends State<MainFrame> {

//metodo que ativa a requisição
 void _getDateApi (){

   String url = "https://viacep.com.br/ws/69067080/json/";
   getApi.Response response;

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pickColor,
      appBar: AppBar(
        title: Text(
          "Show CEP",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700
        ),),
        backgroundColor: helperColor,
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(42),
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 10),
                child: Text(
                  "-Call your CEP-",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 25
                   ),
                 ),
               ),
              Padding(
                  padding: EdgeInsets.only(top: 40),
                child: RaisedButton(
                    onPressed: _getDateApi,
                  color: helperColor,
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Get CEP",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      fontSize: 25
                    ),),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
