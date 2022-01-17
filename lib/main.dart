import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/widgets.dart';
import 'package:food_test_app/AnaliseDiscriminativo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:food_test_app/FichaCompleta.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: true,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController amostracontroller = TextEditingController();
  TextEditingController julgadorcontroller = TextEditingController();
  TextEditingController idadecontroller = TextEditingController();
  TextEditingController sexocontroller = TextEditingController();
  TextEditingController caracteristicacontroller = TextEditingController();

  _Bancoapp() async {
    final patchDB = await getDatabasesPath();
    final localpatchDB = join(patchDB, "Foodtest.db");

    var Bancoapp = await openDatabase(
        localpatchDB,
        version: 1,
        onCreate: (db, dbversao) {
          String sql = "CREATE TABLE teste(id INTEGER PRIMARY KEY AUTOINCREMENT, julgador VARCHAR, idade VARCHAR, sexo VARCHAR, caracteristica VARCHAR)";
          String sql2 ="CREATE TABLE discriminatorio(discri_id INTEGER PRIMARY KEY AUTOINCREMENT,menos CHAR,medio CHAR,mais CHAR,coment VARCHAR)";
          db.execute(sql);
          db.execute(sql2);
        }
    );
    return Bancoapp;
    //print("aberto"+ Bancoapp.isOpen.toString());
  }

  _recuperar() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      amostracontroller =
      prefs.getString("amostracontroller") as TextEditingController;
    });
  }

  _Salvar() async {
    Database bd =  await _Bancoapp();
    Map<String, dynamic>dadostabela = {
      "julgador": julgadorcontroller.text,
      "idade": idadecontroller.text,
      "sexo": sexocontroller.text,
      "caracteristica": caracteristicacontroller.text
    };
    /*Map<String, dynamic>dadostabela ={
      "julgador": "julgador1",
      "idade": "idade1",
      "sexo": "sexo1",
      "caracteristica": "caracteristica1"};*/

    int id = await bd.insert("teste", dadostabela);
    print("salvo: $id");
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {




    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
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
                            if (value == null || value
                                .trim()
                                .length == 0) {
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
                            if (value == null || value
                                .trim()
                                .length == 0) {
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
                            if (value == null || value
                                .trim()
                                .length == 0) {
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
                            if (value == null || value
                                .trim()
                                .length == 0) {
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
                            if (value == null || value
                                .trim()
                                .length == 0) {
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
                      if (_formKey.currentState!.validate()) {
                        _Salvar();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AnaliseDiscriminativo(
                                      amostracontroller.text,
                                      julgadorcontroller.text,
                                      caracteristicacontroller.text,
                                    )));
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Registrado')),
                        );
                      }else{print("PREENCHE O QUESTINARIO");}
                    },
                    child: Text(
                        "Submeter", style: TextStyle(color: Colors.black)),
                  ),
                ),
                ElevatedButton(onPressed: () {
                  Navigator.push(
                      context,MaterialPageRoute(builder: (context) =>FichaCompleta()));

                },
                    child: Text(
                        "recuperar", style: TextStyle(color: Colors.black)))
              ],
            )));
  }
}

/*mainAxisAlignment: MainAxisAlignment.center, children: [
Flexible(
fit: FlexFit.loose,
child: TextFormField(
keyboardType: TextInputType.text,
controller: amostracontroller,
// ignore: prefer_const_constructors
decoration: InputDecoration(
filled: true,
fillColor: Colors.blue,
hintText: "Amostra do produto:",
hintStyle:
const TextStyle(color: Colors.black, fontSize: 10),
//border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero))
),
),
),*/
