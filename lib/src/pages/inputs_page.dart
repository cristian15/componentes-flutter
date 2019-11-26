import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email  = '';
  String _fecha  = '';

  List<String> _poderes = ['Volar','Rayos X', 'Super Fuerza'];

  String _opcionSeleccionada = 'Volar';

  TextEditingController _inputFielFechaController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nombre = '';
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs Page'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${ _nombre.length }'),
        hintText: 'Nombre',
        labelText: 'Nombre',
        helperText: 'Solo nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor){
        setState(() {
        _nombre = valor;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Tu Nombre es:  $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Email',
        labelText: 'Emial',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (valor){
        setState(() {
          _email = valor;
        });
      },
    ); 
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock)
      ),
      onChanged: (valor){
        setState(() {
          _email = valor;
        });
      },
    ); 

  }

  Widget _crearFecha(BuildContext context) {

    return TextField(
      controller: _inputFielFechaController,
      enableInteractiveSelection: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha',
        labelText: 'Fecha',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    ); 
  }

  _selectDate(BuildContext context) async{
      DateTime pick = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES')
      );

      if(pick !=null){
        setState(() {
          _fecha = pick.toString();
          _inputFielFechaController.text = _fecha;
        });
      }
  }

  List<DropdownMenuItem<String>> getOpcionesDropDown(){
      List<DropdownMenuItem<String>> lista = new List();
      _poderes.forEach((poder){
        lista.add(DropdownMenuItem(
          child: Text(poder),
          value: poder,
        ));
      });

      return lista;
  }

  Widget _crearDropDown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
        DropdownButton(
          value: _opcionSeleccionada,
          items: getOpcionesDropDown(),
          onChanged: (opt){
          setState(() {
            _opcionSeleccionada =opt;
          });
          },
        )
      ],
    );
    
  }
}