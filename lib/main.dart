import 'package:flutter/material.dart';
import 'package:recipes_test_task/entity_json/recipes.dart';

void main() {runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Recipes(),
    );
  }
}