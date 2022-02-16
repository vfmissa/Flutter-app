// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:food_test_app/telas/Aromatico/NumeroAromas.dart';
import 'package:food_test_app/telas/Sliders/SelecaoAtributos.dart';
import 'package:food_test_app/telas/discriminativo/DiferenteEigual.dart';
import 'discriminativo/AnaliseDiscriminativo.dart';
import 'comparativo/ComparativoNumAmostras.dart';
import 'Avaliativo/FichaAvaliacao.dart';


class drawer extends StatefulWidget {
  String amostra;
  String julgador;

  drawer(this.amostra,this.julgador);
  @override
  _drawerState createState() => _drawerState();
}

class _drawerState extends State<drawer> {

  @override
  final padding = EdgeInsets.fromLTRB(10, 10, 10, 0);
  Widget build(BuildContext context) {
   String amostra=widget.amostra;
   String julgador = widget.julgador;
    return Drawer(
      child: Material(
        color: Colors.blue,
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(text: "Discriminativo",
                icon: Icons.analytics_outlined,
                onCliked: () => selectedItem(context, 0,amostra,julgador)),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(text: "Amostra igual",
                icon: Icons.analytics_outlined,
                onCliked: () => selectedItem(context, 6,amostra,julgador)),

            const SizedBox(
              height: 16,
            ),
            buildMenuItem(text: "Comparativo",
                icon: Icons.add_chart_outlined,
                onCliked: () => selectedItem(context, 1,amostra,julgador)),
            Divider(
              color: Colors.white30,
            ),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(text: "Avaliativo",
                icon: Icons.assignment_outlined,
                onCliked: () => selectedItem(context, 3,amostra,julgador)),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(text: "AvaliativoSliders",
                icon: Icons.view_headline_rounded,
                onCliked: () => selectedItem(context, 4,amostra,julgador)),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(text: "Aromatico",
                icon: Icons.view_headline_rounded,
                onCliked: () => selectedItem(context, 5,amostra,julgador))
          ],
        ),)
      ,
    );
  }
}


Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onCliked,
}) {
  final color = Colors.white;
  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(
      text,
      style: TextStyle(color: color),
    ),
    hoverColor: Colors.red,
    onTap: onCliked,
  );
}

void selectedItem(BuildContext context, int index,String amostra,String julgador) {

  Navigator.of(context).pop();
  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            AnaliseDiscriminativo(amostra, julgador, "caracteristica"),
      ));
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ComparativoNumAmostras(amostra, julgador,),
      ));
      break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => FichaAvaliacao(amostra, julgador,),
      ));
      break;
    case 4:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SelecaoAtributos(amostra, julgador,),
      ));
      break;
    case 5:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => NumeroAromas(julgador),
      ));
      break;
    case 6:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DiferenteEigual(),
      ));
      break;
  }
}
