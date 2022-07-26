import 'package:movie_app/data/ComingMovieModel.dart';
import 'package:movie_app/data/TopMoviesModel.dart';
import 'package:movie_app/data/webservices.dart';

import 'Results.dart';
import 'SearchModel.dart';

class MovieRepository {
  static Future<List<TopMoviesModel>> getTopMovies() async {
    final topMovies = await DioHelper.getTopMovies(apiKey: 'k_jbvlyl0w');
    return topMovies.map((movie) => TopMoviesModel.fromJson(movie)).toList();
  }

  static Future<List<BoxOfficeMovieModel>> getBoxOfficeMovies() async {
    final comingMovies = await DioHelper.getBoxOfficeMovies(apiKey: 'k_jbvlyl0w');
    return comingMovies.map((movie) => BoxOfficeMovieModel.fromJson(movie)).toList();
  }
  static Future<List<SearchModel>> getPredictedMovies(String expression) async {
    final PredictedMovies = await DioHelper.getPredictedMovies(
      expression:expression,
      apiKey: 'k_jbvlyl0w'
     );
    return PredictedMovies.map((movie) => SearchModel.fromJson(movie)).toList();
  }
}