// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_test_app/telas/Sliders/SliderAmostraProvador.dart';



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
                  "Teste de Percepção de atributo",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                height: 60,
                width: 700,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.blue)),
                child: AutoSizeText(
                  "Escolher os atributos a serem analizados \n",
                  maxLines: 15,
                  textAlign: TextAlign.center,
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
                        width: 240,
                        height: 120,
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
                            builder: (context) => SliderAmostraProvador(caracteristicacontroller1.text)));
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
