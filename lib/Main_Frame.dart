import 'package:flutter/material.dart';





class MainFrame extends StatefulWidget {
  const MainFrame({Key? key}) : super(key: key);

  @override
  _MainFrameState createState() => _MainFrameState();
}

var pickColor = Color.fromRGBO(255, 214, 51, 1);
var helperColor = Color.fromRGBO(204, 163, 0, 1);

class _MainFrameState extends State<MainFrame> {

  var _dinamicTextApi = "";

void _getDateApi () {

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
          padding: EdgeInsets.all(32),
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
                    onPressed: (){},
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
              Padding(
                  padding: EdgeInsets.only(top: 22),
                child: Text(
                  "$_dinamicTextApi",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 19,
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
