import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:praktikum7/models/movie.dart';
//2031710159 Dikhi Achmad Dani

class HttpService {
  final String apikey = '25e550a7b77dadf28f484a434c7b1437';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<List?> getPopularMovies() async {
    final String uri = baseUrl + apikey;
    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      if (kDebugMode) {
        print("Sukses");
      }
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      if (kDebugMode) {
        print("Fail");
      }
      return null;
    }
  }
}
