import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'movie.dart';

class HttpHelper {
  final String _apiKey = "27bcadec218596d009a17c5ffab8d387";
  final String _baseUrl = "https://api.themoviedb.org";

  Future<List?> getMoviesByCategory() async {
    var url = Uri.parse(_baseUrl + '/3/movie/now_playing?api_key=' + _apiKey);

    http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }

  searchMovies(String query) {}
}
