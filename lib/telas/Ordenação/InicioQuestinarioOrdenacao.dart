// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_test_app/telas/Ordena%C3%A7%C3%A3o/ProvadorOrdenacao.dart';

import '../GridMain.dart';

class InicioOrdenacao extends StatefulWidget {


  @override
  _InicioOrdenacaoState createState() => _InicioOrdenacaoState();
}

class _InicioOrdenacaoState extends State<InicioOrdenacao> {

  final _valueamostra = GlobalKey<FormState>();
  TextEditingController Carcateristicacontroller = TextEditingController();
  TextEditingController Numerocontroller = TextEditingController();
  String julgador = "SemNOme";

  @override
  Widget build(BuildContext context) {
    String Descricao =
        "Insira o numero de amostras que será recebido por cada Provador e a caracteristica parametro";

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Questionario Aromatico"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.black54)),
            child: Form(
              key: _valueamostra,
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.white60)),
                      child: AutoSizeText(
                        "$Descricao",
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Insira a Caracteristica parametro",
                          style: TextStyle(fontSize: 22),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          width: 180,
                          height: 60,
                          child: TextFormField(
                            style: TextStyle(fontSize: 16),
                            keyboardType: TextInputType.text,
                            maxLength: 50,
                            maxLines: 1,
                            controller: Carcateristicacontroller,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "insira caracteristica";
                              }
                              return null;
                            },
                            // ignore: prefer_const_constructors
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.blue,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                              hintText: " ",
                              contentPadding: EdgeInsets.all(5),
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Amostras por provador",
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          width: 180,
                          height: 60,
                          child: TextFormField(
                            style: TextStyle(fontSize: 16),
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            controller: Numerocontroller,
                            validator: (value) {
                              if (value!.trim().isEmpty ||
                                  int.parse(value) > 10 ||
                                  int.parse(value) == 0) {
                                return "Numero de amostras";
                              }
                              return null;
                            },
                            // ignore: prefer_const_constructors
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.blue,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                              hintText: " ",
                              contentPadding: EdgeInsets.all(5),
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_valueamostra.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProvadorOrdenacao(Carcateristicacontroller.text,int.parse(Numerocontroller.text))));
                            }
                          },
                          child: Text("Iniciar Teste",
                              style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FloatingActionButton(
                            child: Icon(
                              Icons.run_circle_outlined,
                              size: 50,
                              color: Colors.black,
                            ),
                            backgroundColor: Colors.red,
                            onPressed: () {
                              _showDialogpassword(context);
                            }),
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

_showDialogpassword(BuildContext context) async {
  TextEditingController passwordcontroller = TextEditingController();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text("Parar Testes Aromaticos?"),
        content: new Text("Para retirar o app do modo de teste insira a senha"),
        actions: <Widget>[
          TextFormField(
            keyboardType: TextInputType.number,
            controller: passwordcontroller,
          ),
          TextButton(
            child: new Text("PARAR TESTES"),
            onPressed: () {
              if (passwordcontroller.text == "123") {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => GridMain()),
                      (Route<dynamic> route) => false,
                );
              } else {
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      );
    },
  );
}


