// ignore_for_file: file_names
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_test_app/Helper_BD/Helper_BD.dart';
import 'package:share_plus/share_plus.dart';




var data = DateTime.now();

DateTime dia = new DateTime(data.year, data.month, data.day);

_salvarArquivo()async {

 String folder ="/storage/emulated/0/Download/";
  //final diretorio = await getApplicationDocumentsDirectory();
 //String path=diretorio.path;
  var arquivo = File("$folder/${dia.year}${dia.month}${dia.day}QuestionariosTeste.json");
  String Json=await Helper_BD().getModeloDecriminativoJson()+"\n"+await Helper_BD().getModeloAromaticoJson();
  String BD = await (Helper_BD().getModeloAromaticoJson());

  if(await arquivo.exists()){

    var tempID = dia.toIso8601String().substring(dia.toIso8601String().length - 5);
    arquivo.rename("$folder/${dia.year}${dia.month}${dia.day}QuestionariosTeste.json");

  }
    arquivo.writeAsString(Json);

  return arquivo.toString();
}

_share()async{
  String folder ="/storage/emulated/0/Download/";
  var arquivo = File("$folder/${dia.year}${dia.month}${dia.day}QuestionariosTeste.json");

  File file = await arquivo; // 1
  Share.shareFiles([file.path], text: 'Arquivo dos questionarios');



    }










class FileManager extends StatefulWidget {
  @override
  _FileManagerState createState() => _FileManagerState();
}

class _FileManagerState extends State<FileManager> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Opções"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Gerar Json dos dados Salvos"),
              ],
            ),
            ElevatedButton(
              onPressed: ()async {


                debugPrint(await _salvarArquivo());
              },
              child: Text("Gerar json"),
            ),
            ElevatedButton(
              onPressed: ()async {

                _share();
              },
              child: Text("Compartilhar"),
            )
          ],
        ),
      ),
    );
  }
}
