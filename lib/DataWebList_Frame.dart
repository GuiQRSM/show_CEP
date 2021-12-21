import 'package:flutter/material.dart';

class DataWebList extends StatefulWidget {
  const DataWebList({Key? key}) : super(key: key);

  @override
  _DataWebListState createState() => _DataWebListState();
}

var pickColor = Color.fromRGBO(255, 214, 51, 1);
var helperColor = Color.fromRGBO(204, 163, 0, 1);

class _DataWebListState extends State<DataWebList> {

  void _getDataList () async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: helperColor,
    );
  }
}
