// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:food_test_app/telas/discriminativo/DiferenteEigual.dart';

import '../GridMain.dart';

class AmostrasDiferentigual extends StatefulWidget {
  @override
  _AmostrasDiferentigualState createState() => _AmostrasDiferentigualState();
}

class _AmostrasDiferentigualState extends State<AmostrasDiferentigual> {
  TextEditingController amostra0controller = TextEditingController();
  TextEditingController amostra1controller = TextEditingController();
  TextEditingController amostra2controller = TextEditingController();
  TextEditingController provadorcontroller = TextEditingController();

  var now = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Amostras"),
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
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
                width: 0,
              ),
              const Text(
                "Entre com as amostras para serem comparadas",
                style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 20,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 15),
              Form(
                key: _formKey,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: amostra0controller,
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
                              // ignore: prefer_const_constructors
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.blue,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            )),
                      ),
                      Expanded(
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: amostra1controller,
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
                              keyboardType: TextInputType.number,
                              controller: amostra2controller,
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
                                filled: true,
                                fillColor: Colors.blue,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            )),
                      ),
                    ]),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DiferenteEigual(
                                amostra0controller.text,
                                amostra1controller.text,
                                amostra2controller.text,
                                provadorcontroller.text)));
                  }
                },
                child: const Text("Submeter",
                    style: TextStyle(color: Colors.black)),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(child: Icon(
                    Icons.run_circle_outlined, size: 50,
                    color: Colors.black,),
                      backgroundColor: Colors.red,
                      onPressed: () {
                        _showDialogpassword(context);

                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


_showDialogpassword(BuildContext context) async {
  TextEditingController passwordcontroller = TextEditingController();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text("Pausar Testes Aromaticos?"),
        content: new Text("Para retirar o app do modo de teste insira a senha"),
        actions: <Widget>[
          TextFormField(autofocus: true,
            keyboardType: TextInputType.number,
            controller: passwordcontroller,
          ),
          TextButton(
            child: new Text("PAUSAR TESTES"),
            onPressed: () {
              if (passwordcontroller.text == "123") {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => GridMain()),
                      (Route<dynamic> route) => false,
                );
              }
            },
          ),
        ],
      );
    },
  );
}