import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:qookit/services/services.dart';

@singleton
class IngredientsService {
  static const String endpoint = '/v1/ingredients';

  Future<void> getRecipeList(Map<String, String> queryParameters) async {
    var uri = Uri.https(elasticService.domain, endpoint, queryParameters);
    var token = await authService.token;

    var ingredientResponse = await http.get(
      uri,
      headers: {
        //HttpHeaders.authorizationHeader
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    print('Response status: ${ingredientResponse.statusCode}');
    print('Response body: ${ingredientResponse.body}');
  }
}

class IngredientParameters {
  final String searchString;
  final List<String> dietLabels;
  final int pageSize;
  final String pageToken;
  final String include;

  IngredientParameters(
    this.searchString,
    this.dietLabels,
    this.pageSize,
    this.pageToken,
    this.include,
  );

  Map<String, dynamic> toMap(){
    return {
      'searchString': searchString,
      'dietLabels': dietLabels,
      'pageSize' : pageSize,
      'pageToken' : pageToken,
      'include' : include
    };
  }
}
