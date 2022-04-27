import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:health_pets/models/authenticate.model.dart';
import 'package:health_pets/models/user.model.dart';
import '../models/user-cadastro-model.dart';
import '../settings.dart';

class AccountRepository{
  Dio dio = new Dio((BaseOptions(contentType: Headers.jsonContentType,responseType: ResponseType.json,validateStatus: (_)=>true,)));


  AccountRepository(){
    // dio.options.headers['content-Type'] = 'application/json';
    // dio.options.headers['accept'] = 'application/json';
  }

  Future<UserModel> authenticate(AuthenticateModel model) async{
    var url = "${Settings.apiUrl}auth/login";

    Response response = await dio.post(url, data:model);
    UserModel user = UserModel.fromJson(response.data['user']);
    // var user = UserModel.fromJson(jsonDecode(response.data['user']));
    user.token = response.data['access_token'];
    return user;
  }

  Future<UserModel> create(UserCadastroModel model) async{
    // var url = Uri.https("www.healthpets.app.br", "api/auth/register");
    var url = "${Settings.apiUrl}auth/register";
    Response response = await dio.post(url, data:model);
    return UserModel.fromJson(response.data);
  }


  Future<UserModel> delete(UserModel model) async{
    var url = "${Settings.apiUrl}/api/auth/delete";
    Response response = await dio.post(url, data:model);
    return UserModel.fromJson(response.data);
  }

  //todo criar na api a rota de update das informações de usuários

}