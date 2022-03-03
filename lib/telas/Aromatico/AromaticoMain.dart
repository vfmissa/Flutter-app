// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:food_test_app/Modelo%20de%20Classes/ModeloAromatico.dart';
import 'package:food_test_app/telas/GridMain.dart';
import 'package:food_test_app/Helper_BD/Helper_BD.dart';

import 'InicioQuestinario.dart';

Salvar(
    int data,
    String provador,
    String numaAmostra,
    String Aroma,
    String numaAmostra2,
    String Aroma2,
    String numaAmostra3,
    String Aroma3,
    String numaAmostra4,
    String Aroma4,
    String numaAmostra5,
    String Aroma5,
    String numaAmostra6,
    String Aroma6,
    String numaAmostra7,
    String Aroma7,
    String numaAmostra8,
    String Aroma8,
    String numaAmostra9,
    String Aroma9,
    String numaAmostra10,
    String Aroma10) async {
  ModeloAromatico teste = ModeloAromatico(
      data,
      provador,
      numaAmostra,
      Aroma,
      numaAmostra2,
      Aroma2,
      numaAmostra3,
      Aroma3,
      numaAmostra4,
      Aroma4,
      numaAmostra5,
      Aroma5,
      numaAmostra6,
      Aroma6,
      numaAmostra7,
      Aroma7,
      numaAmostra8,
      Aroma8,
      numaAmostra9,
      Aroma9,
      numaAmostra10,
      Aroma10);
  var id = await Helper_BD().insertAroma(teste);

  print("id=" + id.toString());
}

class AromaticoMain extends StatefulWidget {
  @override
  _AromaticoMainState createState() => _AromaticoMainState();
  int numamostras;
  String provador;

  AromaticoMain(this.numamostras, this.provador);
}

class _AromaticoMainState extends State<AromaticoMain> {
  TextEditingController amostracontroller = TextEditingController();
  TextEditingController aromacontroller = TextEditingController();

  List<String> amostras = <String>[];
  List<String> aromas = <String>[];

  int numamostras = 0;
  String provador = "semnome";

  final _formkey = GlobalKey<FormState>();
  DateTime now = DateTime.now();

  @override
  void initState() {
    numamostras = widget.numamostras;
    provador = widget.provador;
    super.initState();
  }

  Widget build(BuildContext context) {
    int total = widget.numamostras;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Aromatico"),
        ),
        body: Container(
          color: Colors.white60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formkey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Provador: $provador",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontStyle: FontStyle.italic),
                          ),
                          Text(
                            "Data: ${now.day}/${now.month}/${now.year}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 20, fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ),
                    AutoSizeText(
                      "Você está recebendo dez amostras com aromas diferentes,"
                      " identifique cada aroma presente de acordo com o código.",
                      maxLines: 15,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              maxLength: 3,
                              textCapitalization: TextCapitalization.sentences,
                              controller: amostracontroller,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    int.parse(value) <= 100 ||
                                    int.parse(value) >= 1000) {
                                  return "N° Invalido";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.blue,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                //contentPadding: const EdgeInsets.all(600),
                                labelText: "N° Amostra",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )),
                          SizedBox(width: 120, height: 200),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.sentences,
                              controller: aromacontroller,
                              maxLength: 50,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Preencha o Campo";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.blue,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                //contentPadding: const EdgeInsets.all(600),
                                labelText: "Aroma",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),

                    ElevatedButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            amostras.insert(
                                (total - numamostras), amostracontroller.text);
                            aromas.insert(
                                (total - numamostras), aromacontroller.text);

                            if (numamostras == 1) {
                              for (var i = total; 10 > i; i++) {
                                amostras.insert((i), "null");
                                aromas.insert((i), "null");
                                debugPrint(i.toString());
                              }
                              ;

                              Salvar(
                                  now.millisecondsSinceEpoch,
                                  provador,
                                  amostras[9],
                                  aromas[9],
                                  amostras[8],
                                  aromas[8],
                                  amostras[7],
                                  aromas[7],
                                  amostras[6],
                                  aromas[6],
                                  amostras[5],
                                  aromas[5],
                                  amostras[4],
                                  aromas[4],
                                  amostras[3],
                                  aromas[3],
                                  amostras[2],
                                  aromas[2],
                                  amostras[1],
                                  aromas[1],
                                  amostras[0],
                                  aromas[0]);

                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InicioQuestionario(widget.numamostras)),
                                (Route<dynamic> route) => false,
                              );
                            }
                            numamostras--;
                            amostracontroller.clear();
                            aromacontroller.clear();
                          } else {
                            _showDialog(context);
                          }
                        },
                        child: Text("Submeter",
                            style: TextStyle(color: Colors.black))),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FloatingActionButton(child: Icon(
                          Icons.run_circle_outlined, size: 50,
                          color: Colors.black,),
                            backgroundColor: Colors.red,
                            onPressed: () {
                              _showDialog2(context,widget.numamostras);

                            }),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text("Erro"),
        content: new Text("Prencha o Formulario"),
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

_showDialog2(BuildContext context, int Namostras) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("PARA DESISTIR DO TESTE CLIQUE E SEGURE SAIR"),
        content: Text("Para continuar clique em CONTINUAR"),
        actions: <Widget>[
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("CONTINUAR")),
          ElevatedButton(
            child: Text("SAIR"),
            onLongPress: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => InicioQuestionario(Namostras)),
                (Route<dynamic> route) => false,
              );
            },
            onPressed: () {},
          ),
          TextButton(
            child: Text("PAUSAR TESTES"),
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
        title: new Text("Pausar Testes Aromaticos?"),
        content: new Text("Para retirar o app do modo de teste insira a senha"),
        actions: <Widget>[
          TextFormField(autofocus: true,
            keyboardType: TextInputType.number,
            controller: passwordcontroller,
          ),
          TextButton(
            child: new Text("PAUSAR TESTES"),
            onPressed: () {
              if (passwordcontroller.text == "123") {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => GridMain()),
                  (Route<dynamic> route) => false,
                );
              }
            },
          ),
        ],
      );
    },
  );
}
