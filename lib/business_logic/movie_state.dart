part of 'movie_cubit.dart';

@immutable
abstract class MovieState {}

class MovieInitial extends MovieState {}
class MovieLoading extends MovieState {}
class CommingMovieLoading extends MovieState {}
class CommingMovieLoaded extends MovieState {
  CommingMovieLoaded(ComingMovieModel comingMovieModel);

}
class CommingMoviesError extends MovieState {
  final String error;
  CommingMoviesError(this.error);
}
class MovieLoaded extends MovieState {
  MovieLoaded(List<dynamic> topMovies);

}
class MovieError extends MovieState {
  MovieError(String string);
}
