// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:food_test_app/Modelo%20de%20Classes/ModeloAromatico.dart';
import 'package:food_test_app/telas/GridMain.dart';
import 'package:food_test_app/Helper_BD/Helper_BD.dart';




Salvar(int data,String provador,String numaAmostra,String Aroma1,String Aroma2) async {


  //teste_discriminativo(id INTEGER PRIMARY KEY AUTOINCREMENT,amostra_controle VARCHAR,amostra_testada VARCHAR , amostra2 INT, amostra3 INT ,comentario VARCHAR)";
  ModeloAromatico teste =  ModeloAromatico(data,provador,numaAmostra,Aroma1,Aroma2);
   var id = await Helper_BD().insertAroma(teste);

 print("id="+id.toString());
}


class AromaticoMain extends StatefulWidget {
  @override
  _AromaticoMainState createState() => _AromaticoMainState();
  int numamostras;
  String julgador;

  AromaticoMain(this.numamostras,this.julgador);

}

class _AromaticoMainState extends State<AromaticoMain> {
  TextEditingController amostracontroller = TextEditingController();
  TextEditingController aromacontroller = TextEditingController();
  int numamostras = 0;
  String julgador="semnome";

  final _formkey = GlobalKey<FormState>();
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    julgador=widget.julgador;
    numamostras = widget.numamostras;
    return Scaffold(
      body: Container(
        color: Colors.white60,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formkey,
            child: Column(
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
                    Text(
                      "Data: ${now.day}/${now.month}/${now.year}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
                Container(
                  height: 60,
                  width: 700,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.blue)),
                  child: AutoSizeText(
                    "Você está recebendo dez amostras com aromas diferentes, identifique cada aroma presente de acordo com o código.",
                    maxLines: 15,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.sentences,
                              controller: amostracontroller,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Prencha o Campo";
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
                                labelText: "N° Amostra",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )),
                      SizedBox(width: 120,),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.sentences,
                              controller: aromacontroller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Preencha o Campo";
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
                                labelText: "Aroma",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        numamostras--;
                        if (numamostras == 0) {
                         await Salvar(now.millisecondsSinceEpoch,"nome provador",amostracontroller.text,aromacontroller.text,"mais Aromas");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => GridMain()));
                          debugPrint("N= " + numamostras.toString());
                        } else {
                         await Salvar(now.millisecondsSinceEpoch," nome provador",amostracontroller.text,aromacontroller.text,"mais Aromas");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AromaticoMain(numamostras,julgador)));
                          debugPrint("N= " + numamostras.toString());
                        }
                      } else {
                        _showDialog(context);
                      }
                    },
                    child: Text("Submeter",
                        style: TextStyle(color: Colors.black)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text("Erro"),
        content: new Text("Prencha apenas com os dados apresentados"),
        actions: <Widget>[
          new TextButton(
            child: new Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
