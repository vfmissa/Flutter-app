// ignore_for_file: file_names
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
        "CREATE TABLE teste(id INTEGER PRIMARY KEY AUTOINCREMENT, julgador VARCHAR, idade VARCHAR, sexo VARCHAR, caracteristica VARCHAR)";
    String sql2 =
        "CREATE TABLE teste_discriminativo(id INTEGER PRIMARY KEY AUTOINCREMENT,amostra_controle VARCHAR,amostra_testada VARCHAR , intensidade INT ,comentario VARCHAR)";
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
//Seção teste comparativo

//TESTE DESCRIMINATIVO
  //"TABLE teste_discriminativo(id INTEGER PRIMARY KEY AUTOINCREMENT,amostra_controle VARCHAR,amostra_testada VARCHAR ,INT intensidade ,comentario VARCHAR)";
  recuperardobd_descriminativo() async {
    Database banco = await Helper_BD().inicializarDB();
    var table = "comparativo";

    List EntradasBD = await banco.query("teste_discriminativo",
      columns: ["id", "amostra_controle", "amostra_testada","intensidade","comentario"],);

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




//TESTES DESCRIMINATIVOS

}

class _Helper_BDState extends State<Helper_BD> {
  @override
  Widget build(BuildContext context) {
    return Helper_BD();
  }
}
