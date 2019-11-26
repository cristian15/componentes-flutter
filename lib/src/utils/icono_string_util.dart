import 'package:flutter/material.dart';


final _icons = <String, IconData>{
    'add_alert'       : Icons.add_alert,
    'accessibility'   : Icons.accessibility,
    'folder_open'     : Icons.folder_open,
    'donut_large'     : Icons.donut_large,
    'input'           : Icons.input,
    'tune'            : Icons.tune,
    'list'            : Icons.list
};



Icon getIcon(String icono) => Icon(_icons[icono], color: Colors.blue,);