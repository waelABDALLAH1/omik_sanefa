import 'package:flutter/material.dart';
import 'package:recipe_list/models/recipe.api.dart';
import 'package:recipe_list/views/widgets/recipe_card.dart';

import '../models/recipe.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Recipe> _recipes=[];
  bool _isLoading =true;
  @override
  void initState() {

    super.initState();

    getRecipes();
  }
  Future<void> getRecipes() async {
    _recipes =await RecipeApi.getRecipe();
    setState(() {
      _isLoading=false;

    });
    print(_recipes);
  }



  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10,),
            Text('Omik Sanefa  '),
            Text('🇹🇳',style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
      body: RecipeCard(title: "my recipe", cookTime: '30 min ', rating: '4.3', thumbnailUrl:'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360') ,
    );
  }
}
