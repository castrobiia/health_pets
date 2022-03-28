import 'dart:convert';
import 'package:health_pets/class/util.dart';
import 'package:health_pets/models/animal-model.dart';
import 'package:health_pets/models/especie-model.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print("Request");
    print('url: ${data.url}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print("Response");
    print('status code: ${data.statusCode}');
    print('url: ${data.url}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }
}

class RepositoryEspecie {
  Future<List<EspecieModel>> findAllEspecies() async {
    final Client client = InterceptedClient.build(
      interceptors: [
        LoggingInterceptor(),
      ],
    );

    const url = 'https://www.healthpets.app.br/api/especie';
    final response = await client.get(Uri.parse(url));
    var titulo = jsonDecode(response.body);

    //decodificando o json
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<EspecieModel> especies = [];

    print("TESTE RETURN ESPECIES");
    return decodedJson.map((json) => EspecieModel.fromJson(json)).toList();
  }
}

class RepositoryAnimal {
  Future<List<AnimalModel>> findAllAnimais() async {
    final Client client = InterceptedClient.build(
      interceptors: [
        LoggingInterceptor(),
      ],
    );

    print(Util.getPreferences('token'));

    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${Util.getPreferences('token')}"
    };

    const url = 'https://www.healthpets.app.br/api/animal';
    final response = await client.get(Uri.parse(url), headers: header);
    var titulo = jsonDecode(response.body);

    //decodificando o json
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<AnimalModel> animais = [];

    print("TESTE RETURN ANIMAL");
    return decodedJson.map((json) => AnimalModel.fromJson(json)).toList();
  }
}
