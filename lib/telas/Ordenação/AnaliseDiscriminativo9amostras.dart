// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:food_test_app/Helper_BD/Helper_BD.dart';
import 'package:food_test_app/Modelo%20de%20Classes/ModeloDiscriminativo.dart';
import 'package:food_test_app/telas/GridMain.dart';
import 'package:food_test_app/telas/Ordena%C3%A7%C3%A3o/ProvadorOrdenacao.dart';
import '../discriminativo/FichaOrdenacao.dart';

class AnaliseDiscriminativo9amostras extends StatefulWidget {
  int amostra;
  String provador;
  String caracteristica;

  AnaliseDiscriminativo9amostras(
      this.amostra, this.provador, this.caracteristica);

  @override
  _AnaliseDiscriminativo9amostrasState createState() =>
      _AnaliseDiscriminativo9amostrasState();
}

class _AnaliseDiscriminativo9amostrasState
    extends State<AnaliseDiscriminativo9amostras> {
  int totalamostras = 0;
  String provador = "julgador";
  String caracteristica = "VAR_caracteristica";

  Salvar(
      int data,
      String provador,
      String numaAmostra,
      String numaAmostra2,
      String numaAmostra3,
      String numaAmostra4,
      String numaAmostra5,
      String numaAmostra6,
      String numaAmostra7,
      String numaAmostra8,
      String numaAmostra9,
      String numaAmostra10,String comentario)async {


    ModeloDiscriminativo teste = ModeloDiscriminativo(data, provador, numaAmostra, numaAmostra2, numaAmostra3, numaAmostra4, numaAmostra5,
        numaAmostra6, numaAmostra7, numaAmostra8, numaAmostra9, numaAmostra10, comentario);

    var id = await Helper_BD().insertDiscrimnativo(teste);

    print("id=" + id.toString());
  }

  @override
  void initState() {
    totalamostras = widget.amostra;
    provador = widget.provador;
    caracteristica = widget.caracteristica;
    super.initState();
  }

  TextEditingController amostra1 = TextEditingController();
  TextEditingController amostra2 = TextEditingController();
  TextEditingController amostra3 = TextEditingController();
  TextEditingController amostra4 = TextEditingController();
  TextEditingController amostra5 = TextEditingController();
  TextEditingController amostra6 = TextEditingController();
  TextEditingController amostra7 = TextEditingController();
  TextEditingController amostra8 = TextEditingController();
  TextEditingController amostra9 = TextEditingController();
  TextEditingController comentario = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("FICHA DE ANÁLISE DISCRIMINATIVO"),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.black54),
                color: Colors.white30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.all(25)),
                  Row(//row de texto
                      children: [
                    Text(
                      "Julgador: $provador",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      "Data: ${now.day}/${now.month}/${now.year}",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                  ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
                  const SizedBox(
                    height: 50,
                    width: 0,
                  ),
                  Text(
                    "Você está recebendo $totalamostras amostras codificadas."
                    " Por favor, ordene as amostras em ordem crescente em relação a ${widget.caracteristica}",
                    style: const TextStyle(
                        letterSpacing: 2,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 15),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: amostra1,
                                maxLength: 3,
                                validator: (value) {
                                  if ((value == null || value.trim().isEmpty) &&
                                      totalamostras >= 1) {
                                    return "Prencha os campos";
                                  }
                                  return null;
                                },
                                // ignore: prefer_const_constructors
                                decoration: InputDecoration(
                                  labelText: "Amostra 1:",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
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
                                controller: amostra2,
                                maxLength: 3,
                                validator: (value) {
                                  if ((value == null || value.trim().isEmpty) &&
                                      totalamostras >= 2) {
                                    return "Prencha os campos";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    labelText: "Amostra 2:",
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
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
                                controller: amostra3,
                                maxLength: 3,
                                validator: (value) {
                                  if ((value == null || value.trim().isEmpty) &&
                                      totalamostras >= 3) {
                                    return "Prencha os campos";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    labelText: "Amostra 3:",
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
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
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: amostra4,
                                maxLength: 3,
                                validator: (value) {
                                  if ((value == null || value.trim().isEmpty) &&
                                      totalamostras >= 4) {
                                    return "Prencha os campos";
                                  }
                                  return null;
                                },
                                // ignore: prefer_const_constructors
                                decoration: InputDecoration(
                                  labelText: "Amostra 4:",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
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
                                controller: amostra5,
                                maxLength: 3,
                                validator: (value) {
                                  if ((value == null || value.trim().isEmpty) &&
                                      totalamostras >= 5) {
                                    return "Prencha os campos";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    labelText: "Amostra 5:",
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
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
                                controller: amostra6,
                                maxLength: 3,
                                validator: (value) {
                                  if ((value == null || value.trim().isEmpty) &&
                                      totalamostras >= 6) {
                                    return "Prencha os campos";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    labelText: "Amostra 6:",
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
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
                      children: [
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: amostra7,
                                maxLength: 3,
                                validator: (value) {
                                  if ((value == null || value.trim().isEmpty) &&
                                      totalamostras >= 7) {
                                    return "Prencha os campos";
                                  }
                                  return null;
                                },
                                // ignore: prefer_const_constructors
                                decoration: InputDecoration(
                                  labelText: "Amostra 7:",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
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
                                controller: amostra8,
                                maxLength: 3,
                                validator: (value) {
                                  if ((value == null || value.trim().isEmpty) &&
                                      totalamostras >= 8) {
                                    return "Prencha os campos";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    labelText: "Amostra 8:",
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
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
                                controller: amostra9,
                                maxLength: 3,
                                validator: (value) {
                                  if ((value == null || value.trim().isEmpty) &&
                                      totalamostras >= 9) {
                                    return "Prencha os campos";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    labelText: "Amostra 9:",
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
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
                        await Salvar(now.millisecondsSinceEpoch, provador, amostra1.text, amostra2.text, amostra3.text, amostra4.text, amostra5.text,
                            amostra6.text, amostra7.text, amostra8.text, amostra9.text, caracteristica, comentario.text);
                        //await _recuperardobd();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GridMain()));
                      } else {
                        _erroDialog(context);
                      }
                    },
                    child: const Text("Submeter",
                        style: TextStyle(color: Colors.black)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                          child: Icon(
                            Icons.run_circle_outlined,
                            size: 50,
                            color: Colors.black,
                          ),
                          backgroundColor: Colors.red,
                          onPressed: () {
                            _showDialog(
                                context, widget.amostra, widget.caracteristica);
                          }),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

_erroDialog(
  BuildContext context,
) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
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

_showDialog(BuildContext context, int Namostras, String caracteristica) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("PARA DESISTIR DO TESTE CLIQUE E SEGURE SAIR"),
        content: Text("Para continuar clique em CONTINUAR"),
        actions: <Widget>[
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("CONTINUAR")),
          ElevatedButton(
            child: Text("SAIR"),
            onLongPress: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProvadorOrdenacao(caracteristica, Namostras)),
                (Route<dynamic> route) => false,
              );
            },
            onPressed: () {},
          ),
          TextButton(
            child: Text("PAUSAR TESTES"),
            onPressed: () {
              _showDialogpassword(context);
            },
          ),
        ],
      );
    },
  );
}

_showDialogpassword(BuildContext context) async {
  TextEditingController passwordcontroller = TextEditingController();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text("Parar Testes Aromaticos?"),
        content: new Text("Para retirar o app do modo de teste insira a senha"),
        actions: <Widget>[
          TextFormField(
            keyboardType: TextInputType.number,
            controller: passwordcontroller,
          ),
          TextButton(
            child: new Text("PARAR TESTES"),
            onPressed: () {
              if (passwordcontroller.text == "123") {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => GridMain()),
                  (Route<dynamic> route) => false,
                );
              } else {
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      );
    },
  );
}
