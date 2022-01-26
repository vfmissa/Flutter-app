// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Helper_BD extends StatefulWidget {
  @override
  _Helper_BDState createState() => _Helper_BDState();

  _onCreateDB(Database db, int version) async {
    String sql = "CREATE TABLE teste(id INTEGER PRIMARY KEY AUTOINCREMENT, julgador VARCHAR, idade VARCHAR, sexo VARCHAR, caracteristica VARCHAR)";
    String sql2 = "CREATE TABLE discriminatorio(discri_id INTEGER PRIMARY KEY AUTOINCREMENT,menos CHAR,medio CHAR,mais CHAR,coment VARCHAR)";
    String sql3 = "CREATE TABLE comparativo(id INTEGER PRIMARY KEY AUTOINCREMENT,amostra_controle CHAR,amostra_testada CHAR, nota CHAR)";

    await db.execute(sql);
    await db.execute(sql2);
    await db.execute(sql3);

    return db;
  }

  inicializarDB() async {
  final patchDB = await getDatabasesPath();
  final localpatchDB = join(patchDB, "Foodtest.db");

  var Bancoapp = await openDatabase(
  localpatchDB,
  version: 1,
  onCreate: _onCreateDB);

  return Bancoapp;
}
}

class _Helper_BDState extends State<Helper_BD> {
  @override
  Widget build(BuildContext context) {
    return Helper_BD();
  }
}



