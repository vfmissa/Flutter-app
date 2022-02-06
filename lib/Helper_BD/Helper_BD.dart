// ignore_for_file: file_names
import 'package:food_test_app/Modelo%20de%20Classes/ModeloAvaliativo.dart';
import 'package:food_test_app/Modelo%20de%20Classes/TesteDiscriminativo.dart';

import '../Modelo de Classes/ModeloComparativo.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';


class Helper_BD extends StatefulWidget {
  @override
  _Helper_BDState createState() => _Helper_BDState();


  _onCreateDB(Database db, int version) async {
    String sql =
        "CREATE TABLE avaliativo(id INTEGER PRIMARY KEY AUTOINCREMENT,amostra_controle CHAR,amostra_testada CHAR, nota CHAR)";
    String sql2 =
        "CREATE TABLE teste_discriminativo(id INTEGER PRIMARY KEY AUTOINCREMENT,amostra_controle VARCHAR,amostra_testada VARCHAR , amostra2 INT, amostra3 INT ,comentario VARCHAR)";
    String sql3 =
        "CREATE TABLE comparativo(id INTEGER PRIMARY KEY AUTOINCREMENT,amostra_controle CHAR,amostra_testada CHAR, nota CHAR)";

    await db.execute(sql);
    await db.execute(sql2);
    await db.execute(sql3);


    return db;
  }

  inicializarDB() async {
    final patchDB = await getDatabasesPath();
    final localpatchDB = join(patchDB, "Foodtest.db");

    var Bancoapp =
        await openDatabase(localpatchDB, version: 1, onCreate: _onCreateDB);

    return Bancoapp;
  }

//Seção teste comparativo
  recuperardobd_comparativo() async {
    Database banco = await Helper_BD().inicializarDB();
    var table = "comparativo";

    List EntradasBD = await banco.query("comparativo",
      columns: ["id", "amostra_controle", "amostra_testada", "nota"],);

    return EntradasBD;

  }

  Future<List<ModeloComparativo>> getTestesComparativos() async {

    var noteMapList = await recuperardobd_comparativo(); // Get 'Map List' from database
    int count = noteMapList.length;         // Count the number of map entries in db table

    List<ModeloComparativo> ListaTeste = <ModeloComparativo>[];
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      ListaTeste.add(ModeloComparativo.fromMapObject(noteMapList[i]));
    }
    return ListaTeste;
  }

  SalvarComparativo(String controle, String testada, String nota ) async {
    Database banco = await Helper_BD().inicializarDB();
    //Database bd = await _Bancoapp();

    Map<String, dynamic> dadostabela = {
      "amostra_controle": controle,
      "amostra_testada": testada,
      "nota": nota,

    };

    int id = await banco.insert("comparativo", dadostabela);
    print("salvo: $id");
  }








//Seção teste comparativo

//TESTE DESCRIMINATIVO
  //""CREATE TABLE teste_discriminativo(id INTEGER PRIMARY KEY AUTOINCREMENT,amostra_controle VARCHAR,amostra_testada VARCHAR , amostra2 INT, amostra3 INT ,comentario VARCHAR)";
  recuperardobd_descriminativo() async {
    Database banco = await Helper_BD().inicializarDB();
    var table = "comparativo";

    List EntradasBD = await banco.query("teste_discriminativo",
      columns: ["id", "amostra_controle", "amostra_testada","amostra2","amostra3","comentario"],);

    return EntradasBD;

  }

  Future<List<TesteDiscriminativo>> getTestesDescriminativos() async {

    var noteMapList = await recuperardobd_descriminativo(); // Get 'Map List' from database
    int count = noteMapList.length;         // Count the number of map entries in db table

    List<TesteDiscriminativo> ListaTeste = <TesteDiscriminativo>[];
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      ListaTeste.add(TesteDiscriminativo.fromMapObject(noteMapList[i]));
    }
    return ListaTeste;
  }




Future<int> insertDiscrimnativo( TesteDiscriminativo teste) async {
    Database db = await Helper_BD().inicializarDB();
    //inserção dando erro no id/autoincremente se tento passar o modelo de classe direto???
    //var result = await db.insert("teste_discriminativo", teste.toMap());

    //"CREATE TABLE teste_discriminativo(id INTEGER PRIMARY KEY AUTOINCREMENT,amostra_controle VARCHAR,amostra_testada VARCHAR , amostra2 INT, amostra3 INT ,comentario VARCHAR)";

    Map<String, dynamic> dadostabela = {
      "amostra_controle":teste.amostra_controle,
      "amostra_testada": teste.menoscaracteristica,
      "amostra2": teste.mediacaracteristica,
      "amostra3":teste.maiscaracteristica,
      "comentario":teste.comentario,

    };

   var id = await db.insert("teste_discriminativo", dadostabela);

   return id;
    //return result;



  }






//TESTES DESCRIMINATIVOS


//TESTES AVALIATIVOS

  // "CREATE TABLE avaliativo(id INTEGER PRIMARY KEY AUTOINCREMENT,amostra_controle CHAR,amostra_testada CHAR, nota CHAR)";

  recuperardobd_Avaliativo() async {
    Database banco = await Helper_BD().inicializarDB();
    var table = "avaliativo";

    List EntradasBD = await banco.query("avaliativo",
      columns: ["id", "amostra_controle", "amostra_testada", "nota"],);

    return EntradasBD;

  }

  Future<List<ModeloAvaliativo>> getTesteAvaliativo() async {

    var noteMapList = await recuperardobd_Avaliativo(); // Get 'Map List' from database
    int count = noteMapList.length;         // Count the number of map entries in db table

    List<ModeloAvaliativo> ListaTeste = <ModeloAvaliativo>[];
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      ListaTeste.add(ModeloAvaliativo.fromMapObject(noteMapList[i]));
    }
    return ListaTeste;
  }

  SalvarAvaliativo(String controle, String testada, String nota ) async {
    Database banco = await Helper_BD().inicializarDB();
    //Database bd = await _Bancoapp();

    Map<String, dynamic> dadostabela = {
      "amostra_controle": controle,
      "amostra_testada": testada,
      "nota": nota,

    };

    int id = await banco.insert("avaliativo", dadostabela);
    print("salvo: $id");
  }




























}

class _Helper_BDState extends State<Helper_BD> {
  @override
  Widget build(BuildContext context) {
    return Helper_BD();
  }
}
