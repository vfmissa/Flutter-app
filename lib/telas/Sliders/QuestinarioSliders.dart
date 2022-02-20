// ignore_for_file: file_names, prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_test_app/Helper_BD/Helper_BD.dart';
import 'package:food_test_app/Modelo%20de%20Classes/ModeloSlider.dart';
import 'package:food_test_app/telas/GridMain.dart';

// String CreateSliders="CREATE TABLE sliders
// (id INTEGER PRIMARY KEY AUTOINCREMENT,data DATETIME,
// amostra VARCHAR,valor_slider FLOAT,caracteristica VARCHAR,comentario VARCHAR)";

Salvar(int data,String provador,String amostra, String caracteristica, double valor,String coment) async {

  ModeloSlider teste = ModeloSlider(data,provador, amostra, caracteristica, valor, coment);
  var id = await Helper_BD().insertSlider(teste);

  print("id=" + id.toString());
}

class QuestinarioSliders extends StatefulWidget {
  String amostracontrole;
  String provador;
  String caracteristica;

  QuestinarioSliders(this.provador,this.amostracontrole,this.caracteristica);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Atributos para Avaliação"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
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
                style:
                    const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
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
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.start, //row de texto
                      children: [
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      "Nº Amostra",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                    Spacer(
                      flex: 4,
                    ),
                    Text(
                      "Percepção do Atributo",
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
                  SizedBox(
                    width: 300,
                    child: Slider(
                      value: _SliderValueUm,
                      max: 100,
                      label: _SliderValueUm.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _SliderValueUm = value;
                        });
                      },
                    ),
                  )
                ],
              ),
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
                   Salvar(now.millisecondsSinceEpoch,provador,amostra,caracteristica1, _SliderValueUm,comentcontroller.text);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              GridMain()));

                },
                child: Text("Salvar Questionario",
                    style: TextStyle(color: Colors.black))),
          ],
        ),
      ),
    );
  }
}
