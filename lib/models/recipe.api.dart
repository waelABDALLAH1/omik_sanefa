import 'dart:convert';
import 'recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https(
        'yummly2.p.rapidapi.com', '/feeds/list', {"limit": '24', "start": '0'});
    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'd63da60830msh3a474917c9dbee1p1f6bc7jsn1a6def8b7a81',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
      'useQueryString': 'true'
    });
    Map data= jsonDecode(response.body);
    List _temp =[];

    for (var i in data['feed']){
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);



  }
}
