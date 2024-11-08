import 'package:movies_app/constants/strings.dart';
import 'package:dio/dio.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('/character');
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
      throw Exception('Failed to load all characters');
    }
  }

  Future<dynamic> getCharacterById(int id) async {
    try {
      Response response = await dio.get('/character/$id');
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
      throw Exception('Failed to load this character');
    }
  }
}