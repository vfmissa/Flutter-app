// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_test_app/telas/Avaliativo/FichaAvaliacao.dart';

class AmostrasAvaliativo extends StatefulWidget {
  late int num_amostra;
  late String controle;

  AmostrasAvaliativo(this.controle, this.num_amostra);
  @override
  _AmostrasAvaliativoState createState() => _AmostrasAvaliativoState();
}

class _AmostrasAvaliativoState extends State<AmostrasAvaliativo> {
  final _valueamostra = GlobalKey<FormState>();

  //TextEditingController num_amostras = TextEditingController();
  TextEditingController provadorcontroller = TextEditingController();
  //TextEditingController amostracontrole = TextEditingController();
  String julgador = "SemNOme";

  @override
  Widget build(BuildContext context) {
    int num_amostra = widget.num_amostra;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Teste Avaliativo"),
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
                    Container(
                      height: 90,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.blue)),
                      child: AutoSizeText(
                        "Você está recebendo uma amostra controle C e $num_amostra amostras codificadas.)\n"
                        "Compare cada uma com o Controle quanto ao atributo (Especificar)\n"
                        "Expresse o valor da diferença utilizando a escala abaixo",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_valueamostra.currentState!.validate()) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FichaAvaliacao(
                                      widget.num_amostra,
                                      provadorcontroller.text,
                                      widget.controle)));
                        }
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
