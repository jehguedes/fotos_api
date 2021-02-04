import 'dart:convert';
import 'package:fotos_api/models/albuns_model.dart';
import 'package:fotos_api/models/fotos_model.dart';
import 'package:http/http.dart' as http;

class PlaceholderService {
  final baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Album>> getAlbuns() async {
    var response = await http.get('$baseUrl/users/2/albums');
    if (response.statusCode == 200) {
      var objs = jsonDecode(response.body) as List;
      var album = objs.map((obj) => Album.fromJson(obj)).toList();
      return album;
    } else {
      throw Exception('Erro ao buscar Album, Cod: ${response.statusCode}');
    }
  }

  Future<List<Foto>> getFotos(int albumId) async {
    var response = await http.get('$baseUrl/albums/$albumId/photos');
    if (response.statusCode == 200) {
      var objs = jsonDecode(response.body) as List;
      var foto = objs.map((obj) => Foto.fromJson(obj)).toList();
      return foto;
    } else {
      throw Exception('Erro ao buscar post, Cod: ${response.statusCode}');
    }
  }
}
