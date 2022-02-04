// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../Modelo de Classes/TesteDiscriminativo.dart';
import 'package:flutter/cupertino.dart';

class DatalhesTesteDiscriminativo extends StatefulWidget {
  //late final String appbartitle;
  late final TesteDiscriminativo teste;

  DatalhesTesteDiscriminativo(this.teste);

  @override
  _DatalhesTesteDiscriminativoState createState() =>
      _DatalhesTesteDiscriminativoState();
}

class _DatalhesTesteDiscriminativoState
    extends State<DatalhesTesteDiscriminativo> {
  late TesteDiscriminativo teste;

  @override
  void initState() {
    teste = widget.teste;
    super.initState();
  }

  Widget build(BuildContext context) {
    print(teste.maiscaracteristica.toString());
    return Scaffold(
        appBar: AppBar(
          title: Text(" Amostra ID: " + teste.id.toString()),
        ),
        //TesteDiscriminativo(this._id,this._amostra_controle,this._amostra_testada,this._amostra2,this._amostra3,this._comentario);
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    teste.amostra_controle,
                    style: TextStyle(fontSize: 32, fontStyle: FontStyle.normal),
                  )
                ],
              ),
              Container(
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        teste.menoscaracteristica,
                        style: TextStyle(
                            fontSize: 32, fontStyle: FontStyle.normal),
                      ),
                      Text("Menor Amargor",
                          style: TextStyle(
                              fontSize: 32, fontStyle: FontStyle.normal)),
                    ],
                  )),
              Container(
                  color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        teste.mediacaracteristica.toString(),
                        style: TextStyle(
                            fontSize: 32, fontStyle: FontStyle.normal),
                      ),
                      Text("Sem Diferença de Amargor",
                          style: TextStyle(
                              fontSize: 32, fontStyle: FontStyle.normal)),
                    ],
                  )),
              Container(
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Text(teste.maiscaracteristica.toString(),
                        style: TextStyle(
                            fontSize: 32, fontStyle: FontStyle.normal),
                      ),
                      Text("Maior Amargor",
                          style: TextStyle(
                              fontSize: 32, fontStyle: FontStyle.normal)),
                    ],
                  ))
            ],
          ),
        ));
  }
}
