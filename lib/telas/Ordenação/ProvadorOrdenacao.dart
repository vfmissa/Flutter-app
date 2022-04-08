// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_test_app/telas/Ordena%C3%A7%C3%A3o/AnaliseDiscriminativo9amostras.dart';

import '../GridMain.dart';



class ProvadorOrdenacao extends StatefulWidget {

  late String caracteristica;
  late int numAmostras;

  ProvadorOrdenacao(this.caracteristica,this.numAmostras);



  @override
  _ProvadorOrdenacaoState createState() => _ProvadorOrdenacaoState();
}

class _ProvadorOrdenacaoState extends State<ProvadorOrdenacao> {

  final _valueamostra = GlobalKey<FormState>();
  TextEditingController provadorcontroller = TextEditingController();
  String julgador = "SemNOme";

  @override
  Widget build(BuildContext context) {

    int Namostras = widget.numAmostras;
    String Descricao =
        "Você vai experimentar $Namostras amostras diferentes. Preencha a indentificação acima para prosseguir ";


    return  WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Questionario Ordenação"),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Insira o nome do Provador",
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
                            keyboardType: TextInputType.text,
                            maxLength: 50,
                            maxLines: 1,
                            controller: provadorcontroller,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "insira provador";
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_valueamostra.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AnaliseDiscriminativo9amostras(widget.numAmostras, provadorcontroller.text,widget.caracteristica)));
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
                              _showDialog(context, Namostras);
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

_showDialog(BuildContext context, int Namostras) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Favor informar alguem se deseja sair do teste"),
        content: Text("Para continuar clique em Continuar"),
        actions: <Widget>[
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("CONTINUAR")),
          TextButton(
            child: Text("PARAR TESTES"),
            onPressed: () {
              _showDialogpassword(context);
            },
          ),
        ],
      );
    },
  );
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

