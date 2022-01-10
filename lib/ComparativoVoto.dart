// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class ComparativoVoto extends StatefulWidget {
  String amostra;
  String julgador;

  ComparativoVoto(this.amostra, this.julgador);

  @override
  _ComparativoVotoState createState() => _ComparativoVotoState();
}

class _ComparativoVotoState extends State<ComparativoVoto> {
  DateTime now = DateTime.now();
  String amostra = "text";
  String julgador = "julgador";

  @override
  void initState() {
    //permite usar os parametros como variaveis
    amostra = widget.amostra;
    julgador = widget.julgador;
    super.initState();
  }

  String _valorpadrao = "0";
  TextEditingController amostracontrole = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ficha de Avaliação"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:800,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.black54)),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Julgador: ${widget.julgador}",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  ),
                  Text(
                    "Data: ${now.day}/${now.month}/${now.year}",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                  ),
                ],
              ),

              Container(
                height: 150,
                decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.blue)),
                child: AutoSizeText(
                  "Compare a amostra com o Controle Quanto ao atributo (Especificar)\n"
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer convallis, lorem vitae imperdiet luctus, sapien nulla iaculis nisi,"
                      " sed viverra orci arcu malesuada felis. Etiam sed sodales ligula, ut sollicitudin justo."
                      " Suspendisse potenti. Quisque mattis leo nec viverra porta. "
                      "Etiam vitae turpis felis. Phasellus efficitur quis lacus vitae vulputate.",
                  maxLines: 15,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 30),
                ),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(decoration: BoxDecoration(color: Colors.blue,border: Border.all(color: Colors.black54,width: 3)),
                      child: SizedBox(
                          width: 150,
                          height: 30,
                          child: AutoSizeText(
                            "Amostra:$amostra",
                            style: TextStyle(fontSize: 36),
                            maxLines: 1,
                          ))),
                ],
              ),
              Container(width: 800,height: 60,
                decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.blue)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: Radio(
                          value: "1",
                          groupValue: _valorpadrao,
                          onChanged: (value) {
                            setState(() {
                              _valorpadrao = value as String;
                            });
                          },
                        ),
                        title: FittedBox(child: AutoSizeText("1: Nenhuma",maxFontSize: 16)),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: Radio(
                          value: "2",
                          groupValue: _valorpadrao,
                          onChanged: (value) {
                            setState(() {
                              _valorpadrao = value as String;
                            });
                          },
                        ),
                        title: FittedBox(child: AutoSizeText("2: Ligeira",maxFontSize: 16)),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: Radio(
                          value: "3",
                          groupValue: _valorpadrao,
                          onChanged: (value) {
                            setState(() {
                              _valorpadrao = value as String;
                            });
                          },
                        ),
                        title: FittedBox(child: AutoSizeText("3:Moderada",style: TextStyle(fontSize: 16),)),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: Radio(
                          value: "4",
                          groupValue: _valorpadrao,
                          onChanged: (value) {
                            setState(() {
                              _valorpadrao = value as String;
                            });
                          },
                        ),
                        title: FittedBox(child: AutoSizeText("4: Muita",maxFontSize: 16)),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: Radio(
                          value: "5",
                          groupValue: _valorpadrao,
                          onChanged: (value) {
                            setState(() {
                              _valorpadrao = value as String;
                            });
                          },
                        ),
                        title: FittedBox(child: AutoSizeText("5: Extrema",maxFontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home()));
                  print(_valorpadrao);
                },
                child:
                    Text("Submeter", style: TextStyle(color: Colors.black)),
              )
            ]),
      ),
    );
  }
}
