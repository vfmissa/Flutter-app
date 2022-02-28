import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_test_app/telas/GridMain.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';


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

/*class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController amostracontroller = TextEditingController();
  TextEditingController julgadorcontroller = TextEditingController();
  TextEditingController idadecontroller = TextEditingController();
  TextEditingController sexocontroller = TextEditingController();
  TextEditingController caracteristicacontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:()async {
        //print("retorno habilitado");
        return true;
      },
      child: Scaffold(
        drawer: drawer(amostracontroller.text,julgadorcontroller.text),
          appBar: AppBar(
            title: Text("Home"),
            backgroundColor: Colors.blue,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.black54)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: SizedBox(
                          width: double.maxFinite,
                          height: 50,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.sentences,
                            controller: julgadorcontroller,
                            validator: (value) {
                              if (value == null || value
                                  .trim()
                                  .length == 0) {
                                return "Prencher Nome Julgador";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.blue,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                              hintText: "Julgador:",
                              hintStyle:
                              TextStyle(color: Colors.black, fontSize: 10),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: SizedBox(
                          width: double.maxFinite,
                          height: 50,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.sentences,
                            controller: idadecontroller,
                            validator: (value) {
                              if (value == null || value
                                  .trim()
                                  .length == 0) {
                                return "Prencher Idade";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.blue,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                              hintText: "idade:",
                              hintStyle:
                              TextStyle(color: Colors.black, fontSize: 10),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: SizedBox(
                          width: double.maxFinite,
                          height: 50,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.sentences,
                            controller: sexocontroller,
                            validator: (value) {
                              if (value == null || value
                                  .trim()
                                  .length == 0) {
                                return "Prencher Sexo";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.blue,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                              hintText: "Sexo:",
                              hintStyle:
                              TextStyle(color: Colors.black, fontSize: 10),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: SizedBox(
                          width: double.maxFinite,
                          height: 50,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.sentences,
                            controller: amostracontroller,
                            validator: (value) {
                              if (value == null || value
                                  .trim()
                                  .length == 0) {
                                return "Preencher Aroma";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.blue,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                              hintText: "Nº Controle",
                              hintStyle:
                              TextStyle(color: Colors.black, fontSize: 10),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: SizedBox(
                          width: double.maxFinite,
                          height: 50,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.sentences,
                            controller: caracteristicacontroller,
                            validator: (value) {
                              if (value == null || value
                                  .trim()
                                  .length == 0) {
                                return "Prencher Caracteristica";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.blue,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                              hintText: "Caracteristica:",
                              hintStyle:
                              TextStyle(color: Colors.black, fontSize: 10),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(color:Colors.white30,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          //_Salvar();   FUNÇÃO PARA SALVARNO BD, HABILITAR DEPOIS

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AnaliseDiscriminativo(
                                        amostracontroller.text,
                                        julgadorcontroller.text,
                                        caracteristicacontroller.text,
                                      )));
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Registrado')),
                          );
                        }else{print("PREENCHE O QUESTINARIO");}
                      },
                      child: Text(
                          "Submeter", style: TextStyle(color: Colors.black)),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 25, 12),
                    child: ElevatedButton(onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>Lista2()));

                    },
                        child: Text("Recuperar Questinario", style: TextStyle(color: Colors.black))),
                  )
                ],
              ))),
    );
  }
}
*/