// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:food_test_app/AnaliseDiscriminativo.dart';
import 'package:food_test_app/ComparativoVoto.dart';
import 'package:food_test_app/FichaCompleta.dart';
import 'package:food_test_app/ComparativoAmostra.dart';
import 'package:food_test_app/FichaAvaliacao.dart';

class drawer extends StatelessWidget {
  final padding = EdgeInsets.fromLTRB(10, 10, 10, 0);

  @override
  Widget build(BuildContext context) {
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
            onCliked: () => selectedItem(context, 0)),

        const SizedBox(
          height: 16,
        ),
          buildMenuItem(text: "Comparativo",
            icon: Icons.add_chart_outlined,
            onCliked: () => selectedItem(context, 1)),
        Divider(
        color: Colors.white30,
      ),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(text: "Avaliativo",
                icon: Icons.assignment_outlined,
                onCliked: () => selectedItem(context, 3)),
      ],
    ),)
    ,
    );
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
}

void selectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();
  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            AnaliseDiscriminativo("amostra", "julgador", "caracteristica"),
      ));
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>ComparativoVoto("amostra", "julgador"),
      ));
      break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>FichaAvaliacao("amostra", "julgador"),
      ));
      break;
  }
}
