import 'package:flutter/material.dart';
import 'package:http/http.dart' as getApi;
import 'dart:convert';




class MainFrame extends StatefulWidget {
  const MainFrame({Key? key}) : super(key: key);

  @override
  _MainFrameState createState() => _MainFrameState();
}

var pickColor = Color.fromRGBO(255, 214, 51, 1);
var helperColor = Color.fromRGBO(204, 163, 0, 1);

class _MainFrameState extends State<MainFrame> {

  var _dinamicTextApi = "";

//metodo que ativa a requisição
 void _getDateApi () async {
   
  getApi.Response response;
  var url = Uri.parse("https://viacep.com.br/ws/67145100/json/");

  response = await getApi.get(url);

  Map<String, dynamic> retorno = json.decode(response.body);
  String cep = retorno["cep"];
  String logradouro = retorno["logradouro"];
  String bairro = retorno["bairro"];
  String localidade = retorno["localidade"];
  String uf = retorno["uf"];
  String ddd = retorno["ddd"];

  setState(() {
    _dinamicTextApi =  "CEP: ${cep}\n"
        "Logradouro: ${logradouro}\n"
        "Bairro: ${bairro}\n"
        "Localidade: ${localidade}\n"
        "UF: ${uf}\n"
        "DDD: ${ddd}";
  });

  //GHOST EXIBITION
  print(
    "CEP: ${cep}\n"
    "Logradouro: ${logradouro}\n"
    "Bairro: ${bairro}\n"
    "Localidade: ${localidade}\n"
    "UF: ${uf}\n"
    "DDD: ${ddd}",
  );

  //print("informações recuperadas: " + response.body);
  //print("Veredito do SC: " + response.statusCode.toString());

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
              Padding(
                  padding: EdgeInsets.only(top: 18),
                child: Text(
                  "$_dinamicTextApi",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
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
