// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_test_app/Helper_BD/Helper_BD.dart';
import 'package:food_test_app/Modelo%20de%20Classes/ModeloAvaliativo.dart';
import 'package:food_test_app/telas/GridMain.dart';

import '../main.dart';

class FichaAvaliacao extends StatefulWidget {
  int num_amostra;
  String provador;
  String controle;

  FichaAvaliacao(this.num_amostra, this.provador, this.controle);

  _FichaAvaliacaoState createState() => _FichaAvaliacaoState();
}



_Salvar(int data,String provador,String Controle,String numaAmostra,String nota,String numaAmostra2,String nota2,String numaAmostra3,String nota3,
String numaAmostra4,String nota4,String numaAmostra5,String nota5,String numaAmostra6,String nota6,
    String numaAmostra7,String nota7,String numaAmostra8,String nota8,String numaAmostra9,String nota9,String numaAmostra10,String nota10) async {

  print(numaAmostra2);
  print(numaAmostra2);


  ModeloAvaliativo teste=ModeloAvaliativo(data, provador, Controle, numaAmostra, nota, numaAmostra2, nota2, numaAmostra3, nota3, numaAmostra4,
      nota4, numaAmostra5, nota5, numaAmostra6, nota6, numaAmostra7, nota7, numaAmostra8, nota8, numaAmostra9, nota9, numaAmostra10, nota10);

  var id = Helper_BD().insertAvaliativo(teste);



}






class _FichaAvaliacaoState extends State<FichaAvaliacao> {
  DateTime now = DateTime.now();
  int num_amostra = 0;
  String provador = "provador";
  String controle = "controle";
  int total=0;

  TextEditingController amostracontroller = TextEditingController();
  TextEditingController valorcontroller = TextEditingController();

  List<String>amostras=<String>[];
  List<String>notas=<String>[];

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {

    num_amostra = widget.num_amostra;
    provador = widget.provador;
    controle = widget.controle;

    super.initState();
  }

  Widget build(BuildContext context) {

   total=widget.num_amostra;


    return WillPopScope(
      onWillPop: () async {
        //debugPrint("retorno habilitado");

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
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.blueAccent, width: 3),
                          color: Colors.white60),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            SizedBox(
                                width: 90,
                                height: 30,
                                child: Text(
                                  "1: Nenhuma",
                                  style: TextStyle(fontSize: 16),
                                )),
                            SizedBox(
                                width: 80,
                                height: 30,
                                child: Text(
                                  "2: Ligeira",
                                  style: TextStyle(fontSize: 16),
                                )),
                            SizedBox(
                                width: 90,
                                height: 30,
                                child: Text(
                                  "3: Moderada",
                                  style: TextStyle(fontSize: 16),
                                )),
                            SizedBox(
                                width: 80,
                                height: 30,
                                child: Text(
                                  "4: Muita",
                                  style: TextStyle(fontSize: 16),
                                )),
                            SizedBox(
                                width: 80,
                                height: 30,
                                child: Text(
                                  "5: Extrema",
                                  style: TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: 60, height: 20, child: Text("Amostra")),
                          SizedBox(width: 1, height: 20, child: Text("")),
                          SizedBox(width: 60, height: 20, child: Text("Valor")),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Form(
                          key: _formkey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 120,
                                height: 60,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: amostracontroller,
                                    maxLength: 3,
                                    maxLines: 1,
                                    validator: (value) {
                                      if (value!.trim().isEmpty ||  int.parse(value) > 999 || int.parse(value) <= 100) {
                                        return "Nº invalido";
                                      }
                                      return null;
                                    },
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.blue,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(3),
                                        ),
                                        //contentPadding: const EdgeInsets.all(600),
                                        labelText: "Amostra",
                                        floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 120,
                                height: 60,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                      controller: valorcontroller,
                                    maxLength: 1,
                                    validator: (value) {
                                      if (value!.trim().isEmpty ||int.parse(value) > 5 ||int.parse(value) == 0) {
                                        return "Nº invalido";
                                      }
                                      return null;
                                    },
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.blue,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(3),
                                        ),
                                        //contentPadding: const EdgeInsets.all(600),
                                        labelText: "Valor",
                                        floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          amostras.insert(
                              (total - num_amostra), amostracontroller.text);
                          notas.insert(
                              (total - num_amostra), valorcontroller.text);




                          if (num_amostra == 1) {
                            for(var i=total;10>i;i++){
                              amostras.insert((i),"null");
                              notas.insert((i),"null");

                            };



                            _Salvar(now.millisecondsSinceEpoch, provador,controle, amostras[9], notas[9], amostras[8], notas[8],amostras[7], notas[7], amostras[6], notas[6], amostras[5],
                                notas[5], amostras[4], notas[4], amostras[3], notas[3], amostras[2], notas[2], amostras[1], notas[1], amostras[0], notas[0]);

                            //debugPrint(amostras[(total - num_amostra)]+'amostra' + num_amostra.toString());


                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => GridMain()),
                                  (Route<dynamic> route) => false,
                            );

                          } else {
                            num_amostra--;
                            //debugPrint(num_amostra.toString() + "faltam");
                            amostracontroller.clear();
                            valorcontroller.clear();
                          }
                        }



                      }, child: Text("Submeter",style: TextStyle(color: Colors.black)),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
