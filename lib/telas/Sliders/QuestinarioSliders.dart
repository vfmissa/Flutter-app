// ignore_for_file: file_names, prefer_const_constructors

import 'dart:ffi';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_test_app/Helper_BD/Helper_BD.dart';
import 'package:food_test_app/Modelo%20de%20Classes/ModeloSlider.dart';
import 'package:food_test_app/telas/GridMain.dart';
import 'package:food_test_app/telas/Sliders/SliderAmostraProvador.dart';

// String CreateSliders="CREATE TABLE sliders
// (id INTEGER PRIMARY KEY AUTOINCREMENT,data DATETIME,
// amostra VARCHAR,valor_slider FLOAT,caracteristica VARCHAR,comentario VARCHAR)";

Salvar(int data, String provador, String amostra, String caracteristica,
    double valor, String coment) async {
  ModeloSlider teste =
      ModeloSlider(data, provador, amostra, caracteristica, valor, coment);
  var id = await Helper_BD().insertSlider(teste);

  print("id=" + id.toString());
}

class QuestinarioSliders extends StatefulWidget {
  String amostracontrole;
  String provador;
  String caracteristica;

  QuestinarioSliders(this.provador, this.amostracontrole, this.caracteristica);

  @override
  _QuestinarioSlidersState createState() => _QuestinarioSlidersState();
}

class _QuestinarioSlidersState extends State<QuestinarioSliders> {
  get amostra => widget.amostracontrole;

  get provador => widget.provador;

  get caracteristica1 => widget.caracteristica;

  double _SliderValueUm = 0;
  double _SliderValueDois = 0;

  TextEditingController comentcontroller = TextEditingController();

  var now = DateTime.now();

  List<String> amostras = <String>[];
  List<Float> Valor = <Float>[];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        /*appBar: AppBar(
          title: Text("Atributos para Avaliação"),
          backgroundColor: Colors.blue,
        ),*/
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 25, 5, 5),
            child: Column(
              children: [
                Row(//row de texto
                    children: [
                  Text(
                    "Julgador: $provador",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  ),
                  Text(
                    "Data: ${now.day}/${now.month}/${now.year}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20, fontStyle: FontStyle.italic),
                  ),
                ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
                Container(
                  height: 60,
                  width: 700,
                  decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.blue)),
                  child: AutoSizeText(
                    "Você recebera varias amostras para provar avalie posicionando o Slider na altura que representa oque você percebe do atributo em analise\n",
                    maxLines: 15,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 16, 25, 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start, //row de texto
                      children: [
                        Spacer(
                          flex: 1,
                        ),
                        Text(
                          "Nº Amostra",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                        ),
                        Spacer(
                          flex: 4,
                        ),
                        Text(
                          "Atributo",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                        ),
                        Spacer(
                          flex: 4,
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: 60,
                          height: 30,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            initialValue: "$amostra",
                            readOnly: true,
                            textCapitalization: TextCapitalization.sentences,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.blue,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          )),
                      SizedBox(
                          width: 120,
                          height: 30,
                          child: TextFormField(
                            initialValue: caracteristica1,
                            readOnly: true,
                            textCapitalization: TextCapitalization.sentences,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.blue,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "- $caracteristica1",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      width: 600,
                      height: 120,
                      child: Slider(
                        value: _SliderValueUm,
                        max: 90,
                        label: _SliderValueUm.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _SliderValueUm = value;
                          });
                        },
                      ),
                    ),
                    Text(
                      "+ $caracteristica1",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black),
                      color: Colors.white12,
                    ),
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: comentcontroller,
                          maxLines: 3,
                          //controller: comentario,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.blue,
                            contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                            hintText: "Comentarios:",
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                        )),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      debugPrint(_SliderValueDois.toString());
                      //Salvar(now.millisecondsSinceEpoch, amostra, _SliderValueUm, caracteristica1, comentcontroller.text);
                      Salvar(
                          now.millisecondsSinceEpoch,
                          provador,
                          amostra,
                          caracteristica1,
                          _SliderValueUm,
                          comentcontroller.text);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SliderAmostraProvador(caracteristica1)));
                    },
                    child: Text("Salvar Resposta",
                        style: TextStyle(color: Colors.black))),
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
                          _showDialog2(context, caracteristica1);
                        }),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_showDialog2(BuildContext context, String caracteristica) async {
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
                    builder: (context) =>
                        SliderAmostraProvador(caracteristica)),
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
          TextFormField(
            autofocus: true,
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
