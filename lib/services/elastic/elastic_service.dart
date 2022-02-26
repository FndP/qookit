import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:qookit/services/elastic/endpoints/ingredients_service.dart';
import 'package:qookit/services/elastic/endpoints/recipes_service.dart';
import 'package:qookit/services/elastic/endpoints/users_service.dart';
import 'package:qookit/services/services.dart';

@injectable
class ElasticService {
  String domain = 'qookit.ddns.net';

  // List of DB endpoints
  String get recipesUrl {
    return RecipesService.endpoint;
  }

  String get ingredientsUrl {
    return IngredientsService.endpoint;
  }

  String get usersUrl {
    return UsersService.endpoint;
  }

  // List of endpoint classes
  RecipesService get recipesEndpoint{
    return RecipesService();
  }

  // GENERIC REQUESTS **************************************************************************
  // GET ALL ITEMS
  Future<void> getList(
      String endpoint, Map<String, String> queryParameters) async {
    var uri = Uri.https(elasticService.domain, endpoint, queryParameters);
    var token = await authService.token;

    var recipeResponse = await http.get(
      uri,
      headers: {
        //HttpHeaders.authorizationHeader
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    print('Response status: ${recipeResponse.statusCode}');
    print('Response body: ${recipeResponse.body}');
  }

  // POST AN ITEM
  Future<void> postItem(String endpoint, Map<String, dynamic> details) async {
    var uri = Uri.https(domain, endpoint);
    var token = await authService.token;

    var recipeResponse = await http.post(uri,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode(details));
    print('Response status: ${recipeResponse.statusCode}');
    print('Response body: ${recipeResponse.body}');
  }
}
