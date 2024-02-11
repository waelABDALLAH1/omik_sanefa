import 'dart:convert';
import 'recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list', {"limit": '24', "start": '0'});

    try {
      final response = await http.get(uri, headers: {
        'X-RapidAPI-Key': 'd63da60830msh3a474917c9dbee1p1f6bc7jsn1a6def8b7a81',
        'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
        'useQueryString': 'true'
      });

      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);

        if (data.containsKey('feed')) {
          List<dynamic> feed = data['feed'];

          List<Map<String, dynamic>> details = [];
          for (var item in feed) {
            if (item.containsKey('content') && item['content'].containsKey('details')) {
              details.add(item['content']['details']);
            }
          }

          return Recipe.recipesFromSnapshot(details);
        } else {
          throw Exception('Unexpected response format: Missing "feed" key.');
        }
      } else {
        throw Exception('Failed to load recipes: ${response.statusCode}');
      }
    } catch (e) {
      // Handle errors, e.g., network issues, JSON decoding errors
      print('Error fetching recipes: $e');
      rethrow; // Rethrow the exception for higher-level error handling
    }
  }
}
