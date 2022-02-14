// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:food_test_app/Helper_BD/Helper_BD.dart';
import 'package:food_test_app/Modelo%20de%20Classes/ModeloDiscriminativo.dart';
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


  Salvar(String controle, String menos,String meio, String mais,String comentario) async {
    //teste_discriminativo(id INTEGER PRIMARY KEY AUTOINCREMENT,amostra_controle VARCHAR,amostra_testada VARCHAR , amostra2 INT, amostra3 INT ,comentario VARCHAR)";
    ModeloDiscriminativo teste = ModeloDiscriminativo(controle,menos,meio, mais, comentario);
     var id= await Helper_BD().insertDiscrimnativo(teste);

    print("id="+id.toString());
  }

  @override
  void initState() {
    amostra = widget.amostra;
    julgador = widget.julgador;
    caracteristica = widget.caracteristica;
    super.initState();
  }

  TextEditingController sample1Menos = TextEditingController();
  TextEditingController sample2Meio = TextEditingController();
  TextEditingController sample3Mais = TextEditingController();
  TextEditingController comentario = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FICHA DE ANÁLISE DISCRIMINATIVO"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                          keyboardType: TextInputType.number,
                          controller: sample1Menos,
                          maxLength: 3,
                          validator: (value){
                              if (value == null || value.trim().isEmpty) {
                                return "Prencha os campos";
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
                          keyboardType: TextInputType.number,
                          controller: sample2Meio,
                          maxLength: 3,
                          validator: (value){
                            if (value == null || value.trim().isEmpty) {
                              return "Prencha os campos";
                            }
                            return null;
                          },
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
                          keyboardType: TextInputType.number,
                          controller: sample3Mais,
                          maxLength: 3,
                          validator: (value){
                            if (value == null || value.trim().isEmpty) {
                              return "Prencha os campos";
                            }
                            return null;
                          },
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
                        keyboardType: TextInputType.text,
                        maxLines: 3,
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
                  onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await Salvar(amostra,sample1Menos.text,sample2Meio.text,sample3Mais.text,comentario.text);
                    //await _recuperardobd();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FichaOrdenacao(amostra, julgador)));
                    }else{

                    _showDialog(context);

                    }
                  },
                  child: const Text("Submeter",
                      style: TextStyle(color: Colors.black)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_showDialog(BuildContext context,) async {
  showDialog(
    context: context,
    builder:  (BuildContext context) {
      return AlertDialog(
        title: new Text("Erro"),
        content: new Text("favor preencher o questionario"),
        actions: <Widget>[
          new TextButton(
            child: new Text("SIM"),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}