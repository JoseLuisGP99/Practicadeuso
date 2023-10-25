import 'dart:async';
import 'package:movieapp_170755/model/Media.dart';
import 'package:movieapp_170755/common/HttpHandler.dart';

abstract class MediaProvider {
  Future<List<Media>> fetchMedia(String category);
}

class MediaPrvider extends MediaProvider {
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia(String category) {
    return _client.fetchMovies(category: category);
  }
}

class ShowProvider extends MediaProvider {
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia(String category) {
    return _client.fetchShow(category: category);
  }
}
