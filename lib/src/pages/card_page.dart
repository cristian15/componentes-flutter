import 'package:flutter/material.dart';


class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2()
        ],
      ),
    );
  }

  Widget _cardTipo1(){
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Titulo de la tarjeta'),
            subtitle: Text('subtitulo de esta tarjeta, descripcion'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: (){},
              ),
              FlatButton(
                child: Text('ok'),
                onPressed: (){},
              )
            ],
          )
        ],
      ),
    );
  }


  Widget _cardTipo2(){
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://iso.500px.com/wp-content/uploads/2014/07/big-one.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
         /*  Image(
            image: NetworkImage('https://iso.500px.com/wp-content/uploads/2014/07/big-one.jpg'),
          ), */
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('descripción de la imagen para esta tarjeta')
            )
        ],
      ),
    );
  }
}