import 'package:flutter/material.dart';
import 'package:recipe_list/models/recipe.api.dart';
import 'package:recipe_list/views/widgets/recipe_card.dart';

import '../models/recipe.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


}

class _HomePageState extends State<HomePage> {
  List<Recipe> _recipes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(
                width: 10,
              ),
              Text('Omik Sanefa  '),
              Text(
                '🇹🇳',
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _recipes.length, itemBuilder: (context,index){
                  return RecipeCard(title: _recipes[index].name, cookTime: _recipes[index].totalTime, rating: _recipes[index].rating.toString(), thumbnailUrl:_recipes[index].images);
        }));
  }
}
