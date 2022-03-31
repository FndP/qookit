import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:qookit/models/createuser_request_model.dart';
import 'package:qookit/models/userdata.dart';
import 'package:qookit/services/elastic/endpoints/ingredients_service.dart';
import 'package:qookit/services/elastic/endpoints/recipes_service.dart';
import 'package:qookit/services/elastic/endpoints/users_service.dart';
import 'package:qookit/services/services.dart';
import 'package:qookit/utils/custom_exception.dart';

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
  RecipesService get recipesEndpoint {
    return RecipesService();
  }

  // GENERIC REQUESTS **************************************************************************
  // GET ALL ITEMS
  Future<UserDataModel> getList(String endpoint) async {
    ///API for Getting user data
    var responseJson;
    var uri = Uri.https(elasticService.domain, endpoint);
    var token;
    if(authService!=null && authService.token!=null){
      token = await authService.token;
    }

    var recipeResponse = await http.get(uri,
      headers: token != null ? {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json',
      } : {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    responseJson = _response(recipeResponse);
    return UserDataModel.fromJson(responseJson);
  }

 Future<UnmatchUserReportRequestModel> postItem(String endpoint, Map<String, dynamic> details) async {

    var responseJson;
    var uri = Uri.https(elasticService.domain, endpoint);
    var token;
    if(authService!=null && authService.token!=null){
      token = await authService.token;
    }

    var recipeResponse = await http.post(uri,
        headers: token!=null ? {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: 'application/json',
        }: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
         body: jsonEncode(details)
    );
      responseJson = _response(recipeResponse);
   return UnmatchUserReportRequestModel.fromJson(responseJson);
  }

  ///Status code for api responses
  dynamic _response(http.Response response) {
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 201:
      case 204:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        var responseJson = json.decode(response.body.toString());
        var msg = responseJson['message'];
        return responseJson;
        throw BadRequestException(msg);
      case 401:
        var responseJson = json.decode(response.body.toString());
        var msg = responseJson['message'];
        throw NoInternetException(msg);
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 412:
        var responseJson = json.decode(response.body.toString());
        // print(responseJson);
        print(responseJson);
        return responseJson;

      case 500:
        var responseJson = json.decode(response.body.toString());
        var error = responseJson['errors'] ?? '';
        var msg = '';
        throw BadRequestException(msg ?? response.body.toString());
      // } else {
      //   throw BadRequestException(response.body.toString());
      // }
      case 422:
        var responseJson = json.decode(response.body.toString());
        var msg = responseJson['message'];
        throw BadRequestException(msg);
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
