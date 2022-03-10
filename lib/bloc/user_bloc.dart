import 'dart:async';
import 'package:qookit/bloc/response.dart';
import 'package:qookit/models/userdata.dart';
import 'package:qookit/services/elastic/elastic_service.dart';
import 'package:qookit/services/elastic/endpoints/users_service.dart';
import 'package:qookit/services/services.dart';
import 'package:qookit/services/user/user_service.dart';

class UserBloc{

  ElasticService elasticService;
  StreamController<Response<UserDataModel>> UserBlocController;

  StreamSink<Response<UserDataModel>> get dataSink => UserBlocController.sink;
  Stream<Response<UserDataModel>> get dataStream => UserBlocController.stream;

  UserBloc(){
    elasticService = ElasticService();
    UserBlocController = StreamController<Response<UserDataModel>>();
  }

  Future<Null> getUserData() async {
    dataSink.add(Response.loading('Get User Data...'));

    try {
      UserDataModel userDataModel = await elasticService.getList(UsersService.endpoint);

      ///store data in local database (hive)
      await hiveService.setupHive();
      await hiveService.userBox.put(UserService.fullName, userDataModel.userName);
      await hiveService.userBox.put(UserService.displayName, userDataModel.displayName);
      await hiveService.userBox.put(UserService.userEmail, userDataModel.personal.email);
      await hiveService.userBox.put(UserService.userId, userDataModel.id);

      print('save data '+ hiveService.userBox.put(UserService.fullName, userDataModel.userName).toString());

      dataSink.add(Response.completed(userDataModel));
    } catch (e) {
      dataSink.add(Response.error(e.toString()));
    }
    return null;
  }

  dispose() {
    UserBlocController.close();
  }
}