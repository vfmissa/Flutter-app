// ignore_for_file: file_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:food_test_app/telas/GridMain.dart';
import '../../main.dart';

class FichaOrdenacao extends StatefulWidget {
  String tipo;
  String amostra;
  String amostra2;
  String amostra3;
  String julgador;

  FichaOrdenacao(this.julgador,this.tipo, this.amostra, this.amostra2, this.amostra3);

  _FichaOrdenacaoState createState() => _FichaOrdenacaoState();
}

class _FichaOrdenacaoState extends State<FichaOrdenacao> {
  DateTime now = DateTime.now();
  TextEditingController gosteimenos = TextEditingController();
  TextEditingController gosteiMeio = TextEditingController();
  TextEditingController gosteiMais = TextEditingController();
  TextEditingController comentarioFormPreferencia = TextEditingController();

  String amostra = "text";
  String amostra2 = "text";
  String amostra3 = "text";
  String julgador = "julgador";

  @override
  void initState() {
    amostra = widget.amostra;
    amostra2 = widget.amostra2;
    amostra3 = widget.amostra3;
    julgador = widget.julgador;
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ficha de ordenação"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.black54)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Julgador: ${widget.julgador}",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      "Data: ${now.day}/${now.month}/${now.year}",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              //SizedBox(height: 10,),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Você está recebendo três amostras codificadas de ${widget.tipo}. "
                  "Avalie cada uma,colocando-as em ordem crescente "
                  "de acordo com sua preferência",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    letterSpacing: 2,
                  ),
                ),
              ),
              //SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: SizedBox(
                      width: 100,
                      height: 15,
                      child: Text("Gostei Menos"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: SizedBox(
                      width: 100,
                      height: 15,
                      child: Text("Gostei Mais"),
                    ),
                  )
                ],
              ),
              Form(
                key: _formKey,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              maxLength: 3,
                              controller: gosteimenos,
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    int.parse(value) <= 100 ||
                                    int.parse(value) >= 1000) {
                                  return "N° Invalido";
                                }
                                return null;
                              },
                              // ignore: prefer_const_constructors
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.blue,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                hintText: " ",
                                contentPadding: EdgeInsets.all(5),
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                //border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero))
                              ),
                            )),
                      ),
                      //Expanded(child: SizedBox(width: 10,height: 0,)),
                      Expanded(
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              maxLength: 3,
                              controller: gosteiMeio,
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    int.parse(value) <= 100 ||
                                    int.parse(value) >= 1000) {
                                  return "N° Invalido";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  filled: true,
                                  contentPadding: EdgeInsets.all(5),
                                  fillColor: Colors.blue,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  )),
                            )),
                      ),
                      //Expanded(child: SizedBox(width: 10,height: 0,)),
                      Expanded(
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              maxLength: 3,
                              controller: gosteiMais,
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    int.parse(value) <= 100 ||
                                    int.parse(value) >= 1000) {
                                  return "N° Invalido";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.blue,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  hintText: " ",
                                  contentPadding: EdgeInsets.all(5),
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  )),
                            )),
                      ),
                    ]),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                  color: Colors.white12,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    maxLines: 3,
                    controller: comentarioFormPreferencia,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue,
                        hintText: "Comentario:",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        )),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print(gosteimenos.text);
                    print(gosteiMeio.text);
                    print(gosteiMais.text);
                    print(comentarioFormPreferencia.text);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => GridMain()));
                  }
                },
                child: Text("Submeter", style: TextStyle(color: Colors.black)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
