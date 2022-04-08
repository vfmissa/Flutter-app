// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ComparativoAmostra.dart';

class ComparativoNumAmostras extends StatefulWidget {
  String amostra;
  String julgador;

  ComparativoNumAmostras(this.amostra,this.julgador);

  @override
  _ComparativoNumAmostraState createState() => _ComparativoNumAmostraState();
}

class _ComparativoNumAmostraState extends State<ComparativoNumAmostras> {
  DateTime now = DateTime.now();
  String amostra_controle = "text";
  String julgador = "julgador";

  @override
  void initState() {
    //permite usar os parametros como variaveis
    amostra_controle = widget.amostra;
    julgador = widget.julgador;
    super.initState();
  }

  String _valorpadrao = "0";
  TextEditingController num_amostras = TextEditingController();
  final _valueamostra = GlobalKey<FormState>();

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
                      "Julgador: ${widget.julgador}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      "Data: ${now.day}/${now.month}/${now.year}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.blue)),
                  child: AutoSizeText(
                    "Inserir o número de Amostras a serem comparadas a Amostra de Controle",
                    maxLines: 15,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 30),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 80, height: 50, child: Text("Total de Amostras")),
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
                              maxLength: 1,
                              maxLines: 1,
                              controller: num_amostras,
                              validator: (value) {
                                if (value!.trim().isEmpty ||
                                    int.parse(value) > 6 || int.parse(value) == 0) {
                                  return "Nº invalido";
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
                              builder: (context) => Comparativo(
                                  amostra_controle, julgador,int.parse(num_amostras.text))));
                      print(amostra_controle);
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
