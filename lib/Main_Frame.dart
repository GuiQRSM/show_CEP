import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:show_cep/DataWebList_Frame.dart';
import 'dart:convert';
import 'package:show_cep/List_Frame.dart';


class MainFrame extends StatefulWidget {
  const MainFrame({Key? key}) : super(key: key);

  @override
  _MainFrameState createState() => _MainFrameState();
}

var pickColor = Color.fromRGBO(255, 214, 51, 1);
var helperColor = Color.fromRGBO(204, 163, 0, 1);

class _MainFrameState extends State<MainFrame> {

  var _dinamicTextApi = "";

  TextEditingController _controllerCEP = TextEditingController();

  void _getDateApi () async {

    var cep = _controllerCEP.text;
    var url = Uri.parse("https://viacep.com.br/ws/${cep}/json/");
    http.Response response;

    response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);

    String logradouro = retorno["logradouro"];
    //String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];
    String uf = retorno["uf"];
    String ddd = retorno["ddd"];

    setState(() {
      _dinamicTextApi = "Logradouro: ${logradouro}\n"
                        //"Complemento: ${complemento}\n"
                        "Bairro: ${bairro}\n"
                        "Localidade: ${localidade}\n"
                        "UF: ${uf}\n"
                        "DDD: ${ddd}";
    });

    _cleanField();

  }

  void _cleanField() {

    _controllerCEP.text = "";

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant MainFrame oldWidget) {
    super.didUpdateWidget(oldWidget);
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
                  padding: EdgeInsets.only(top: 10, bottom: 14),
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
                  padding: EdgeInsets.only(top: 22),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Implemente seu CEP:",
                    labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  cursorColor: Colors.black,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  maxLength: 8,
                  maxLengthEnforced: true,
                  controller: _controllerCEP,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 12),
                child: RaisedButton(
                    onPressed: _getDateApi,
                  color: Colors.black,
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Get CEP",
                    style: TextStyle(
                        color: helperColor,
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
              ),
              Padding(
                padding: EdgeInsets.only(top: 60),
                child: RaisedButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListFrame(),
                        ),
                    );
                  },
                  padding: EdgeInsets.all(20),
                  color: Colors.black,
                  child: Text(
                      "Get List",
                    style: TextStyle(
                        color: helperColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 25
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 14),
                child: RaisedButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DataWebList(),
                          ),
                      );
                    },
                  padding: EdgeInsets.all(20),
                  color: Colors.black,
                  child: Text(
                      "Data Web List!",
                    style:TextStyle(
                        color: helperColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 25
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}
