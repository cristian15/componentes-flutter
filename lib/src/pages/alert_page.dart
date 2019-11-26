import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alerta'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Activa Alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () =>_mostrarAlert(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.history),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlert(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          title: Text('Alerta Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Contenido de la alerta'),
              FlutterLogo(size: 100.0,)              
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: ()=> Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('OK'),
              onPressed: (){ 
                Navigator.of(context).pop();
               },
            ),
          ],
        );
      }

    );
  }
}