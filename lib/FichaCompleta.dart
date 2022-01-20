// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:food_test_app/DrawerWidget.dart';

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
  TextEditingController procuracontroller = TextEditingController();

  String nome = "nameplaceholder";
  String idade = "idadeplaceholder";
  String sexo = "sexplaceholder";
  String caracteristica = "nameplaceholder";

  _Bancoapp() async {
    final patchDB = await getDatabasesPath();
    final localpatchDB = join(patchDB, "Foodtest.db");

    var Bancoapp = await openDatabase(
      localpatchDB,
      version: 1,
      /* onCreate: (db,dbversao){
          String sql ="CREATE TABLE teste(id INTEGER PRIMARY KEY AUTOINCREMENT, julgador VARCHAR, idade VARCHAR, sexo VARCHAR, caracteristica VARCHAR)";
          db.execute(sql);

        }*/
    );
    return Bancoapp;
    //print("aberto"+ Bancoapp.isOpen.toString());
  }

  _recuperardobd() async {
    Database bd = await _Bancoapp();

    // "SELECT * FROM teste WHERE id LIKE '%${text}%' ;
    var idnumber = procuracontroller.text;

    String sql = "SELECT * FROM teste WHERE id LIKE $idnumber";
    List testes = await bd.rawQuery(sql);

    for (var testes in testes) {
      print("teste id: " +
          testes['id'].toString() +
          " nome: " +
          testes['julgador'] +
          " idade: " +
          testes['idade'].toString() +
          " sexo: " +
          testes['sexo'].toString() +
          " caracteristica: " +
          testes['caracteristica']);

      nome = testes['julgador'];
      idade = testes['idade'].toString();
      sexo = testes['sexo'];
      caracteristica = testes['caracteristica'];
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawer(amostracontroller.text,julgadorcontroller.text),
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
                        controller: procuracontroller,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            hintText: "Procurar:"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                        width: double.maxFinite,
                        height: 50,
                        child: TextFormField(
                          controller: julgadorcontroller,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue,
                            labelText: "Julgador",
                            labelStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
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
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue,
                            labelText: "Idade",
                            labelStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            /*hintText: "idade:",
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 10),*/
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
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue,
                            labelText: "Sexo",
                            labelStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
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
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue,
                            labelText: "Amostra",
                            labelStyle: const TextStyle(color: Colors.black),
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
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue,
                            labelText: "Caracteristica",
                            labelStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
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
                  //_recuperardobd();
                },
                child: Text("Submeter", style: TextStyle(color: Colors.black)),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  await _recuperardobd();
                  julgadorcontroller.text = nome;
                  idadecontroller.text = idade;
                  sexocontroller.text = sexo;
                  caracteristicacontroller.text = caracteristica;
                },
                child: Text("recuperar", style: TextStyle(color: Colors.black)))
          ],
        )));
  }
}


