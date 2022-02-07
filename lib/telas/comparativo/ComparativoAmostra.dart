// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ComparativoVoto.dart';
import '../main.dart';

class Comparativo extends StatefulWidget {
  String amostra_controle;
  String julgador;
  int num_amostras;
  Comparativo(this.amostra_controle, this.julgador,this.num_amostras);

  @override
  _ComparativoState createState() => _ComparativoState();
}

class _ComparativoState extends State<Comparativo> {
  DateTime now = DateTime.now();
  String amostra_controle = "text";
  String julgador = "julgador";
   int num_amostras=0;
  @override
  void initState() {
    //permite usar os parametros como variaveis
    amostra_controle = widget.amostra_controle;
    julgador = widget.julgador;
    num_amostras = widget.num_amostras;
    super.initState();
  }

  String _valorpadrao = "0";
  TextEditingController amostra_a_comparar = TextEditingController();
  final _valueamostra = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:()async {
        //print("retorno desabilitado");
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Amostra a ser Avaliada"),
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
                      /*Text(
                        "Amostra:$amostra",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                      ),*/
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
                  /*SizedBox(
                    width: 475,
                    height: 30,
                    child: Text(
                        "Você está recebendo uma amostra controle (C) e uma amostras codificada."),
                  ),*/
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.blue)),
                    child: AutoSizeText(
                      "Compare a amostra com o Controle $amostra_controle Quanto ao atributo (Especificar)\n"
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer convallis, lorem vitae imperdiet luctus, sapien nulla iaculis nisi,"
                      " sed viverra orci arcu malesuada felis. Etiam sed sodales ligula, ut sollicitudin justo."
                      " Suspendisse potenti. Quisque mattis leo nec viverra porta. "
                      "Etiam vitae turpis felis. Phasellus efficitur quis lacus vitae vulputate.",
                      maxLines: 15,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  /*Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 80, height: 50, child: Text("1: Nenhuma")),
                      SizedBox(
                          width: 80, height: 50, child: Text("2: Ligeira")),
                      SizedBox(
                          width: 80, height: 50, child: Text("3: Moderada")),
                      SizedBox(width: 80, height: 50, child: Text("4: Muita")),
                      SizedBox(
                          width: 80, height: 50, child: Text("5: Extrema")),
                    ],
                  ),*/

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 60, height: 20, child: Text("Amostra")),
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
                                maxLength: 3,
                                maxLines: 1,
                                controller: amostra_a_comparar,
                                validator: (value) {
                                  if (value!.trim().isEmpty ||
                                      int.parse(value) < 100) {
                                    return "amostra não corresponde";
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
                                builder: (context) => ComparativoVoto(
                                    amostra_a_comparar.text, julgador,amostra_controle,num_amostras)));
                        print(_valorpadrao);
                      }
                    },
                    child:
                        Text("Submeter", style: TextStyle(color: Colors.black)),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
