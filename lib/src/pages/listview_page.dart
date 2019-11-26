import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  ScrollController _scrollControler = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollControler.addListener((){
      if(_scrollControler.position.pixels == _scrollControler.position.maxScrollExtent){
        //_agregar10();
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollControler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View'),
      ),
      body: Stack(
        children: <Widget>[
            _crearLista(),
            _crearLoading()
        ],
      )
      
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
          onRefresh: _obtenerPagina1,
          child: ListView.builder(
              controller: _scrollControler,
              itemCount: _listaNumeros.length,
              itemBuilder: (BuildContext context, int index){
                final imagen = _listaNumeros[index];
                return FadeInImage(
                  image: NetworkImage('https://picsum.photos/id/$imagen/500/300'),
                  placeholder: AssetImage('assets/jar-loading.gif'),
                );
              },
            ),
          );
  }
  Future<Null> _obtenerPagina1() async{
    final duration = new Duration(seconds: 2);
    new Timer(duration, (){
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }
  _agregar10(){

    for(var i=1; i<10; i++){
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() { });
  }

  Future _fetchData() async{

    _isLoading = true;
    setState(() { });
    final duration = new Duration(seconds: 2);
    new Timer( duration, respuestaHTTP );

  }

  void respuestaHTTP(){
    _isLoading = false;

    _scrollControler.animateTo(
      _scrollControler.position.pixels + 150,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 200)
    );
    _agregar10();
  }

  Widget _crearLoading(){
    if(_isLoading){
      return  Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0,)
        ],
      );
    }

    return Container();
  }
}