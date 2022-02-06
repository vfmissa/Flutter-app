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
    return  Container(
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
                        "Amostra: "+teste.amostra_controle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                      ),
                      Text(
                        "Julgador: ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                      ),
                      Text("Data:",
                        //"Data: ${now.day}/${now.month}/${now.year}",
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
                          width: 90, height: 50, child: Text("1: Nenhuma",style: TextStyle(fontSize:16),)),
                      SizedBox(
                          width: 80, height: 50, child: Text("2: Ligeira",style: TextStyle(fontSize:16),)),
                      SizedBox(
                          width: 90, height: 50, child: Text("3: Moderada",style: TextStyle(fontSize:16),)),
                      SizedBox(
                          width: 80, height: 50, child: Text("4: Muita",style: TextStyle(fontSize:16),)),
                      SizedBox(
                          width: 80, height: 50, child: Text("5: Extrema",style: TextStyle(fontSize:16),)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        SizedBox(width: 60, height: 20, child: Text("Amostra")),
                        SizedBox(width: 1, height: 20, child: Text("")),
                        SizedBox(width: 60, height: 20, child: Text("Valor")),
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
                            width: 60,
                            height: 35,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
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
                            width: 60,
                            height: 35,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
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
                            width: 60,
                            height: 35,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
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
                            width: 60,
                            height: 35,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
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
                            width: 60,
                            height: 35,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
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
                            width: 60,
                            height: 35,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
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
