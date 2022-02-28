// ignore_for_file: file_names, prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_test_app/Modelo%20de%20Classes/ModeloDiferenteIgual.dart';


class TestesDif_igualSalvo extends StatefulWidget {

  late final ModeloDiferenteIgual teste;

  TestesDif_igualSalvo(this.teste,);

  @override
  _TestesDif_igualSalvoState createState() => _TestesDif_igualSalvoState();
}

class _TestesDif_igualSalvoState extends State<TestesDif_igualSalvo> {
  late  ModeloDiferenteIgual teste;
  @override

  void initState() {
    teste = widget.teste;
    super.initState();
  }
  Widget build(BuildContext context) {

    String _valorpadrao =teste.amostradif.toString();

    var data = DateTime.fromMillisecondsSinceEpoch(teste.data);
    DateTime dia = DateTime(data.year, data.month, data.day);

    return Scaffold(
      appBar: AppBar(
        title: Text("FICHA DE ANÁLISE DISCRIMINATIVO"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.black54),
              color: Colors.white30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.all(25)),
              Row(//row de texto
                  children: [
                    Text(
                      "Provador:"+teste.provador,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      "Data:${dia.day}/${dia.month}/${dia.year}",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                  ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
              const SizedBox(
                height: 50,
                width: 0,
              ),
              const Text(
                "Prove as amostras da esquerda para a direita. Duas amostras são iguais e uma é diferente. Identifique com um círculo a amostra diferente.",
                style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 20,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 15),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: TextFormField(
                        readOnly: true,
                        keyboardType: TextInputType.text,
                        initialValue:teste.amostra0,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blue,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                          ), //border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero))
                        ),
                      )),
                ),
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: TextFormField(
                        readOnly: true,
                        keyboardType: TextInputType.text,
                        initialValue:teste.amostra1,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            )),
                      )),
                ),
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: TextFormField(
                        readOnly: true,
                        keyboardType: TextInputType.text,
                        initialValue:teste.amostra2,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blue,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      )),
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 0, 12),
                child: Container(
                  width: 800,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0, color: Colors.blue)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                          title: FittedBox(
                              child: AutoSizeText("Amostra: "+teste.amostra0, maxFontSize: 12)),
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
                          title: FittedBox(
                              child: AutoSizeText("Amostra: "+teste.amostra1, maxFontSize: 12)),
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
                          title: FittedBox(
                              child: AutoSizeText("Amostra: "+teste.amostra2,maxFontSize: 12)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                  color: Colors.white12,
                ),
                // ignore: prefer_const_constructors
                child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    // ignore: prefer_const_constructors
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      readOnly: true,
                      initialValue: teste.coment,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.blue,
                        contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
