// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'FichaOrdenacao.dart';

class AnaliseDiscriminativo extends StatefulWidget {
  String amostra;
  String julgador;
  String caracteristica;

  AnaliseDiscriminativo(this.amostra, this.julgador, this.caracteristica);

  @override
  _AnaliseDiscriminativoState createState() => _AnaliseDiscriminativoState();
}

class _AnaliseDiscriminativoState extends State<AnaliseDiscriminativo> {
  String amostra = "text";
  String julgador = "julgador";
  String caracteristica = "VAR_caracteristica";

  @override
  void initState() {
    amostra = widget.amostra;
    julgador = widget.julgador;
    caracteristica= widget.caracteristica;
    super.initState();
  }


  TextEditingController sample1Menos = TextEditingController();
  TextEditingController sample2Meio = TextEditingController();
  TextEditingController sample3Mais = TextEditingController();
  TextEditingController comentario = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  "Amostra: $amostra",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontStyle: FontStyle.italic),
                ),
                Text(
                  "Julgador: $julgador",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
              ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
              const SizedBox(
                height: 50,
                width: 0,
              ),
              Text(
                "Você está recebendo 3 amostras codificadas."
                " Por favor, ordene as amostras em ordem crescente em relação a ${widget.caracteristica}",
                style: const TextStyle(
                    letterSpacing: 2,
                    fontSize: 20,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 15),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: sample1Menos,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blue,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                          hintText: "Menos $caracteristica:",
                          hintStyle: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          //border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero))
                        ),
                      )),
                ),
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: sample2Meio,
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
                      padding: EdgeInsets.all(5),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: sample3Mais,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            hintText: "Mais $caracteristica:",
                            hintStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            )),
                      )),
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  /* Text(
                    "MENOS",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  ),*/
                  SizedBox(
                    width: 15,
                  ),
                  /* Text(
                    "MAIS",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  ),*/
                ],
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 12,
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
                      keyboardType: TextInputType.text,maxLines:3,
                      controller: comentario,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.blue,
                        contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                        hintText: "Comentarios:",
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    )),
              ),
              ElevatedButton(
                onPressed: () {
                  print(sample1Menos.text);
                  print(sample2Meio.text);
                  print(sample3Mais.text);
                  print(comentario.text);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FichaOrdenacao(amostra, julgador)));
                },
                child: const Text("Submeter",
                    style: TextStyle(color: Colors.black)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
