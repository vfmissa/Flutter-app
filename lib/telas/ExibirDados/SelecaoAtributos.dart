// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'QuestinarioSliders.dart';
import 'package:path/path.dart';


class SelecaoAtributos extends StatefulWidget {

  String amostracontrole;
  String julgador;

  SelecaoAtributos(this.amostracontrole,this.julgador);
  @override
  _SelecaoAtributosState createState() => _SelecaoAtributosState();
}

class _SelecaoAtributosState extends State<SelecaoAtributos> {

  get julgador => widget.julgador;
  String get amostracontrole =>widget.amostracontrole;

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(//row de texto
                  children: [
                    Text(
                      "Julgador: $julgador",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      "Data: ",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                  ], mainAxisAlignment: MainAxisAlignment.spaceAround),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                height: 60,
                width: 700,
                decoration:
                BoxDecoration(border: Border.all(width: 3, color: Colors.blue)),
                child: AutoSizeText(
                  "Escolher os atributos a serem analizados \n",
                  maxLines: 15,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: 120,
                      height: 25,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        initialValue: "doce",readOnly: true,
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
                      height: 25,
                      child: TextFormField(readOnly: true,
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

            //SEGUNDO ITEM
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: 120,
                      height: 25,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        initialValue: "Cor",readOnly: true,
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
                      height: 25,
                      child: TextFormField(readOnly: true,
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

            ElevatedButton(onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) =>QuestinarioSliders(amostracontrole, julgador)));
            },
                child: Text(
                    "Iniciar Questionario", style: TextStyle(color: Colors.black)))
          ],

        ),
      ),

    );


  }
}
