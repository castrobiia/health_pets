import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:health_pets/models/authenticate.model.dart';
import 'package:health_pets/models/user.model.dart';
import '../settings.dart';

class AccountRepository{
  Future<UserModel> authenticate(AuthenticateModel model) async{
    var url = "${Settings.apiUrl}auth/login";

    Response response = await Dio().post(url, data:model);
    UserModel user = UserModel.fromJson(response.data['user']);
    // var user = UserModel.fromJson(jsonDecode(response.data['user']));
    user.token = response.data['access_token'];
    return user;
  }

  Future<UserModel> create(UserModel model) async{
    var url = "${Settings.apiUrl}/api/auth/register";
    Response response = await Dio().post(url, data:model);
    return UserModel.fromJson(response.data);
  }

  Future<UserModel> delete(UserModel model) async{
    var url = "${Settings.apiUrl}/api/auth/delete";
    Response response = await Dio().post(url, data:model);
    return UserModel.fromJson(response.data);
  }

  //todo criar na api a rota de update das informações de usuários

}