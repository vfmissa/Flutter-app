// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_test_app/Helper_BD/Helper_BD.dart';
import 'package:food_test_app/Modelo%20de%20Classes/ModeloDiferenteIgual.dart';
import 'package:food_test_app/telas/GridMain.dart';

Salvar(int data, String julgador, String amostra0, String amostra1,
    String amostra2, int amostradif, String coment) async {
  ModeloDiferenteIgual teste = ModeloDiferenteIgual(
      data, julgador, amostra0, amostra1, amostra2, amostradif, coment);

  var id = await Helper_BD().insertDif_igual(teste);
  print("id=" + id.toString());
}

class DiferenteEigual extends StatefulWidget {
  late String amostra0;
  late String amostra1;
  late String amostra2;
  late String Provador;

  DiferenteEigual(this.amostra0, this.amostra1, this.amostra2,this.Provador);

  @override
  _DiferenteEigualState createState() => _DiferenteEigualState();
}

class _DiferenteEigualState extends State<DiferenteEigual> {
  TextEditingController comentariocontroller = TextEditingController();

  String _valorpadrao = "0";

  var now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String amostra0 = widget.amostra0;
    String amostra1 = widget.amostra1;
    String amostra2 = widget.amostra2;
    String provador = widget.Provador;

    return Scaffold(
      appBar: AppBar(
        title: Text("FICHA DE ANÁLISE DISCRIMINATIVO"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.black54),
              color: Colors.white30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.all(25)),
              Row(//row de texto
                  children: [
                Text(
                  "Provador: $provador",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontStyle: FontStyle.italic),
                ),
                Text(
                  "DATA:${now.day}/${now.month}/${now.year}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
              ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
              const SizedBox(
                height: 50,
                width: 0,
              ),
              const Text(
                "Prove as amostras da esquerda para a direita. Duas amostras são iguais e uma é diferente. Identifique com um círculo a amostra diferente.",
                style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 20,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 15),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: TextFormField(
                        readOnly: true,
                        keyboardType: TextInputType.text,
                        initialValue: amostra0,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blue,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                          ), //border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero))
                        ),
                      )),
                ),
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: TextFormField(
                        readOnly: true,
                        keyboardType: TextInputType.text,
                        initialValue: amostra1,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            )),
                      )),
                ),
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: TextFormField(
                        readOnly: true,
                        keyboardType: TextInputType.text,
                        initialValue: amostra2,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blue,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      )),
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 0, 12),
                child: Container(
                  width: 800,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0, color: Colors.blue)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: Radio(
                            value: "1",
                            groupValue: _valorpadrao,
                            onChanged: (value) {
                              setState(() {
                                _valorpadrao = value as String;
                              });
                            },
                          ),
                          title: FittedBox(
                              child: AutoSizeText("Amostra: $amostra0",
                                  maxFontSize: 12)),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          leading: Radio(
                            value: "2",
                            groupValue: _valorpadrao,
                            onChanged: (value) {
                              setState(() {
                                _valorpadrao = value as String;
                              });
                            },
                          ),
                          title: FittedBox(
                              child: AutoSizeText("Amostra: $amostra1",
                                  maxFontSize: 12)),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          leading: Radio(
                            value: "3",
                            groupValue: _valorpadrao,
                            onChanged: (value) {
                              setState(() {
                                _valorpadrao = value as String;
                              });
                            },
                          ),
                          title: FittedBox(
                              child: AutoSizeText("Amostra: $amostra2",
                                  maxFontSize: 12)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                  color: Colors.white12,
                ),
                // ignore: prefer_const_constructors
                child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    // ignore: prefer_const_constructors
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      maxLines: 3,
                      controller: comentariocontroller,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.blue,
                        contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                        hintText: "Comentarios: ",
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    )),
              ),

              ElevatedButton(
                onPressed: () async {
                  //qual amostra foi considerada diferente
                  if (_valorpadrao == "1") {
                    Salvar(now.millisecondsSinceEpoch, provador, amostra0,
                        amostra1, amostra2, 1, comentariocontroller.text);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => GridMain()));
                  }
                  if (_valorpadrao == "2") {
                    Salvar(now.millisecondsSinceEpoch, provador, amostra0,
                        amostra1, amostra2, 2, comentariocontroller.text);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => GridMain()));
                  }
                  if (_valorpadrao == "3") {
                    Salvar(now.millisecondsSinceEpoch, provador, amostra0,
                        amostra1, amostra2, 3, comentariocontroller.text);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => GridMain()));
                  }if(_valorpadrao == "0"){
                    _showDialog(context);
                  }

                },
                child: const Text("Submeter",
                    style: TextStyle(color: Colors.black)),
              )
            ],
          ),
        ),
      ),
    );
  }
}


_showDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text("Escolha uma amostra"),
        content: new Text(" Vote na amostra que é diferente "),
        actions: <Widget>[
          new TextButton(
            child: new Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}