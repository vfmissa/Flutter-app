import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_test_app/Modelo de Classes/ModeloComparativo.dart';

class TesteComparativoSalvo extends StatefulWidget {

  late final ModeloComparativo teste;


  TesteComparativoSalvo(this.teste);

  @override
  _TesteComparativoSalvoState createState() => _TesteComparativoSalvoState();
}

class _TesteComparativoSalvoState extends State<TesteComparativoSalvo> {
  late ModeloComparativo teste;
  @override

  void initState() {
    teste = widget.teste;
    super.initState();
  }


  Widget build(BuildContext context) {
    String _valorpadrao = teste.nota;
    return Scaffold(
      appBar: AppBar(
        title: Text("Ficha de Avaliação: "+teste.amostra_controle),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        //width:800,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.black54)),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Julgador: ",
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  ),
                  Text(
                    "Data: ",
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(decoration: BoxDecoration(color: Colors.blue,border: Border.all(color: Colors.black54,width: 3)),
                      child: SizedBox(
                          width: 150,
                          height: 30,
                          child: AutoSizeText(
                            "Amostra:"+teste.amostra_testada,
                            style: TextStyle(fontSize: 36),
                            maxLines: 1,
                          ))),

                ],
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.blue)),
                child: AutoSizeText(
                  "Nota dada comparando com amostra padrão "+teste.amostra_controle+" Quanto ao atributo (Especificar)\n",
                   textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(width: 800,height: 60,
                decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.blue)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: Radio(
                          value: "1",
                          groupValue: _valorpadrao,
                          onChanged: (value) {
                            setState(() {
                              _valorpadrao = value as String;
                            });
                          },
                        ),
                        title: FittedBox(child: AutoSizeText("1: Nenhuma",maxFontSize: 16)),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: Radio(
                          value: "2",
                          groupValue: _valorpadrao,
                          onChanged: (value) {
                            setState(() {
                              _valorpadrao = value as String;
                            });
                          },
                        ),
                        title: FittedBox(child: AutoSizeText("2: Ligeira",maxFontSize: 16)),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: Radio(
                          value: "3",
                          groupValue: _valorpadrao,
                          onChanged: (value) {
                            setState(() {
                              _valorpadrao = value as String;
                            });
                          },
                        ),
                        title: FittedBox(child: AutoSizeText("3:Moderada",style: TextStyle(fontSize: 16),)),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: Radio(
                          value: "4",
                          groupValue: _valorpadrao,
                          onChanged: (value) {
                            setState(() {
                              _valorpadrao = value as String;
                            });
                          },
                        ),
                        title: FittedBox(child: AutoSizeText("4: Muita",maxFontSize: 16)),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: Radio(
                          value: "5",
                          groupValue: _valorpadrao,
                          onChanged: (value) {
                            setState(() {
                              _valorpadrao = value as String;
                            });
                          },
                        ),
                        title: FittedBox(child: AutoSizeText("5: Extrema",maxFontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
