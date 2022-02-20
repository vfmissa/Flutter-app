// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'QuestinarioSliders.dart';


class SelecaoAtributos extends StatefulWidget {


  @override
  _SelecaoAtributosState createState() => _SelecaoAtributosState();
}

class _SelecaoAtributosState extends State<SelecaoAtributos> {
  TextEditingController amostracontroller1 = TextEditingController();
  TextEditingController caracteristicacontroller1 = TextEditingController();
  TextEditingController provadorcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Atributos para Avaliação"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Insira o nome do Provador",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  width: 30,
                ),
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
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                height: 60,
                width: 700,
                decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.blue)),
                child: AutoSizeText(
                  "Escolher os atributos a serem analizados \n",
                  maxLines: 15,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: 120,
                        height: 50,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: caracteristicacontroller1,
                          maxLength: 20,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Prencha os campos";
                            }
                            return null;
                          },
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                            helperText: "Atributo",
                            helperStyle:
                                TextStyle(color: Colors.black, fontSize: 10),
                            filled: true,
                            fillColor: Colors.blue,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        )),
                    SizedBox(
                        width: 120,
                        height: 50,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          textCapitalization: TextCapitalization.sentences,
                          controller: amostracontroller1,
                          maxLength: 3,
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty ||
                                int.parse(value) <= 100 ||
                                int.parse(value) >= 1000) {
                              return "Prencha os campos";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            helperText: "Amostra",
                            helperStyle:
                                TextStyle(color: Colors.black, fontSize: 10),
                            filled: true,
                            fillColor: Colors.blue,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuestinarioSliders(
                                provadorcontroller.text,
                                amostracontroller1.text,
                                caracteristicacontroller1.text)));
                  } //if
                },
                child: Text("Iniciar Questionario",
                    style: TextStyle(color: Colors.black)))
          ],
        ),
      ),
    );
  }
}
