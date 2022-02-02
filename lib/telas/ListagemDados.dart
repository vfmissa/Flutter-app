// ignore_for_file: file_names
import 'package:sqflite/sqflite.dart';
import '../Helper_BD/Helper_BD.dart';
import 'package:flutter/material.dart';
import '../Modelo de Classes/ModeloComparativo.dart';

class Lista extends StatefulWidget {
  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {


  @override
  Widget build(BuildContext context) {
    return ListaComparativo();
  }
}


class ListaComparativo extends StatefulWidget {
  //classe para listar os dados

  @override
  _ListaComparativoState createState() => _ListaComparativoState();
}

class _ListaComparativoState extends State<ListaComparativo> {
  Helper_BD helper_bd = Helper_BD();

  List<ModeloComparativo> listaentrevistas = <ModeloComparativo>[];

  int count = 0;


  @override
  Widget build(BuildContext context) {
    if (listaentrevistas != null) {

    }


    //print( "olá");

    return Scaffold(
        appBar: AppBar(title: Text("Dados Salvos"),),
    body: GetListview(),
      floatingActionButton: FloatingActionButton(
      onPressed: () {
      debugPrint('float clicked');
      updateListView();
    },
    )
    );
  }


  ListView GetListview() {
    TextStyle? titleStyle = Theme
        .of(context)
        .textTheme
        .button;


    return ListView.builder(

        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue, child: Icon(Icons.arrow_back),
              ),
              title: Text(this.listaentrevistas[position].amostra_testada,
                style: titleStyle,),
              subtitle: Text(this.listaentrevistas[position].amostra_testada),
              trailing: Icon(Icons.delete, color: Colors.blueGrey,),
              onTap: () {
                debugPrint("cliquei");
              },


            ),
          );
        }
    );
  }

  void updateListView() {
    debugPrint('Buscando dados bd');
    var dbFuture = helper_bd.inicializarDB();
    dbFuture.then((database) {
      Future<List<ModeloComparativo>> noteListFuture = helper_bd.getTesteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.listaentrevistas = noteList;
          this.count = noteList.length;
        });
      });
    });
  }

/*_recuperarEntrevistas() async {

    List anotacoesRecuperadas = await helper_bd.getTesteList();

    List<ModeloComparativo>? listaTemporaria = <ModeloComparativo>[];
    for( var item in anotacoesRecuperadas ){

      ModeloComparativo anotacao = ModeloComparativo.fromMapObject( item );
      listaTemporaria.add( anotacao );

    }

    setState(() {
      listaentrevistas = listaTemporaria!;
    });
    listaTemporaria = null;

    print("Lista anotacoes: " + anotacoesRecuperadas.toString() );

  }*/

}

