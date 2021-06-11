import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'recipes_request.dart';

class Recipes extends StatefulWidget{

  @override
  _RecipesState createState() => _RecipesState();
}

  class _RecipesState extends State<Recipes>{

  Future<RecipesList> recipesList;

  @override
  void initState(){
    super.initState();
    recipesList = getRecipesList();
  }

  @override
    Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('My Recipes'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, size: 35.0,),
            onPressed: (){},
          )
        ],
      ),
      body: FutureBuilder<RecipesList>(
        future: recipesList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.recipes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                        title: Text('${snapshot.data.recipes[index].name}'),
                        subtitle: Text(
                            '${snapshot.data.recipes[index].description}'),
                        leading: Image.network(
                            '${snapshot.data.recipes[index].picture}')
                    ),
                  );
                }
            );
          } else if (snapshot.hasError){
            return Text('Error');
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}