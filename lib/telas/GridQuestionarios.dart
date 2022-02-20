// ignore_for_file: file_names
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_test_app/telas/Aromatico/NumeroAromas.dart';
import 'package:food_test_app/telas/Sliders/SelecaoAtributos.dart';
import 'package:food_test_app/telas/discriminativo/AmostrasDiferentigual.dart';
import 'package:food_test_app/telas/discriminativo/AnaliseDiscriminativo.dart';
import 'package:food_test_app/telas/Avaliativo/AmostrasAvaliativo.dart';
import 'DrawerWidget.dart';

class GridQuestionarios extends StatefulWidget {
  @override
  _GridQuestionariosState createState() => _GridQuestionariosState();
}

class _GridQuestionariosState extends State<GridQuestionarios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      drawer: drawer("temp1drawer", "temp2drawer"),
      appBar: AppBar(
        title: const Text("Questionarios"),
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
                              "Questionario Avaliativo",
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
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AmostrasAvaliativo()));
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
                              "Questionarios Slider",
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.analytics,
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
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SelecaoAtributos()));
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
                              "Questionarios Diferente/igual",
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.add_road_rounded,
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
                    context,
                    MaterialPageRoute(
                        builder: (context) => AmostrasDiferentigual()));
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
                              "Questionarios Discriminativo",
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.account_circle,
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
                    context,
                    MaterialPageRoute(
                        builder: (context) =>AnaliseDiscriminativo("temp1", "temp2","caracteristica")));
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
                          children: const [
                            AutoSizeText(
                              "Questionarios Aromatico",
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.smoking_rooms_outlined,
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
                    context,
                    MaterialPageRoute(
                        builder: (context) => NumeroAromas()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
