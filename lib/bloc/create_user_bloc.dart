import 'dart:async';


import 'package:qookit/bloc/response.dart';
import 'package:qookit/models/createuser_request_model.dart';
import 'package:qookit/services/elastic/elastic_service.dart';
import 'package:qookit/services/elastic/endpoints/users_service.dart';
import 'package:qookit/services/services.dart';
import 'package:qookit/services/user/user_service.dart';

class CreateUserBloc {
  ElasticService elasticService;
  StreamController<Response<UnmatchUserReportRequestModel>> postCreateUserBlocController;

  StreamSink<Response<UnmatchUserReportRequestModel>> get dataSink => postCreateUserBlocController.sink;

  Stream<Response<UnmatchUserReportRequestModel>> get dataStream => postCreateUserBlocController.stream;

  CreateUserBloc() {
    elasticService = ElasticService();
    postCreateUserBlocController = StreamController<Response<UnmatchUserReportRequestModel>>();
  }

  Future<Null> postUserData(Map<String, dynamic> details) async {
    dataSink.add(Response.loading('Creating User...'));

    try {
      UnmatchUserReportRequestModel unMatchUserReportRequest = await elasticService.postItem(UsersService.endpoint, details);

      ///store data in local database (hive)
      await hiveService.setupHive();
      await hiveService.userBox.put(UserService.fullName, unMatchUserReportRequest.userName);
      await hiveService.userBox.put(UserService.displayName, unMatchUserReportRequest.displayName);
      await hiveService.userBox.put(UserService.userEmail, unMatchUserReportRequest.personal.email);
      await hiveService.userBox.put(UserService.profileImage, unMatchUserReportRequest.photoUrl);

      dataSink.add(Response.completed(unMatchUserReportRequest));
    } catch (e) {
      dataSink.add(Response.error(e.toString()));
    }
    return null;
  }
  dispose() {
    postCreateUserBlocController.close();
  }
}
