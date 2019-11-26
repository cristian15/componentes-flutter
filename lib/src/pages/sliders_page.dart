import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
              children: <Widget>[
                _crearSlider(),
                _crearCheckBox(),
                _crearSwitch(),
                Expanded(
                  child: _crearImagen()
                )
                
              ],
            ),
      )
       
      
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de Imagen',
      //divisions: 20,
      value: _valorSlider,
      min: 100.0,
      max: 400.0,
      onChanged: (_bloquearCheck) ? null : (valor){
        setState(() {
          _valorSlider = valor;
        });
      },
    );
  }

  Widget _crearCheckBox(){
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
    /* return Checkbox(
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      },
    ); */
  }

  Widget _crearSwitch(){
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7FjMTYaFkypdF5Xi27JEK9rOCMeQ2DavO7dt1XTm7cxcxPMOvXQ&s'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}