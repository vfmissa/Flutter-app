// ignore_for_file: file_names, prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_test_app/Modelo de Classes/ModeloAvaliativo.dart';

class TestAvaliativoSalvo extends StatefulWidget {
  late final ModeloAvaliativo teste;

  TestAvaliativoSalvo(this.teste);

  @override
  _TestAvaliativoSalvoState createState() => _TestAvaliativoSalvoState();
}

class _TestAvaliativoSalvoState extends State<TestAvaliativoSalvo> {
  late ModeloAvaliativo teste;

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
                        "Amostra: " + teste.amostra_controle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                      ),
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
                      "Você está recebendo uma amostra controle C e N* amostras codificadas.)\n"
                      "Compare cada uma com o Controle quanto ao atributo (Especificar)\n"
                      "Expresse o valor da diferença utilizando a escala abaixo",
                      maxLines: 15,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      SizedBox(
                          width: 90,
                          height: 50,
                          child: Text(
                            "1: Nenhuma",
                            style: TextStyle(fontSize: 16),
                          )),
                      SizedBox(
                          width: 80,
                          height: 50,
                          child: Text(
                            "2: Ligeira",
                            style: TextStyle(fontSize: 16),
                          )),
                      SizedBox(
                          width: 90,
                          height: 50,
                          child: Text(
                            "3: Moderada",
                            style: TextStyle(fontSize: 16),
                          )),
                      SizedBox(
                          width: 80,
                          height: 50,
                          child: Text(
                            "4: Muita",
                            style: TextStyle(fontSize: 16),
                          )),
                      SizedBox(
                          width: 80,
                          height: 50,
                          child: Text(
                            "5: Extrema",
                            style: TextStyle(fontSize: 16),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: 200,
                            height: 20,
                            child: Text(
                              "Amostra Controle:" + teste.amostra_controle,
                              maxLines: 1,
                            )),
                        SizedBox(
                            width: 200,
                            height: 20,
                            child: AutoSizeText(
                              "Nota em relação a Caracteristica",
                              maxLines: 1,
                            )),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 120,
                            height: 35,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.amostra_1,
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
                            width: 65,
                            height: 35,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.nota1,
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
                            height: 35,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.amostra_2,
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
                            width: 65,
                            height: 35,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.nota2,
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
                            height: 35,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.amostra_3,
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
                            width: 65,
                            height: 35,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.nota3,
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
                            height: 35,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.amostra_4,
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
                            width: 65,
                            height: 35,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: teste.nota4,
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
                            height: 35,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: "amostra5",
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
                            width: 65,
                            height: 35,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                initialValue: "nota 5",
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
