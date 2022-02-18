// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:food_test_app/telas/discriminativo/DiferenteEigual.dart';

class AmostrasDiferentigual extends StatefulWidget {
  @override
  _AmostrasDiferentigualState createState() => _AmostrasDiferentigualState();
}

class _AmostrasDiferentigualState extends State<AmostrasDiferentigual> {
  TextEditingController amostra0controller = TextEditingController();
  TextEditingController amostra1controller = TextEditingController();
  TextEditingController amostra2controller = TextEditingController();
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
              Row(//row de texto
                  children: [
                Text(
                  "Provador: ",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontStyle: FontStyle.italic),
                ),
                Text(
                  "DATA:${now.day}/${now.month}/${now.year}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
              ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
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
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: amostra0controller,
                          maxLength: 3,
                          validator: (value){
                            if (value == null || value.trim().isEmpty|| int.parse(value) <= 100|| int.parse(value) >= 1000) {
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
                            ), //border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero))
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
                          validator: (value){
                            if (value == null || value.trim().isEmpty|| int.parse(value) <= 100|| int.parse(value) >= 1000) {
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
                          validator: (value){
                            if (value == null || value.trim().isEmpty|| int.parse(value) <= 100|| int.parse(value) >= 1000) {
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DiferenteEigual(
                              amostra0controller.text,
                              amostra1controller.text,
                              amostra2controller.text)));}
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
