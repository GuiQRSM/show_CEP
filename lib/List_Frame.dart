import 'package:flutter/material.dart';

class ListFrame extends StatefulWidget {
  const ListFrame({Key? key}) : super(key: key);

  @override
  _ListFrameState createState() => _ListFrameState();

}

var pickColor = Color.fromRGBO(255, 214, 51, 1);
var helperColor = Color.fromRGBO(204, 163, 0, 1);

class _ListFrameState extends State<ListFrame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: helperColor,
    );
  }
}
