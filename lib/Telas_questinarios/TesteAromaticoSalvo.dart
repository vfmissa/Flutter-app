// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_test_app/Modelo de Classes/ModeloAromatico.dart';

class TesteAromaticoSalvo extends StatefulWidget {
  late ModeloAromatico teste;

  TesteAromaticoSalvo(this.teste);

  @override
  _TesteAromaticoSalvoState createState() => _TesteAromaticoSalvoState();
}

class _TesteAromaticoSalvoState extends State<TesteAromaticoSalvo> {
  late ModeloAromatico teste;

  @override
  void initState() {
    teste = widget.teste;
    super.initState();
  }

  Widget build(BuildContext context) {
    var data = DateTime.fromMillisecondsSinceEpoch(teste.data);
    DateTime dia = new DateTime(data.year, data.month, data.day);

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Ficha de Avaliação"),
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
                        "Julgador: " + teste.provador,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                      ),
                      Text(
                        "Data: ${dia.day}/${dia.month}/${dia.year}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  Container(
                    height: 75,
                    decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.blue)),
                    child: AutoSizeText(
                      "N° amostras com aromas diferentes,"
                      " identifique cada aroma presente de acordo com o código.",
                      maxLines: 15,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Nº Amostra",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                      ),
                      Text(
                        "Aroma",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 120,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.Numamostra10,
                                readOnly: true,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.aroma10,
                                readOnly: true,
                                style: TextStyle(fontSize: 10),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 120,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.Numamostra9,
                                readOnly: true,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.aroma9,
                                readOnly: true,
                                style: TextStyle(fontSize: 10),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 120,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.Numamostra8,
                                readOnly: true,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.aroma8,
                                readOnly: true,
                                style: TextStyle(fontSize: 10),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 120,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.Numamostra7,
                                readOnly: true,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.aroma7,
                                readOnly: true,
                                style: TextStyle(fontSize: 10),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 120,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.Numamostra6,
                                readOnly: true,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.aroma6,
                                readOnly: true,
                                style: TextStyle(fontSize: 10),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 120,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.Numamostra5,
                                readOnly: true,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.aroma5,
                                readOnly: true,
                                style: TextStyle(fontSize: 10),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 120,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.Numamostra4,
                                readOnly: true,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.aroma4,
                                readOnly: true,
                                style: TextStyle(fontSize: 10),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 120,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.Numamostra3,
                                readOnly: true,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.aroma3,
                                readOnly: true,
                                style: TextStyle(fontSize: 10),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 120,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.Numamostra2,
                                readOnly: true,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.aroma2,
                                readOnly: true,
                                style: TextStyle(fontSize: 10),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 120,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.Numamostra,
                                readOnly: true,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.aroma,
                                readOnly: true,
                                style: TextStyle(fontSize: 10),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
