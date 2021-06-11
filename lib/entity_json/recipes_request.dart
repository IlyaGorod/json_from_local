import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class RecipesList{
  List<RecipesEntity> recipes;

  RecipesList({this.recipes});

  factory RecipesList.fromJson(Map<String, dynamic> json){

    var recipesJson = json['array'] as List;

    List<RecipesEntity> recipesList = recipesJson.map((i) =>
        RecipesEntity.fromJson(i)).toList();

    recipesList.sort((a, b) {
      return a.id.compareTo(b.id.toLowerCase());
    });

    return RecipesList(
       recipes: recipesList,
    );
  }
}

class RecipesEntity {
  final String id;
  final String name;
  final String picture;
  final String description;

  RecipesEntity({this.id, this.name, this.picture, this.description});

  factory RecipesEntity.fromJson(Map<String, dynamic> json){
    return RecipesEntity(
      id: json['id'].toString(),
      name: json['name'] as String,
        picture: json['picture'] as String,
      description: json['description'] as String
    );
  }
}

Future <RecipesList> getRecipesList() async {
  //const url = 'https://github.com/ababicheva/FlutterInternshipTestTask/blob/main/recipes.json';
  //final response = await http.get(Uri.parse(url));
  final response = await rootBundle.loadString('assets/recipes.json');

  //if(response.statusCode == 200 ) {
    return RecipesList.fromJson(json.decode(response));
  //}else {
  //  throw Exception('Failed to load recipes');
  //}
}
