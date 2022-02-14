// ignore_for_file: file_names
import 'package:flutter/widgets.dart';
import 'package:food_test_app/Modelo%20de%20Classes/ModeloAromatico.dart';
import 'package:food_test_app/Modelo%20de%20Classes/ModeloAvaliativo.dart';
import 'package:food_test_app/Modelo%20de%20Classes/ModeloDiscriminativo.dart';
import 'package:food_test_app/Telas_questinarios/TesteComparativoSalvo.dart';
import 'package:food_test_app/Telas_questinarios/TestesAvaliativosSalvo.dart';
import '../Telas_questinarios/TesteDescriminativoSalvo.dart';
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
  List<ModeloDiscriminativo> listartestediscriminativo = <ModeloDiscriminativo>[];
  List<ModeloAvaliativo> listaravaliativo = <ModeloAvaliativo>[];
  List<ModeloAromatico>listaaromas =<ModeloAromatico>[];
  int count = 0;
  int count2 = 0;
  int count3 = 0;
  int count4 =0;

  @override
  Widget build(BuildContext context) {
    //print( "olá");

    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.assignment_outlined),
                  ),
                  Tab(
                    icon: Icon(Icons.assignment),
                  ),
                  Tab(
                    icon: Icon(Icons.add_chart),
                  ),
                  Tab(
                    icon: Icon(Icons.line_weight),
                  )
                ],
              ),
              title: Text("Dados Salvos"),
            ),
            body: TabBarView(
              children: [
                Container(height: 100, child: GetListviewComparativo()),
                Container(height: 100, child: GetListviewDiscriminativo()),
                Container(height: 100, child: GetListviewAvaliativo()),
                Container(height: 100, child: GetListviewAromatico()),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.refresh),
              onPressed: () {
                updateListView();
                updateListViewDiscriminativo();
                updateListView3();
                updateListView4();
              },
            )),
      ),
    );
  }

  ListView GetListviewComparativo() {
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
                    this.listaentrevistas[position].amostra_controle,
                style: titleStyle,
              ),
              subtitle: Text(this.listaentrevistas[position].amostra_testada),
              trailing:GestureDetector(
                  child:  Icon(
                    Icons.delete,
                    color: Colors.blueGrey,),
                  onTap:() async {
                    await _showDialog(context,listaentrevistas[position].id,"comparativo");
                    updateListView();
                  }
              ),
              onTap: () {
                navigateTodetails(this.listaentrevistas[position]);
                debugPrint("cliquei");
              },
            ),
          );
        });
  }

  ListView GetListviewDiscriminativo() {
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
                    this.listartestediscriminativo[position].amostra_controle,
                style: titleStyle,
              ),
              subtitle: Text(
                  this.listartestediscriminativo[position].menoscaracteristica),
              trailing:GestureDetector(
                  child:  Icon(
                    Icons.delete,
                    color: Colors.blueGrey,),
                  onTap:() async {
                    await _showDialog(context,listartestediscriminativo[position].id,"teste_discriminativo");
                    updateListViewDiscriminativo();
                  }
              ),
              onTap: () {
                navigateTodetails2(this.listartestediscriminativo[position]);
                debugPrint("cliquei");
              },
            ),
          );
        });
  }

  ListView GetListviewAvaliativo() {
    TextStyle? titleStyle = Theme.of(context).textTheme.button;

    return ListView.builder(
        itemCount: count3,
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
                    this.listaravaliativo[position].amostra_controle,
                style: titleStyle,
              ),
              subtitle: Text(this.listaravaliativo[position].amostra_testada),
              trailing:GestureDetector(
                  child:  Icon(
                    Icons.delete,
                    color: Colors.blueGrey,),
                  onTap:() async {
                   // await _showDialog(context,listaravaliativo[position].id,"semtabelaainda");
                    updateListView3();
                  }
              ),
              onTap: () {
                navigateTodetails3(this.listaravaliativo[position]);
                debugPrint("cliquei");
              },
            ),
          );
        });
  }

  ListView GetListviewAromatico() {
    TextStyle? titleStyle = Theme.of(context).textTheme.button;

    return ListView.builder(
        itemCount: count4,
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
                    this.listaaromas[position].Numamostra,
                style: titleStyle,
              ),
              subtitle: Text(
                  this.listaaromas[position].id.toString()),
              trailing:GestureDetector(
                child:  Icon(
                Icons.delete,
                color: Colors.blueGrey,),
                    onTap:() async {
                    await _showDialog(context,listaaromas[position].id,"aroma");
                    updateListView4();
                    }
              ),
              onTap: () {
                navigateTodetails3(this.listaravaliativo[position]);
                debugPrint("cliquei");
              },
            ),
          );
        });
  }




  //Chama os cards para a tela

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

  void updateListViewDiscriminativo() {
    debugPrint('Buscando dados bd2');
    var dbFuture = helper_bd.inicializarDB();
    dbFuture.then((database) {
      Future<List<ModeloDiscriminativo>> discriminativoListFuture =
          helper_bd.getModeloDecriminativo();
      discriminativoListFuture.then((noteList) {
        setState(() {
          this.listartestediscriminativo = noteList;
          this.count2 = noteList.length;
        });
      });
    });
  }
  void updateListView3() {
    debugPrint('Buscando dados bd3');
    var dbFuture = helper_bd.inicializarDB();
    dbFuture.then((database) {
      Future<List<ModeloAvaliativo>> avaliativoListFuture =
      helper_bd.getTesteAvaliativo();
      avaliativoListFuture.then((noteList) {
        setState(() {
          this.listaravaliativo = noteList;
          this.count3 = noteList.length;
        });
      });
    });
  }

  void updateListView4() {
    debugPrint('Buscando dados aroma');
    var dbFuture = helper_bd.inicializarDB();
    dbFuture.then((database) {
      Future<List<ModeloAromatico>> AromaListFuture =
      helper_bd.getModeloAromatico();
      AromaListFuture.then((noteList) {
        setState(() {
          this.listaaromas = noteList;
          this.count4 = noteList.length;
        });
      });
    });
  }

  //listview 1 chamar detalhes do questionario
  void navigateTodetails(ModeloComparativo teste) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return TesteComparativoSalvo(teste);
      },
    ));
  }

  //listview 2 chamar detalhes do questionario
  void navigateTodetails2(ModeloDiscriminativo teste) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return TestDescriminativoSalvo(teste);
      },
    ));
  }

  //listview 3 chamar detalhes do questionario
  void navigateTodetails3(ModeloAvaliativo teste) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return  TestAvaliativoSalvo(teste);
      },
    ));
  }
}


_showDialog(BuildContext context,int id,String tabela) async {
  showDialog(
    context: context,
    builder:  (BuildContext context) {
      return AlertDialog(
        title: new Text("CUIDADO!"),
        content: new Text("Deletar Questionario?"),
        actions: <Widget>[
          new TextButton(
            child: new Text("SIM"),
            onPressed: () async {
            await Helper_BD().DeletarbyID(id,tabela);
              Navigator.pop(context);
            },
          ),
          new TextButton(
            child: new Text("NÃO"),
            onPressed: () {
            Navigator.of(context).pop();

            },
          ),
        ],
      );
    },
  );
}