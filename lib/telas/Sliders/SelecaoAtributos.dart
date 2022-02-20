// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'QuestinarioSliders.dart';
import 'package:path/path.dart';

class SelecaoAtributos extends StatefulWidget {
  String amostracontrole;
  String julgador;

  SelecaoAtributos(this.amostracontrole, this.julgador);

  @override
  _SelecaoAtributosState createState() => _SelecaoAtributosState();
}

class _SelecaoAtributosState extends State<SelecaoAtributos> {
  TextEditingController amostracontroller1 = TextEditingController();
  TextEditingController caracteristicacontroller1 = TextEditingController();
  TextEditingController caracteristicacontroller2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  get julgador => widget.julgador;

  String get amostracontrole => widget.amostracontrole;

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
                  style: const TextStyle(
                      fontSize: 20, fontStyle: FontStyle.italic),
                ),
              ], mainAxisAlignment: MainAxisAlignment.spaceAround),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                height: 60,
                width: 700,
                decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.blue)),
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
              child: Form(
                key: _formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: 120,
                        height: 50,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: caracteristicacontroller1,
                          maxLength: 20,
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty ) {
                              return "Prencha os campos";
                            }
                            return null;
                          },
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                            helperText: "Atributo",
                            helperStyle:
                                TextStyle(color: Colors.black, fontSize: 10),
                            filled: true,
                            fillColor: Colors.blue,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        )),
                    SizedBox(
                        width: 120,
                        height: 50,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          textCapitalization: TextCapitalization.sentences,
                          controller: amostracontroller1,
                          maxLength: 3,
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty ||
                                int.parse(value) <= 100 ||
                                int.parse(value) >= 1000) {
                              return "Prencha os campos";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            helperText: "Amostra",
                            helperStyle:
                                TextStyle(color: Colors.black, fontSize: 10),
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
            ),

            //SEGUNDO ITEM
            /*Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: 120,
                      height: 50,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: caracteristicacontroller2,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          helperText: "Atributo",
                          helperStyle:
                              TextStyle(color: Colors.black, fontSize: 10),
                          filled: true,
                          fillColor: Colors.blue,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      )),
                  SizedBox(
                      width: 120,
                      height: 50,
                      child: TextFormField(
                        readOnly: true,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          helperText: "Atributo",
                          helperStyle:
                              TextStyle(color: Colors.black, fontSize: 10),
                          filled: true,
                          fillColor: Colors.blue,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      )),
                ],
              ),
            ),*/

            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuestinarioSliders(
                                amostracontroller1.text,
                                julgador,
                                caracteristicacontroller1.text)));
                  }//if
                },
                child: Text("Iniciar Questionario",
                    style: TextStyle(color: Colors.black)))
          ],
        ),
      ),
    );
  }
}
