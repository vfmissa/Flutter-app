// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MaterialApp(
    home: FichaCompleta(),
    debugShowCheckedModeBanner: true,
  ));
}

class FichaCompleta extends StatefulWidget {
  @override
  _FichaCompletaState createState() => _FichaCompletaState();
}

class _FichaCompletaState extends State<FichaCompleta> {
  TextEditingController amostracontroller = TextEditingController();
  TextEditingController julgadorcontroller = TextEditingController();
  TextEditingController idadecontroller = TextEditingController();
  TextEditingController sexocontroller = TextEditingController();
  TextEditingController caracteristicacontroller = TextEditingController();

   _Bancoapp() async {
    final patchDB = await getDatabasesPath();
    final localpatchDB = join(patchDB,"Foodtest.db");

    var Bancoapp= await openDatabase(
        localpatchDB,
        version: 1,
        onCreate: (db,dbversao){
          String sql ="CREATE TABLE teste(id INTEGER PRIMARY KEY AUTOINCREMENT, julgador VARCHAR, idade VARCHAR, sexo VARCHAR, caracteristica VARCHAR)";
          db.execute(sql);

        }
    );
    return Bancoapp;
    //print("aberto"+ Bancoapp.isOpen.toString());
  }

  _recuperardobd() async {
     Database bd = await _Bancoapp();
     String sql = "SELECT * FROM teste";
     List testes = await bd.rawQuery(sql);


     for( var testes in testes ){
       print(
           "teste id: " + testes['id'].toString() +
               " nome: " + testes['julgador'] +
               " idade: " + testes['idade'].toString()+
                " sexo: " +testes['sexo'].toString()+
                " caracteristica: "+testes['caracteristica']);
     }

  }



  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

     return Scaffold(
        appBar: AppBar(
          title: Text("Relatorio"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.black54)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                        width: double.maxFinite,
                        height: 50,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          controller: julgadorcontroller,
                          validator: (value) {
                            if (value == null || value.trim().length == 0) {
                              return "Prencher Nome Julgador";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            hintText: "Julgador:",
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 10),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                        width: double.maxFinite,
                        height: 50,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          controller: idadecontroller,
                          validator: (value) {
                            if (value == null || value.trim().length == 0) {
                              return "Prencher Idade";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            hintText: "idade:",
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 10),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                        width: double.maxFinite,
                        height: 50,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          controller: sexocontroller,
                          validator: (value) {
                            if (value == null || value.trim().length == 0) {
                              return "Prencher Sexo";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            hintText: "Sexo:",
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 10),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                        width: double.maxFinite,
                        height: 50,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          controller: amostracontroller,
                          validator: (value) {
                            if (value == null || value.trim().length == 0) {
                              return "Prencher Amostra";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            hintText: "Amostra/Produto:",
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 10),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                        width: double.maxFinite,
                        height: 50,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          controller: caracteristicacontroller,
                          validator: (value) {
                            if (value == null || value.trim().length == 0) {
                              return "Prencher Caracteristica";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            hintText: "Caracteristica:",
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 10),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(6),
              child: ElevatedButton(
                onPressed: () {
                  _recuperardobd();
                },
                child: Text("Submeter", style: TextStyle(color: Colors.black)),
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text("recuperar", style: TextStyle(color: Colors.black)))
          ],
        )));
  }
}
