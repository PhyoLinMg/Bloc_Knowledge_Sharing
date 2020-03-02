import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:dynamic_theme/theme_switcher_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget{

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GG"),),
      body: Container(
      child: Center(child: RaisedButton(
        child: Text("Change Theme"),
        onPressed: (){
        showDialog(context: context,builder: (context){
          return BrightnessSwitcherDialog(onSelectedTheme: (Brightness brightness){
              DynamicTheme.of(context).setBrightness(brightness);
          },);
        });
      }),),
    ),
    );    
  }

  
}