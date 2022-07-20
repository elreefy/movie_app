
import 'package:movie_app/data/ComingMovieModel.dart';
import 'package:movie_app/data/TopMoviesModel.dart';
import 'package:movie_app/data/webservices.dart';

class MovieRepository {
  static Future<List<TopMoviesModel>> getTopMovies() async {
    final topMovies = await DioHelper.getTopMovies(apiKey: 'k_jbvlyl0w');
    return topMovies.map((movie) => TopMoviesModel.fromJson(movie)).toList();
  }

  static Future<List<ComingMovieModel>> getComingMovies(String charName) async {
    final comingMovies = await DioHelper.getComingMovies(apiKey: 'k_jbvlyl0w');
    return comingMovies.map((movie) => ComingMovieModel.fromJson(movie)).toList();
  }
}