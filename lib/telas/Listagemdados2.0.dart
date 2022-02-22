// ignore_for_file: file_names
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:food_test_app/Modelo%20de%20Classes/ModeloAromatico.dart';
import 'package:food_test_app/Modelo%20de%20Classes/ModeloAvaliativo.dart';
import 'package:food_test_app/Modelo%20de%20Classes/ModeloDiferenteIgual.dart';
import 'package:food_test_app/Modelo%20de%20Classes/ModeloDiscriminativo.dart';
import 'package:food_test_app/Modelo%20de%20Classes/ModeloSlider.dart';
import 'package:food_test_app/Telas_questinarios/TesteAromaticoSalvo.dart';
import 'package:food_test_app/Telas_questinarios/TesteComparativoSalvo.dart';
import 'package:food_test_app/Telas_questinarios/TestesAvaliativosSalvo.dart';
import 'package:food_test_app/Telas_questinarios/TestesDif_igualSalvo.dart';
import 'package:food_test_app/Telas_questinarios/TestesSlidersSalvo.dart';
import 'package:intl/intl.dart';
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
  List<ModeloDiscriminativo> listartestediscriminativo =
      <ModeloDiscriminativo>[];
  List<ModeloAvaliativo> listaravaliativo = <ModeloAvaliativo>[];
  List<ModeloAromatico> listaaromas = <ModeloAromatico>[];
  List<ModeloSlider> listaslider = <ModeloSlider>[];
  List<ModeloDiferenteIgual>listadif =<ModeloDiferenteIgual>[];

  int count = 0;
  int count2 = 0;
  int count3 = 0;
  int count4 = 0;
  int count5 = 0;
  int count6 = 0;

  @override
  Widget build(BuildContext context) {
    //print( "olá");

    return MaterialApp(
      home: DefaultTabController(
        length: 6,
        child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.assignment_outlined),
                    child: Text("Comparativo"),
                  ),
                  Tab(
                    icon: Icon(Icons.assignment),
                    child: Text("Discriminativo"),
                  ),
                  Tab(
                    icon: Icon(Icons.add_chart),
                    child: Text("Avaliativo"),
                  ),
                  Tab(
                    icon: Icon(Icons.line_weight),
                    child: Text("Aromatico"),
                  ),
                  Tab(
                    icon: Icon(Icons.height),
                    child: Text("Slider"),
                  ), Tab(
                    icon: Icon(Icons.height),
                    child: AutoSizeText("Diferente/Igual"),
                  )
                ],
              ),
              title: Text("Questionarios"),
            ),
            body: TabBarView(
              children: [
                Container(height: 100,child: GetListviewComparativo() ),
                Container(height: 100, child: GetListviewDiscriminativo()),
                Container(height: 100, child: GetListviewAvaliativo()),
                Container(height: 100, child: GetListviewAromatico()),
                Container(height: 100, child: GetListviewSlider()),
                Container(height: 100, child: GetListviewDif_igual()),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.refresh),
              onPressed: () {
                updateListView();
                updateListViewDiscriminativo();
                updateListView3();
                updateListView4();
                updateListView5();
                updateListView6();
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
              trailing: GestureDetector(
                  child: Icon(
                    Icons.delete,
                    color: Colors.blueGrey,
                  ),
                  onTap: () async {
                    await _showDialog(
                        context, listaentrevistas[position].id, "comparativo");
                    updateListView();
                  }),
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
              trailing: GestureDetector(
                  child: Icon(
                    Icons.delete,
                    color: Colors.blueGrey,
                  ),
                  onTap: () async {
                    await _showDialog(
                        context,
                        listartestediscriminativo[position].id,
                        "teste_discriminativo");
                    updateListViewDiscriminativo();
                  }),
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
              subtitle: Text("Provador: "+this.listaravaliativo[position].provador),
              trailing: GestureDetector(
                  child: Icon(
                    Icons.delete,
                    color: Colors.blueGrey,
                  ),
                  onTap: () async {
                    await _showDialog(
                        context, listaravaliativo[position].id, "avaliativo");
                    updateListView3();
                  }),
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

          var data = DateTime.fromMillisecondsSinceEpoch(this.listaaromas[position].data);
          DateTime dia = new DateTime(data.year, data.month, data.day);

          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.arrow_back),
              ),
              title: Text(
                "Teste de " + this.listaaromas[position].provador,
                style: titleStyle,
              ),
              subtitle: Text("Data:${dia.day}/${dia.month}/${dia.year}"),
              trailing: GestureDetector(
                  child: Icon(
                    Icons.delete,
                    color: Colors.blueGrey,
                  ),
                  onTap: () async {
                    await _showDialog(
                        context, listaaromas[position].id, "aroma");
                    updateListView4();
                  }),
              onTap: () {
                navigateToAroma(this.listaaromas[position]);
                debugPrint("cliquei");
              },
            ),
          );
        });
  }

  ListView GetListviewSlider() {


    TextStyle? titleStyle = Theme.of(context).textTheme.button;

    return ListView.builder(
        itemCount: count5,
        itemBuilder: (BuildContext context, int position) {

         var data = DateTime.fromMillisecondsSinceEpoch(this.listaslider[position].data);
         DateTime dia = new DateTime(data.year, data.month, data.day);

          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.arrow_back),
              ),
              title: Text(
                "Teste Amostra " + this.listaslider[position].amostra,
                style: titleStyle,
              ),
              subtitle: Text("Data:${dia.day}/${dia.month}/${dia.year}"),
              trailing: GestureDetector(
                  child: Icon(
                    Icons.delete,
                    color: Colors.blueGrey,
                  ),
                  onTap: () async {
                    await _showDialog(
                        context, listaslider[position].id, "sliders");
                    updateListView5();
                  }),
              onTap: () {
                navigateTodetails5(this.listaslider[position]);
                debugPrint("cliquei");
              },
            ),
          );
        });
  }



  ListView GetListviewDif_igual() {

    var format = new DateFormat("yMd");

    TextStyle? titleStyle = Theme.of(context).textTheme.button;

    return ListView.builder(
        itemCount: count6,
        itemBuilder: (BuildContext context, int position) {
          var data = DateTime.fromMillisecondsSinceEpoch(this.listadif[position].data);
          DateTime dia = new DateTime(data.year, data.month, data.day);
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.arrow_back),
              ),
              title: Text(
                "Teste" + this.listadif[position].id.toString(),
                style: titleStyle,
              ),
              subtitle: Text("Data:${dia.day}/${dia.month}/${dia.year}"),
              trailing: GestureDetector(
                  child: Icon(
                    Icons.delete,
                    color: Colors.blueGrey,
                  ),
                  onTap: () async {
                    await _showDialog(
                        context, listadif[position].id, "diferent");//nome da tabela sql
                    updateListView6();
                  }),
              onTap: () {
                navigateTodetails6(this.listadif[position]);
                debugPrint("cliquei");
              },
            ),
          );
        });
  }

  //Chama os cards para a tela

  void updateListView() {
    //debugPrint('Buscando dados bd');
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
    //debugPrint('Buscando dados bd2');
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
    //debugPrint('Buscando dados bd3');
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
    //debugPrint('Buscando dados aroma');
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

  void updateListView5() {
    //debugPrint('Buscando dados bd');
    var dbFuture = helper_bd.inicializarDB();
    dbFuture.then((database) {
      Future<List<ModeloSlider>> SliderListFuture = helper_bd.getModeloSlider();
      SliderListFuture.then((noteList) {
        setState(() {
          this.listaslider = noteList;
          this.count5 = noteList.length;
        });
      });
    });
  }

  void updateListView6() {
    //debugPrint('Buscando dados bd');
    var dbFuture = helper_bd.inicializarDB();
    dbFuture.then((database) {
      Future<List<ModeloDiferenteIgual>> dif_igualListFuture = helper_bd.getModeloDif_igual();
      dif_igualListFuture.then((noteList) {
        setState(() {
          this.listadif = noteList;
          this.count6 = noteList.length;
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
        return TestAvaliativoSalvo(teste);
      },
    ));
  }

  void navigateToAroma(ModeloAromatico teste) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return TesteAromaticoSalvo(teste);
      },
    ));
  }

  //listview 5 chamar detalhes do questionario com Sliders
  void navigateTodetails5(ModeloSlider teste) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return TesteSlidersSalvo(teste);
      },
    ));
  }

  //listview 5 chamar detalhes do questionario com Sliders
  void navigateTodetails6(ModeloDiferenteIgual teste) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return TestesDif_igualSalvo(teste);
      },
    ));
  }
}




_showDialog(BuildContext context, int id, String tabela) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text("CUIDADO!"),
        content: new Text("Deletar Questionario?"),
        actions: <Widget>[
          new TextButton(
            child: new Text("SIM"),
            onPressed: () async {
              await Helper_BD().DeletarbyID(id, tabela);
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
