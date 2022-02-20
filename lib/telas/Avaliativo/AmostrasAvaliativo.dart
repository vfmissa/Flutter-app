// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_test_app/telas/Avaliativo/FichaAvaliacao.dart';

class AmostrasAvaliativo extends StatefulWidget {
  @override
  _AmostrasAvaliativoState createState() => _AmostrasAvaliativoState();

}

class _AmostrasAvaliativoState extends State<AmostrasAvaliativo> {

  final _valueamostra = GlobalKey<FormState>();

  TextEditingController num_amostras = TextEditingController();
  TextEditingController provadorcontroller = TextEditingController();
  String julgador = "SemNOme";

  @override


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
          child: Form(
            key: _valueamostra,
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Insira o nome do Provador",style: TextStyle(fontSize: 24),),
                      SizedBox(width: 30,),
                      SizedBox(
                        width: 180,
                        height: 60,
                        child: TextFormField(
                          style: TextStyle(fontSize: 16),
                          keyboardType: TextInputType.text,
                          maxLength: 50,
                          maxLines: 1,
                          controller: provadorcontroller,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "insira provador";
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
                      )
                    ],
                  ),
                 /* Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Insira Nº de amostras",style: TextStyle(fontSize: 24),),
                      SizedBox(width: 30,),
                      SizedBox(
                        width: 180,
                        height: 60,
                        child: TextFormField(
                          style: TextStyle(fontSize: 16),
                          keyboardType: TextInputType.text,
                          maxLength: 50,
                          maxLines: 1,
                          controller: numerocontroller,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "insira provador";
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
                      )
                    ],
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
                                    FichaAvaliacao(num_amostras.text,provadorcontroller.text,"amostra2","amostra3","amostra4")));
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
