// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_test_app/Helper_BD/Helper_BD.dart';
import 'package:food_test_app/telas/GridMain.dart';

import '../main.dart';

class FichaAvaliacao extends StatefulWidget {

  String num_amostra;
  String provador;
  String amostra2;
  String amostra3;
  String amostra4;

  FichaAvaliacao(this.num_amostra, this.provador,this.amostra2,this.amostra3,this.amostra4);

  _FichaAvaliacaoState createState() => _FichaAvaliacaoState();
}

class _FichaAvaliacaoState extends State<FichaAvaliacao> {

  DateTime now = DateTime.now();
  String num_amostra = "text";
  String provador = "julgador";

  @override
  void initState() {
    num_amostra = widget.num_amostra;
    provador = widget.provador;
    super.initState();
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        debugPrint("retorno habilitado");
        return true;
      },
      child: Container(
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
                        /*Text(
                          "Amostra:$amostra",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                        ),*/
                        Text(
                          "Julgador: ${widget.provador}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24, fontStyle: FontStyle.italic),
                        ),
                        Text(
                          "Data: ${now.day}/${now.month}/${now.year}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.blue)),
                      child: AutoSizeText(
                        "Você está recebendo uma amostra controle C e $num_amostra amostras codificadas.)\n"
                            "Compare cada uma com o Controle quanto ao atributo (Especificar)\n"
                            "Expresse o valor da diferença utilizando a escala abaixo",
                        maxLines: 15,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                   SizedBox(height: 10,),
                    Container(decoration: BoxDecoration(border: Border.all(color:Colors.blueAccent,width: 3),color: Colors.white60),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            SizedBox(
                                width: 90, height: 30, child: Text("1: Nenhuma",style: TextStyle(fontSize:16),)),
                            SizedBox(
                                width: 80, height: 30, child: Text("2: Ligeira",style: TextStyle(fontSize:16),)),
                            SizedBox(
                                width: 90, height: 30, child: Text("3: Moderada",style: TextStyle(fontSize:16),)),
                            SizedBox(
                                width: 80, height: 30, child: Text("4: Muita",style: TextStyle(fontSize:16),)),
                            SizedBox(
                                width: 80, height: 30, child: Text("5: Extrema",style: TextStyle(fontSize:16),)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
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
                    ElevatedButton(
                      onPressed: () {
                        Helper_BD().SalvarAvaliativo("Controle1","testada1", "nota1");
                        //print(Helper_BD().recuperardobd_Avaliativo());
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => GridMain()));
                      },
                      child: Text("Submeter",
                          style: TextStyle(color: Colors.black)),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
