import 'dart:async';

import 'package:hive/hive.dart';
import 'package:qookit/bloc/response.dart';
import 'package:qookit/models/createuser_request_model.dart';
import 'package:qookit/services/elastic/elastic_service.dart';
import 'package:qookit/services/elastic/endpoints/users_service.dart';
import 'package:qookit/services/services.dart';
import 'package:qookit/services/user/user_service.dart';

class CreateUserBloc {
  ElasticService elasticService;
  StreamController<Response<UnmatchUserReportRequestModel>>
      postCreateuserBlocController;

  StreamSink<Response<UnmatchUserReportRequestModel>> get dataSink =>
      postCreateuserBlocController.sink;

  Stream<Response<UnmatchUserReportRequestModel>> get dataStream =>
      postCreateuserBlocController.stream;

  CreateUserBloc() {
    elasticService = ElasticService();
    postCreateuserBlocController =
        StreamController<Response<UnmatchUserReportRequestModel>>();
  }

  Future<Null> postUserData(Map<String, dynamic> details) async {
    dataSink.add(Response.loading('Creating User...'));
    try {
      UnmatchUserReportRequestModel unmatchUserReportRequest = await elasticService.postItem(UsersService.endpoint, details);

      ///store data in local database (hive)
      await hiveService.setupHive();
      await hiveService.userBox.put(UserService.fullName, unmatchUserReportRequest.userName);
      await hiveService.userBox.put(UserService.displayName, unmatchUserReportRequest.displayName);
      await hiveService.userBox.put(UserService.userEmail, unmatchUserReportRequest.personal.email);
      await hiveService.userBox.put(UserService.profileImage, unmatchUserReportRequest.photoUrl);
      

      dataSink.add(Response.completed(unmatchUserReportRequest));
    } catch (e) {
      dataSink.add(Response.error(e.toString()));
    }
    return null;
  }
  dispose() {
    postCreateuserBlocController.close();
  }
}
