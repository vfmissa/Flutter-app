// ignore_for_file: file_names
import 'dart:convert';
import 'package:food_test_app/Modelo%20de%20Classes/ModeloAromatico.dart';
import 'package:food_test_app/Modelo%20de%20Classes/ModeloAvaliativo.dart';
import 'package:food_test_app/Modelo%20de%20Classes/ModeloDiferenteIgual.dart';
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
        "CREATE TABLE avaliativo(id INTEGER PRIMARY KEY AUTOINCREMENT,data DATETIME,provador VARCHAR, amostra_controle VARCHAR,"+
            "amostra1 VARCHAR, nota1 VARCHAR,amostra2 VARCHAR, nota2 VARCHAR,amostra3 VARCHAR, nota3 VARCHAR,amostra4 VARCHAR, nota4 VARCHAR,amostra5 VARCHAR, nota5 VARCHAR,"+
            "amostra6 VARCHAR, nota6 VARCHAR,amostra7 VARCHAR, nota7 VARCHAR,amostra8 VARCHAR, nota8 VARCHAR,amostra9 VARCHAR, nota9 VARCHAR,amostra10 VARCHAR, nota10 VARCHAR)";

    String CreatDiscriminativo9amostras =
        "CREATE TABLE teste_discriminativo(id INTEGER PRIMARY KEY AUTOINCREMENT,data DATETIME,provador VARCHAR,num_amostra VARCHAR, num_amostra2 VARCHAR"+
        ",num_amostra3 VARCHAR,num_amostra4 VARCHAR,num_amostra5 VARCHAR,num_amostra6 VARCHAR"+
        ",num_amostra7 VARCHAR,num_amostra8 VARCHAR,num_amostra9 VARCHAR,caracteristica VARCHAR,comentario VARCHAR)";

        //"CREATE TABLE teste_discriminativo(id INTEGER PRIMARY KEY AUTOINCREMENT,data DATETIME,provador VARCHAR,amostra_controle VARCHAR,amostra_testada VARCHAR , amostra2 VARCHAR, amostra3 VARCHAR ,comentario VARCHAR)";
    String CreateComparativo =
        "CREATE TABLE comparativo(id INTEGER PRIMARY KEY AUTOINCREMENT,data DATETIME,provador VARCHAR,amostra_controle VARCHAR,amostra_testada CHAR, nota VARCHAR)";

    String CreateAroma =
        "CREATE TABLE aroma(id INTEGER PRIMARY KEY AUTOINCREMENT,data DATETIME,provador VARCHAR,num_amostra VARCHAR, aroma VARCHAR,num_amostra2 VARCHAR, aroma2 VARCHAR" +
            ",num_amostra3 VARCHAR, aroma3 VARCHAR,num_amostra4 VARCHAR, aroma4 VARCHAR,num_amostra5 VARCHAR, aroma5 VARCHAR,num_amostra6 VARCHAR, aroma6 VARCHAR" +
            ",num_amostra7 VARCHAR, aroma7 VARCHAR,num_amostra8 VARCHAR, aroma8 VARCHAR,num_amostra9 VARCHAR, aroma9 VARCHAR,num_amostra10 VARCHAR, aroma10 VARCHAR)";

    String CreateSliders =
        "CREATE TABLE sliders(id INTEGER PRIMARY KEY AUTOINCREMENT,data DATETIME,provador VARCHAR,amostra VARCHAR,valor_slider FLOAT,caracteristica VARCHAR,comentario VARCHAR)";
    String Creatdifigual =
        "CREATE TABLE diferent(id INTEGER PRIMARY KEY AUTOINCREMENT,data DATETIME,provador VARCHAR,amostra0 VARCHAR,amostra1 VARCHAR,amostra2 VARCHAR,amostradif INTEGER,coment VARCCHAR)";

    await db.execute(CreatAvaliativo);
    await db.execute(CreatDiscriminativo9amostras);
    await db.execute(CreateComparativo);
    await db.execute(CreateAroma);
    await db.execute(CreateSliders);
    await db.execute(Creatdifigual);
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

    List EntradasBD = await banco.query(
      "comparativo",
      columns: [
        "id",
        "data",
        "provador",
        "amostra_controle",
        "amostra_testada",
        "nota"
      ],
    );

    return EntradasBD;
  }

  Future<List<ModeloComparativo>> getTestesComparativos() async {
    var noteMapList =
        await recuperardobd_comparativo(); // Get 'Map List' from database
    int count =
        noteMapList.length; // Count the number of map entries in db table

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
      "data": teste.data,
      "provador": teste.provador,
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

    List EntradasBD = await banco.query("teste_discriminativo", columns: [
      "id",
      "data",
      "provador",
      "num_amostra",
      "num_amostra2",
      "num_amostra3",
      "num_amostra4",
      "num_amostra5",
      "num_amostra6",
      "num_amostra7",
      "num_amostra8",
      "num_amostra9",
      "caracteristica",
      "comentario"
    ]);

    return EntradasBD;
  }

  //função para recuperar do banco

  Future<List<ModeloDiscriminativo>> getModeloDecriminativo() async {
    var noteMapList =
        await recuperardobd_descriminativo(); // Get 'Map List' from database
    int count =
        noteMapList.length; // Count the number of map entries in db table

    List<ModeloDiscriminativo> ListaTeste = <ModeloDiscriminativo>[];
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      ListaTeste.add(ModeloDiscriminativo.fromMapObject(noteMapList[i]));
    }
    String json = jsonEncode(ListaTeste);
    print(json);
    return ListaTeste;
  }

  Future<String> getModeloDecriminativoJson() async {
    var noteMapList =
    await recuperardobd_descriminativo(); // Get 'Map List' from database
    int count =
        noteMapList.length; // Count the number of map entries in db table

    List<ModeloDiscriminativo> ListaTeste = <ModeloDiscriminativo>[];
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      ListaTeste.add(ModeloDiscriminativo.fromMapObject(noteMapList[i]));
    }
    String json = jsonEncode(ListaTeste)+"\n";
    return json;
  }



  Future<int> insertDiscrimnativo(ModeloDiscriminativo teste) async {
    Database db = await Helper_BD().inicializarDB();
    //inserção dando erro no id/autoincremente se tento passar o modelo de classe direto???
    //var result = await db.insert("teste_discriminativo", teste.toMap());

    //"CREATE TABLE teste_discriminativo(id INTEGER PRIMARY KEY AUTOINCREMENT,amostra_controle VARCHAR,amostra_testada VARCHAR , amostra2 INT, amostra3 INT ,comentario VARCHAR)";

    Map<String, dynamic> dadostabela = {
      "data": teste.data,
      "provador": teste.provador,
      "num_amostra": teste.Numamostra,
      "num_amostra2": teste.Numamostra2,
      "num_amostra3": teste.Numamostra3,
      "num_amostra4": teste.Numamostra4,
      "num_amostra5": teste.Numamostra5,
      "num_amostra6": teste.Numamostra6,
      "num_amostra7": teste.Numamostra7,
      "num_amostra8": teste.Numamostra8,
      "num_amostra9": teste.Numamostra9,
      "caracteristica": teste.caracteristica,
      "comentario": teste.comentario,
    };

    var id = await db.insert("teste_discriminativo", dadostabela);

    return id;
    //return result;
  }

//TESTES DESCRIMINATIVOS

//TESTES AVALIATIVOS

 /* "CREATE TABLE avaliativo(id INTEGER PRIMARY KEY AUTOINCREMENT,data DATETIME,provador VARCHAR, amostra_controle VARCHAR,"+
  "amostra1 VARCHAR, nota1 VARCHAR,amostra2 VARCHAR, nota2 VARCHAR,amostra3 VARCHAR, nota3 VARCHAR,amostra4 VARCHAR, nota4 VARCHAR,amostra5 VARCHAR, nota5 VARCHAR,"+
  "amostra6 VARCHAR, nota6 VARCHAR,amostra7 VARCHAR, nota7 VARCHAR,amostra8 VARCHAR, nota8 VARCHAR,amostra9 VARCHAR, nota9 VARCHAR,amostra10 VARCHAR, nota10 VARCHAR)";*/

  recuperardobd_Avaliativo() async {
    Database banco = await Helper_BD().inicializarDB();
    var table = "avaliativo";

    List EntradasBD = await banco.query(
      "avaliativo",
      columns: [
        "id",
        "data",
        "provador",
        "amostra_controle",
        "amostra1",
        "nota1",
        "amostra2",
        "nota2",
        "amostra3",
        "nota3",
        "amostra4",
        "nota4",
        "amostra5",
        "nota5",
        "amostra6",
        "nota6",
        "amostra7",
        "nota7",
        "amostra8",
        "nota8",
        "amostra9",
        "nota9",
        "amostra10",
        "nota10"
      ],
    );

    return EntradasBD;
  }

  Future<List<ModeloAvaliativo>> getTesteAvaliativo() async {
    var noteMapList =
        await recuperardobd_Avaliativo(); // Get 'Map List' from database
    int count = noteMapList.length;
    // Count the number of map entries in db table

    List<ModeloAvaliativo> ListaTeste = <ModeloAvaliativo>[];
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      ListaTeste.add(ModeloAvaliativo.fromMapObject(noteMapList[i]));
    }
    return ListaTeste;
  }

  Future<int> insertAvaliativo(ModeloAvaliativo teste) async {
    Database db = await Helper_BD().inicializarDB();

    // "CREATE TABLE avaliativo(id INTEGER PRIMARY KEY AUTOINCREMENT,data DATETIME,provador VARCHAR, amostra_controle VARCHAR,"
    // "amostra1 VARCHAR, nota1 VARCHAR,amostra2 VARCHAR, nota2 VARCHAR,amostra3 VARCHAR, nota3 VARCHAR,amostra4 VARCHAR, nota4 VARCHAR,)";

    Map<String, dynamic> dadostabela = {
      //"id":teste.id,
      "data": teste.data,
      "provador": teste.provador,
      "amostra_controle": teste.amostra_controle,
      "amostra1": teste.amostra_1,
      "nota1": teste.nota1,
      "amostra2": teste.amostra_2,
      "nota2": teste.nota2,
      "amostra3": teste.amostra_3,
      "nota3": teste.nota3,
      "amostra4": teste.amostra_4,
      "nota4": teste.nota4,
      "amostra5": teste.amostra_5,
      "nota5": teste.nota5,
      "amostra6": teste.amostra_6,
      "nota6": teste.nota6,
      "amostra7": teste.amostra_7,
      "nota7": teste.nota7,
      "amostra8": teste.amostra_8,
      "nota8": teste.nota8,
      "amostra9": teste.amostra_9,
      "nota9": teste.nota9,
      "amostra10": teste.amostra_10,
      "nota10": teste.nota10,
    };

    var id = await db.insert("avaliativo", dadostabela);

    return id;
    //return result;
  }

// TESTES AROMATICOS

  //=
  //   "CREATE TABLE aroma(id INTEGER PRIMARY KEY AUTOINCREMENT,data DATETIME,provador VARCHAR,
  //   num_amostra VARCHAR, aroma VARCHAR, aroma2 VARCHAR)"

  Future<int> insertAroma(ModeloAromatico teste) async {
    Database db = await Helper_BD().inicializarDB();

    Map<String, dynamic> dadostabela = {
      //"id":teste.id,
      "data": teste.data,
      "provador": teste.provador,
      "num_amostra": teste.Numamostra,
      "aroma": teste.aroma,
      "num_amostra2": teste.Numamostra2,
      "aroma2": teste.aroma2,
      "num_amostra3": teste.Numamostra3,
      "aroma3": teste.aroma3,
      "num_amostra4": teste.Numamostra4,
      "aroma4": teste.aroma4,
      "num_amostra5": teste.Numamostra5,
      "aroma5": teste.aroma5,
      "num_amostra6": teste.Numamostra6,
      "aroma6": teste.aroma6,
      "num_amostra7": teste.Numamostra7,
      "aroma7": teste.aroma7,
      "num_amostra8": teste.Numamostra8,
      "aroma8": teste.aroma8,
      "num_amostra9": teste.Numamostra9,
      "aroma9": teste.aroma9,
      "num_amostra10": teste.Numamostra10,
      "aroma10": teste.aroma10,
    };

    var id = await db.insert("aroma", dadostabela);

    return id;
    //return result;
  }

  recuperardobd_Aroma() async {
    Database banco = await Helper_BD().inicializarDB();
    //var table = "aroma";

    List EntradasBD = await banco.query("aroma", columns: [
      "id",
      "data",
      "provador",
      "num_amostra",
      "aroma",
      "num_amostra2",
      "aroma2",
      "num_amostra3",
      "aroma3",
      "num_amostra4",
      "aroma4",
      "num_amostra5",
      "aroma5",
      "num_amostra6",
      "aroma6",
      "num_amostra7",
      "aroma7",
      "num_amostra8",
      "aroma8",
      "num_amostra9",
      "aroma9",
      "num_amostra10",
      "aroma10"
    ]);

    return EntradasBD;
  }

  Future<List<ModeloAromatico>> getModeloAromatico() async {
    var noteMapList =
        await recuperardobd_Aroma(); // Get 'Map List' from database
    int count =
        noteMapList.length; // Count the number of map entries in db table

    List<ModeloAromatico> ListaTeste = <ModeloAromatico>[];
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      ListaTeste.add(ModeloAromatico.fromMapObject(noteMapList[i]));
    }
    return ListaTeste;
  }


  Future<String> getModeloAromaticoJson() async {
    var noteMapList =
    await recuperardobd_Aroma(); // Get 'Map List' from database
    int count =
        noteMapList.length; // Count the number of map entries in db table

    List<ModeloAromatico> ListaTeste = <ModeloAromatico>[];
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      ListaTeste.add(ModeloAromatico.fromMapObject(noteMapList[i]));
    }
    String json = jsonEncode(ListaTeste);
    return json;
  }




  // PARTE DO CODIGO SOBRE O TESTE COM SLIDERS
//sliders(id INTEGER PRIMARY KEY AUTOINCREMENT,data DATETIME,amostra VARCHAR,valor_slider FLOAT,caracteristica VARCHAR,comentario VARCHAR)";
  recuperardobd_Slider() async {
    Database banco = await Helper_BD().inicializarDB();

    List EntradasBD = await banco.query("sliders", columns: [
      "id",
      "data",
      "provador",
      "amostra",
      "valor_slider",
      "caracteristica",
      "comentario"
    ]);

    return EntradasBD;
  }

  Future<List<ModeloSlider>> getModeloSlider() async {
    var noteMapList =
        await recuperardobd_Slider(); // Get 'Map List' from database
    int count = noteMapList.length;
    // Count the number of map entries in db table

    List<ModeloSlider> ListaTeste = <ModeloSlider>[];

    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      ListaTeste.add(ModeloSlider.fromMapObject(noteMapList[i]));
    }
    return ListaTeste;
  }

  Future<int> insertSlider(ModeloSlider teste) async {
    Database db = await Helper_BD().inicializarDB();
    //"CREATE TABLE sliders(id INTEGER PRIMARY KEY AUTOINCREMENT,data DATETIME,amostra,valor_slider FLOAT,VARCHAR,caracteristica VARCHAR,comentario VARCHAR)"

    Map<String, dynamic> dadostabela = {
      //"id":teste.id,
      "data": teste.data,
      "provador": teste.provador,
      "amostra": teste.amostra,
      "valor_slider": teste.valor_slider,
      "caracteristica": teste.caracteristica,
      "comentario": teste.comentario,
    };

    var id = await db.insert("sliders", dadostabela);

    return id;
    //return result;
  }

  //diferent(id INTEGER PRIMARY KEY AUTOINCREMENT,data DATETIME,
  // julgador VARCHAR,amostra0 VARCHAR,amostra1 VARCHAR,amostra2 VARCHAR,amostradif VARCHAR)";
  //

  recuperardobd_dif_igual() async {
    Database banco = await Helper_BD().inicializarDB();

    List EntradasBD = await banco.query("diferent", columns: [
      "id",
      "data",
      "provador",
      "amostra0",
      "amostra1",
      "amostra2",
      "amostradif",
      "coment"
    ]);

    return EntradasBD;
  }

  Future<List<ModeloDiferenteIgual>> getModeloDif_igual() async {
    var noteMapList =
        await recuperardobd_dif_igual(); // Get 'Map List' from database
    int count = noteMapList.length;
    // Count the number of map entries in db table

    List<ModeloDiferenteIgual> ListaTeste = <ModeloDiferenteIgual>[];

    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      ListaTeste.add(ModeloDiferenteIgual.fromMapObject(noteMapList[i]));
    }
    return ListaTeste;
  }

  Future<int> insertDif_igual(ModeloDiferenteIgual teste) async {
    Database db = await Helper_BD().inicializarDB();

    Map<String, dynamic> dadostabela = {
      //diferent(id INTEGER PRIMARY KEY AUTOINCREMENT,data DATETIME,
      // julgador VARCHAR,amostra0 VARCHAR,amostra1 VARCHAR,amostra2 VARCHAR,amostradif VARCHAR,coment VARCHAR)";

      //"id":teste.id,
      "data": teste.data,
      "provador": teste.provador,
      "amostra0": teste.amostra0,
      "amostra1": teste.amostra1,
      "amostra2": teste.amostra2,
      "amostradif": teste.amostradif,
      "coment": teste.coment,
    };

    var id = await db.insert("diferent", dadostabela);

    return id;
    //return result;
  }

  Future<int> DeletarbyID(int id, String table) async {
    Database db = await Helper_BD().inicializarDB();
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
