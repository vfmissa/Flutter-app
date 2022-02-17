// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:food_test_app/Modelo%20de%20Classes/ModeloSlider.dart';

class TesteSlidersSalvo extends StatefulWidget {

  late final ModeloSlider teste;

  TesteSlidersSalvo(this.teste);

  @override
  _TesteSlidersSalvoState createState() => _TesteSlidersSalvoState();
}

class _TesteSlidersSalvoState extends State<TesteSlidersSalvo> {

  late ModeloSlider teste;

  @override

  void initState() {
    teste = widget.teste;
    super.initState();
  }


  Widget build(BuildContext context) {

    var data = DateTime.fromMillisecondsSinceEpoch(teste.data);
    DateTime dia = new DateTime(data.year, data.month, data.day);

    return Scaffold(
      appBar: AppBar(
        title: Text("Questinario salvo"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(//row de texto
                  children: [
                Text(
                  "Julgador: ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
                Text(
                  "Data:${dia.day}/${dia.month}/${dia.year}",
                  textAlign: TextAlign.center,
                  style:
                      const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
              ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
              /*Container(
                height: 60,
                width: 700,
                decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.blue)),
                child: AutoSizeText(
                  "Você recebera varias amostras para provar avalie posicionando o Slider na altura que representa oque você percebe do atributo em analise\n",
                  maxLines: 15,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 30),
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 16, 25, 0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, //row de texto
                        children: [
                      Spacer(
                        flex: 1,
                      ),
                      Text(
                        "Nº Amostra",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                      ),
                      Spacer(
                        flex: 4,
                      ),
                      Text(
                        "Percepção do Atributo",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                      ),
                      Spacer(
                        flex: 4,
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: 120,
                        height: 35,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          initialValue: teste.amostra.toString(),
                          readOnly: true,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        )),
                    SizedBox(
                        width: 120,
                        height: 35,
                        child: TextFormField(
                          initialValue: teste.caracteristica,
                          readOnly: true,
                          textCapitalization: TextCapitalization.sentences,
                          style: TextStyle(fontSize: 12),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        )),
                    Column(
                      children: [
                        SizedBox(
                          width: 300,
                          child: Slider(
                            value: teste.valor_slider,
                            max: 100,
                            //label: teste.valor_slider.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                null;
                              });
                            },
                          ),
                        ),
                        Text("Valor:"+teste.valor_slider.toStringAsFixed(2)),
                      ],
                    )
                  ],
                ),
              ),
              //SEGUNDO ITEM
              /*Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: 90,
                        height: 25,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          initialValue: "$amostra",
                          readOnly: true,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        )),
                    SizedBox(
                        width: 120,
                        height: 25,
                        child: TextFormField(
                          initialValue: "$caracteristica2",
                          readOnly: true,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        )),
                    SizedBox(
                      width: 300,
                      child: Slider(
                        value: _SliderValueDois,
                        max: 100,
                        label: _SliderValueDois.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _SliderValueDois = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.black),
                    color: Colors.white12,
                  ),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        readOnly: true,
                        initialValue: teste.comentario,
                        maxLines: 3,
                        //controller: comentario,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.blue,
                          contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                          hintText: "Comentarios:",
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      )),
                ),
              ),
              /*ElevatedButton(onPressed: ( ){

                debugPrint(teste.valor_slider.toString());


              }, child: Text("test", style: TextStyle(color: Colors.black))),*/
            ],
          ),
        ),
      ),
    );
  }
}
