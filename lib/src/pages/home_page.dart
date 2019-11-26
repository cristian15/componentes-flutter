import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';

import 'package:componentes/src/pages/alert_page.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    /* print(menuProvider.opciones); */
/* 
    menuProvider.cargarData().then((data){
      print(data);
    });
    return ListView(
      children: _listaItems(),
    ); */

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot ){

        print('builder');
        print(snapshot.data);
        return ListView(
            children: _listaItems(snapshot.data, context),
        );
      } ,
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    
    final List<Widget> opciones = [];

    data.forEach( (opt){
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: (){

          /* final route = MaterialPageRoute(
            builder: (context) => AlertPage(),
          );
          Navigator.push(context, route); */

          Navigator.pushNamed(context, opt['ruta']);
        },
      ); 
      opciones..add( widgetTemp )
              ..add(Divider());
    });
    return opciones;

  }

  
}