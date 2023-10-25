import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieapp_170755/common/Constants.dart';
import 'package:movieapp_170755/model/Media.dart';

class HttpHandler {
  static final _httHandler = new HttpHandler();
  final String _baseUrl = "api.themoviedb.org"; // Define la URL base de la API.
  final String _language =
      "es-MX"; // Define el lenguaje deseado para las respuestas.

  static HttpHandler get() {
    return _httHandler;
  }

  // Define una función asincrónica para obtener datos JSON desde una URI.
  Future<dynamic> getJson(Uri uri) async {
    http.Response response =
        await http.get(uri); // Realiza una solicitud GET HTTP.
    return json.decode(response.body); // Decodifica la respuesta JSON.
  }

  Future<List<Media>> fetchMovies({String category = "populares"}) async {
    var uri = new Uri.https(
      _baseUrl,
      "3/movie/$category",
      {
        'api_key': API_KEY,
        'page': "1",
        'language': _language,
      },
    );

    return getJson(uri).then((data) {
      if (category == "upcoming") {
        var sortedResults = data['results']
            .where((item) => item['release_date'] != null)
            .toList()
          ..sort((a, b) {
            DateTime dateA = DateTime.parse(a['release_date']);
            DateTime dateB = DateTime.parse(b['release_date']);
            return dateB.compareTo(dateA);
          });

        return sortedResults
            .map<Media>((item) => new Media(item, MediaType.movie))
            .toList();
      } else {
        return data['results']
            .map<Media>((item) => new Media(item, MediaType.movie))
            .toList();
      }
    });
  }

  Future<List<Media>> fetchShow({String category = "populares"}) async {
    var uri = new Uri.https(_baseUrl, "3/tv/$category", {
      'api_key': API_KEY,
      'page': "1",
      'language': _language
    }); // Parámetros de la solicitud.
    // Llama a la función getJson para obtener datos y mapearlos en objetos de tipo Media.
    return getJson(uri).then(((data) => data['results']
        .map<Media>((item) => new Media(item, MediaType.show))
        .toList()));
  }
}
