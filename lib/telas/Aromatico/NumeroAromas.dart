// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'AromaticoMain.dart';

class NumeroAromas extends StatefulWidget {
  String julgador;
  @override
  _NumeroAromasState createState() => _NumeroAromasState();
  NumeroAromas(this.julgador);
}

class _NumeroAromasState extends State<NumeroAromas> {

  final _valueamostra = GlobalKey<FormState>();

  TextEditingController num_amostras = TextEditingController();
  String julgador = "SemNOme";

  @override
  void initState() {
    julgador = widget.julgador;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Numero de Amostras"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.black54)),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Julgador: $julgador",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                   /* Text(
                      "Data: ",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                    ),*/
                  ],
                ),
                /*SizedBox(
                  width: 475,
                  height: 30,
                  child: Text(
                      "Você está recebendo uma amostra controle (C) e uma amostras codificada."),
                ),*/
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.blue)),
                  child: AutoSizeText(
                    "Inserir o número de Amostras a serem Testadas",
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 80,
                        height: 50,
                        child: Text("Total de Amostras")),
                    SizedBox(
                      width: 150,
                      height: 60,
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Form(
                            key: _valueamostra,
                            child: TextFormField(
                              style: TextStyle(fontSize: 30),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              maxLength: 2,
                              maxLines: 1,
                              controller: num_amostras,
                              validator: (value) {
                                if (value!.trim().isEmpty ||
                                    int.parse(value) > 10 ||
                                    int.parse(value) == 0) {
                                  return "Nº invalido maximo 10";
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
                                //border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero))
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_valueamostra.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AromaticoMain(int.parse(num_amostras.text),julgador)));
                    }
                  },
                  child:
                      Text("Submeter", style: TextStyle(color: Colors.black)),
                )
              ]),
        ),
      ),
    );
  }
}
