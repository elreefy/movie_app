import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/data/ComingMovieModel.dart';
import 'package:movie_app/data/reository.dart';

import '../data/TopMoviesModel.dart';
import '../data/webservices.dart';
part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());
  static MovieCubit get(context) => BlocProvider.of(context);

    List<TopMoviesModel> topMoviesList = [];
    List<ComingMovieModel> CommingMoviesList = [];

 //get top movies from api and save it in topMoviesModel using dio instance

  // Future<void> getTopMovies() async {
  //     emit(MovieLoading());
  //   try {
  //     topMovies = await MovieRepository.getTopMovies();
  //     emit(MovieLoaded(topMovies));
  //   } catch (e) {
  //     emit(MovieError(e.toString()));
  //    print(e.toString());
  //
  //   }
  // }
  // get top movies from api and save it in list of topMoviesModel using dio instance
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
  TopMoviesModel? topMoviesModel;
  // Future<void> getTopMovies() async {
  //     emit(MovieLoading());
  //     MovieRepository.getTopMovies().then((json) {
  //       topMoviesList = json;
  //        //  topMoviesList = json.map((movie) => TopMoviesModel.fromJson(movie)).toList();
  //         print('topMoviesList AH DEH EL LIST'
  //             ' $topMoviesList'
  //             '\n'
  //             '\n'
  //             '\n');
  //    //      topMoviesModel = TopMoviesModel.fromJson(json);
  //     //     print(topMoviesModel!.items[0].title);
  //          emit(MovieLoaded(topMoviesList));
  // }).catchError((e) {
  //   emit(MovieError(e.toString()));
  //   print(e.toString());
  // });
  // }
  ComingMovieModel? comingMovieModel;
  Future<void> getCommingMovies() async {
    emit(CommingMovieLoading());

    DioHelper.getComingMovies(apiKey: 'k_jbvlyl0w').then((value) {
      comingMovieModel = ComingMovieModel.fromJson(value);
         print(comingMovieModel!.items![0].title);
         print(comingMovieModel!.items![0].directorList![0].name);
         print(comingMovieModel!.items![0].year);
        emit(CommingMovieLoaded(comingMovieModel!));
      }).catchError((error) {
        emit(CommingMoviesError(error.toString()));
        print(error.toString());
      });

  }
  // PlacesModel? searchResults;
  // List placeDescription= [];
  // void search(String query,String sessionToken) async {
  //   emit(SearchLoading());
  //   DioHelper.getData(input: query
  //       ,sessiontoken: sessionToken).then((json) {
  //     searchResults = PlacesModel.fromJson(json);
  //     print('placesModel description: ${searchResults!.predictions![0].description}');
  //     print('place id : ${searchResults!.predictions![0].placeId}');
  //     searchResults!.predictions!.forEach((element) {
  //       placeDescription[element.hashCode] = element.description;
  //       //       productsQuantity[element.product.id] = element.quantity;
  //     }
  //     );
  //     //  cartItemsIds.addAll(productCartIds.values);
  //     emit(SearchLoaded(searchResults!));
  //     //  getQuantities();
  //   }).catchError((error) {
  //     print('GET placeeees Data ERROR');
  //     print(error.toString());
  //     emit(SearchLoaded(searchResults!));
  //     // emit(ShopErrorCartDataState(error));
  //   });
  }


