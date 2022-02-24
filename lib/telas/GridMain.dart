// ignore_for_file: file_names
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_test_app/Helper_BD/FileManager.dart';
import 'DrawerWidget.dart';
import 'GridQuestionarios.dart';
import 'Listagemdados2.0.dart';


class GridMain extends StatefulWidget {
  @override
  _GridMainState createState() => _GridMainState();
}
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
  ]);
  runApp(MaterialApp(
    home: GridMain(),
    debugShowCheckedModeBanner: true,
  ));

}
class _GridMainState extends State<GridMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white60,
        drawer: drawer("temp1drawer", "temp2drawer"),
        appBar: AppBar(
          title: const Text("Nome do APP"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 5,
            children: [
              GestureDetector(
                child: Container(
                    height: 25,
                    color: Colors.blue,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              AutoSizeText(
                                "Aplicar Questionario",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.assignment_outlined,
                                size: 100,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => GridQuestionarios()));
                },
              ),
              GestureDetector(
                child: Container(
                    height: 25,
                    color: Colors.blue,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              AutoSizeText(
                                "Banco de Questionarios",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.account_balance_wallet_sharp,
                                size: 100,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Lista2()));
                },
              ),
              GestureDetector(
                child: Container(
                    height: 25,
                    color: Colors.blue,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              AutoSizeText(
                                "Opções",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.miscellaneous_services_sharp,
                                size: 100,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => FileManager()));
                },
              ),

            ],
          ),
        ),
      );
  }
}