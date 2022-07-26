part of 'movie_cubit.dart';

@immutable
abstract class MovieState {}

class MovieInitial extends MovieState {}
class MovieLoading extends MovieState {}
class PredictedMovieLoaded extends MovieState {
  final List<SearchModel> PredictedMoviesList;
  PredictedMovieLoaded(this.PredictedMoviesList);
}
class PredictedMovieLoading extends MovieState {}
class PredictedMovieError extends MovieState {
  final String error;
  PredictedMovieError(this.error);
}
class BoxOfficeMovieLoading extends MovieState {}
class BoxOfficeMovieLoaded extends MovieState {

}
class BoxOfficeMoviesError extends MovieState {
  final String error;
  BoxOfficeMoviesError(this.error);
}
class MovieLoaded extends MovieState {
  MovieLoaded(List<dynamic> topMovies);

}
class MovieError extends MovieState {
  MovieError(String string);
}
