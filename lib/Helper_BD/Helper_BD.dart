// ignore_for_file: file_names
import 'dart:convert';
import 'package:food_test_app/Modelo%20de%20Classes/ModeloAromatico.dart';
import 'package:food_test_app/Modelo%20de%20Classes/ModeloAvaliativo.dart';
import 'package:food_test_app/Modelo%20de%20Classes/ModeloDiscriminativo.dart';
import 'package:food_test_app/Modelo%20de%20Classes/ModeloSlider.dart';
import '../Modelo de Classes/ModeloComparativo.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';


class Helper_BD extends StatefulWidget {
  @override
  _Helper_BDState createState() => _Helper_BDState();


  _onCreateDB(Database db, int version) async {
    String CreatAvaliativo =
        "CREATE TABLE avaliativo(id INTEGER PRIMARY KEY AUTOINCREMENT,amostra_controle VARCHAR,amostra_testada VARCHAR, nota VARCHAR)";
    String CreatDiscriminativo =
        "CREATE TABLE teste_discriminativo(id INTEGER PRIMARY KEY AUTOINCREMENT,amostra_controle VARCHAR,amostra_testada VARCHAR , amostra2 VARCHAR, amostra3 VARCHAR ,comentario VARCHAR)";
    String CreateComparativo =
        "CREATE TABLE comparativo(id INTEGER PRIMARY KEY AUTOINCREMENT,amostra_controle VARCHAR,amostra_testada CHAR, nota VARCHAR)";
    String CreateAroma=
        "CREATE TABLE aroma(id INTEGER PRIMARY KEY AUTOINCREMENT,num_amostra VARCHAR, aroma VARCHAR, aroma2 VARCHAR)";

    String CreateSliders="CREATE TABLE sliders(id INTEGER PRIMARY KEY AUTOINCREMENT,data DATETIME,amostra VARCHAR,valor_slider FLOAT,caracteristica VARCHAR,comentario VARCHAR)";

    await db.execute(CreatAvaliativo);
    await db.execute(CreatDiscriminativo);
    await db.execute(CreateComparativo);
    await db.execute(CreateAroma);
    await db.execute(CreateSliders);

    return db;

  }

  inicializarDB() async {
    final patchDB = await getDatabasesPath();
    final localpatchDB = join(patchDB, "Foodtest.db");

    var Bancoapp =
        await openDatabase(localpatchDB, version: 1, onCreate: _onCreateDB);

    return Bancoapp;
  }


//SEÇÃO TESTE COMPARATIVO
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

  InsertComparativo(ModeloComparativo teste) async {
    Database banco = await Helper_BD().inicializarDB();
    //Database bd = await _Bancoapp();

    Map<String, dynamic> dadostabela = {
      "amostra_controle": teste.amostra_controle,
      "amostra_testada": teste.amostra_testada,
      "nota": teste.nota,

    };
    int id = await banco.insert("comparativo", dadostabela);
    print("salvo: $id");
  }




//TESTE DESCRIMINATIVO

  //""CREATE TABLE teste_discriminativo(id INTEGER PRIMARY KEY AUTOINCREMENT,amostra_controle VARCHAR,amostra_testada VARCHAR , amostra2 VARCHAR, amostra3 VARCHAR ,comentario VARCHAR)";
  recuperardobd_descriminativo() async {
    Database banco = await Helper_BD().inicializarDB();
    var table = "comparativo";

    List EntradasBD = await banco.query("teste_discriminativo",
      columns: ["id", "amostra_controle", "amostra_testada","amostra2","amostra3","comentario"]);

    return EntradasBD;

  }

  //função para recuperar do banco

  Future<List<ModeloDiscriminativo>> getModeloDecriminativo() async {

    var noteMapList = await recuperardobd_descriminativo(); // Get 'Map List' from database
    int count = noteMapList.length;         // Count the number of map entries in db table

    List<ModeloDiscriminativo> ListaTeste = <ModeloDiscriminativo>[];
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      ListaTeste.add(ModeloDiscriminativo.fromMapObject(noteMapList[i]));
    }
    String json = jsonEncode(ListaTeste);
    print(json);
    return ListaTeste;

  }






Future<int> insertDiscrimnativo( ModeloDiscriminativo teste) async {
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
    int count = noteMapList.length;
    // Count the number of map entries in db table

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



// TESTES AROMATICOS

  Future<int> insertAroma( ModeloAromatico teste) async {
    Database db = await Helper_BD().inicializarDB();
    //"CREATE TABLE aroma(id INTEGER PRIMARY KEY AUTOINCREMENT,num_amostra CHAR, aroma CHAR, aroma2 CHAR)";

    Map<String, dynamic> dadostabela = {
      //"id":teste.id,
      "num_amostra": teste.Numamostra,
      "aroma": teste.aroma,
      "aroma2":teste.aroma2,

    };

    var id = await db.insert("aroma", dadostabela);

    return id;
    //return result;



  }

  recuperardobd_Aroma() async {
    Database banco = await Helper_BD().inicializarDB();
    //var table = "aroma";

    List EntradasBD = await banco.query("aroma",
      columns: ["id", "num_amostra","aroma","aroma2"]);

    return EntradasBD;

  }

  Future<List<ModeloAromatico>> getModeloAromatico() async {

    var noteMapList = await recuperardobd_Aroma(); // Get 'Map List' from database
    int count = noteMapList.length;         // Count the number of map entries in db table

    List<ModeloAromatico> ListaTeste = <ModeloAromatico>[];
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      ListaTeste.add(ModeloAromatico.fromMapObject(noteMapList[i]));
    }
    return ListaTeste;
  }


  // PARTE DO CODIGO SOBRE O TESTE COM SLIDERS
//sliders(id INTEGER PRIMARY KEY AUTOINCREMENT,data DATETIME,amostra VARCHAR,valor_slider FLOAT,caracteristica VARCHAR,comentario VARCHAR)";
  recuperardobd_Slider() async{

    Database banco = await Helper_BD().inicializarDB();


    List EntradasBD = await banco.query("sliders",
        columns: ["id","data","amostra","valor_slider","caracteristica","comentario"]);

    return EntradasBD;

  }

  Future<List<ModeloSlider>> getModeloSlider() async {

    var noteMapList = await recuperardobd_Slider(); // Get 'Map List' from database
    int count = noteMapList.length;
    // Count the number of map entries in db table

    List<ModeloSlider> ListaTeste = <ModeloSlider>[];

    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      ListaTeste.add(ModeloSlider.fromMapObject(noteMapList[i]));
    }
    return ListaTeste;
  }

  Future<int> insertSlider( ModeloSlider teste) async {
    Database db = await Helper_BD().inicializarDB();
    //"CREATE TABLE sliders(id INTEGER PRIMARY KEY AUTOINCREMENT,data DATETIME,amostra,valor_slider FLOAT,VARCHAR,caracteristica VARCHAR,comentario VARCHAR)"

    Map<String, dynamic> dadostabela = {
      //"id":teste.id,
      "data": teste.data,
      "amostra": teste.amostra,
      "valor_slider":teste.valor_slider,
      "caracteristica":teste.caracteristica,
      "comentario":teste.comentario,

    };

    var id = await db.insert("sliders", dadostabela);

    return id;
    //return result;



  }













  Future<int>DeletarbyID(int id,String table) async{
    Database db =await Helper_BD().inicializarDB();
    int result = await db.rawDelete("DELETE FROM $table WHERE id = $id");
    return result;
    
  }



}

class _Helper_BDState extends State<Helper_BD> {
  @override
  Widget build(BuildContext context) {
    return Helper_BD();
  }
}
