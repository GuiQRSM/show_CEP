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

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: helperColor,
    );
  }
}
