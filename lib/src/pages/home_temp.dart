import 'package:flutter/material.dart';


class HomePageTemp extends StatelessWidget {

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componente Temp'),
      ),
      body: ListView(
        children: _creaItems()
      ),
    );
  }

  List<Widget> _creaItems(){
      return opciones.map( (opcion) {
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(opcion),
              leading: Icon( Icons.account_balance_wallet),
              trailing: Icon( Icons.keyboard_arrow_right ),
              onTap: (){},
            ),
            Divider()
          ],
        );
      }).toList();
  }
}