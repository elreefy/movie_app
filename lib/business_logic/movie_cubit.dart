import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/data/ComingMovieModel.dart';
import 'package:movie_app/data/reository.dart';
import '../data/Results.dart';
import '../data/SearchModel.dart';
import '../data/TopMoviesModel.dart';
part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());
  static MovieCubit get(context) => BlocProvider.of(context);

    List<TopMoviesModel> topMoviesList = [];
    List<SearchModel> PredictedMoviesList = [];

    List<BoxOfficeMovieModel> boxOfficeMoviesList = [];

  Future<void> getPredictedMovies(String expression) async {
    emit(PredictedMovieLoading());
    try {
      PredictedMoviesList =
      await MovieRepository.getPredictedMovies(
        expression
      );

      print (PredictedMoviesList[0].title);
      print ('dh ya kbeeer il predicted\n\n\n\n\n\n');
      print (PredictedMoviesList[1].image);

      emit(PredictedMovieLoaded(
        PredictedMoviesList,
      ));
    } catch (e) {
      emit(PredictedMovieError(e.toString()));
      print(e.toString());
    }
  }

  Future<void> getTopMovies() async {
    emit(MovieLoading());
    try {
      topMoviesList = await MovieRepository.getTopMovies();
      print (topMoviesList[0].year);
      emit(MovieLoaded(topMoviesList));
    } catch (e) {
      emit(MovieError(e.toString()));
      print(e.toString());
    }
  }
  //fet comming movies list from repository ant put it in CommingMoviesList
  Future<void> getBoOfficeMovies() async {
    emit(BoxOfficeMovieLoading());
    try {
      boxOfficeMoviesList = await MovieRepository.getBoxOfficeMovies();
      print (boxOfficeMoviesList[0].title);
      print (boxOfficeMoviesList[4].image);
      emit(BoxOfficeMovieLoaded());
    } catch (e) {
      emit(BoxOfficeMoviesError(e.toString()));
      print('FEEEEEEEH ERRRRROR EL72OOOONA '
          '\n'
          '\n'+e.toString());
    }
  }
  TopMoviesModel? topMoviesModel;
  BoxOfficeMovieModel? boxOfficeMovieModel;
  }


