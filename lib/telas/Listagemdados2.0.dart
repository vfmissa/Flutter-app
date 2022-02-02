// ignore_for_file: file_names
import 'package:food_test_app/Modelo%20de%20Classes/TesteDiscriminativo.dart';

import '../Helper_BD/Helper_BD.dart';
import 'package:flutter/material.dart';
import '../Modelo de Classes/ModeloComparativo.dart';

class Lista2 extends StatefulWidget {
  @override
  _Lista2State createState() => _Lista2State();
}

class _Lista2State extends State<Lista2> {
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
  List<TesteDiscriminativo> listartestediscriminativo = <TesteDiscriminativo>[];

  int count = 0;
  int count2=0;

  @override
  Widget build(BuildContext context) {
    //print( "olá");

    return Scaffold(
        appBar: AppBar(
          title: Text("Dados Salvos"),
        ),
        body: Column(
          children: [
            Container(height: 200,child: GetListview()),
            Container(height: 200,child: GetListview2()),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint('float clicked');
            updateListView();
            updateListView2();
          },
        ));
  }

  ListView GetListview() {
    TextStyle? titleStyle = Theme.of(context).textTheme.button;

    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.arrow_back),
                ),
                title: Text(
                  "Teste Amostra " +
                      this.listaentrevistas[position].amostra_testada,
                  style: titleStyle,
                ),
                subtitle: Text(this.listaentrevistas[position].amostra_testada),
                trailing: Icon(
                  Icons.delete,
                  color: Colors.blueGrey,
                ),
                onTap: () {
                  debugPrint("cliquei");
                },
            ),
          );
        });
  }

  ListView GetListview2() {
    TextStyle? titleStyle = Theme.of(context).textTheme.button;

    return ListView.builder(
        itemCount: count2,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.arrow_back),
              ),
              title: Text(
                "Teste Discriminativo " +
                    this.listartestediscriminativo[position].amostra_testada,
                style: titleStyle,
              ),
              subtitle: Text(this.listaentrevistas[position].amostra_testada),
              trailing: Icon(
                Icons.delete,
                color: Colors.blueGrey,
              ),
              onTap: () {
                debugPrint("cliquei");
              },
            ),
          );
        });
  }

  void updateListView() {
    debugPrint('Buscando dados bd');
    var dbFuture = helper_bd.inicializarDB();
    dbFuture.then((database) {
      Future<List<ModeloComparativo>> comparativoListFuture =
      helper_bd.getTestesComparativos();
      comparativoListFuture.then((noteList) {
        setState(() {
          this.listaentrevistas = noteList;
          this.count = noteList.length;
        });
      });
    });
  }

  void updateListView2() {
    debugPrint('Buscando dados bd');
    var dbFuture = helper_bd.inicializarDB();
    dbFuture.then((database) {
      Future<List<TesteDiscriminativo>> discriminativoListFuture =
      helper_bd.getTestesDescriminativos();
      discriminativoListFuture.then((noteList) {
        setState(() {
          this.listartestediscriminativo = noteList;
          this.count2 = noteList.length;
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
