import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/presentation/widgets/masked.dart';
import 'package:movie_app/presentation/widgets/search_field_widget.dart';
import '../business_logic/movie_cubit.dart';
import '../constants/constants.dart';
import '../data/TopMoviesModel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = MovieCubit.get(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<MovieCubit, MovieState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        //build movie list
        //   return buildMovieList(state.movies);
        return Scaffold(
          backgroundColor: Constants.kBlackColor,
          extendBody: true,
          body: SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: -100,
                  left: -100,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constants.kGreenColor.withOpacity(0.5)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                      child: Container(
                        height: 200,
                        width: 200,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * .4,
                  right: -100,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constants.kPinkColor.withOpacity(0.5)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                      child: Container(
                        height: 200,
                        width: 200,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * .8,
                  left: -100,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constants.kCyanColor.withOpacity(0.5)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                      child: Container(
                        height: 200,
                        width: 200,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                SafeArea(
                    bottom: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        Center(
                          child: const Text(
                            'What would you\nlike to watch?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Constants.kWhiteColor),
                          ),
                        ),
                        const SizedBox(height: 15),
                        SearchFieldWidget(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                          cubit: cubit,
                          isSearching: true,
                        ),
                        const SizedBox(height: 24),
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                          child: Text(
                            "Top movies",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Constants.kWhiteColor),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          height: 160,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: cubit.topMoviesList.length,
                            itemBuilder: (context, index) {
                              String mask;
                              if (index == 0) {
                                mask = Constants.kMaskFirstIndex;
                              } else if (index ==
                                  cubit.topMoviesList.length - 1) {
                                mask = Constants.kMaskLastIndex;
                              } else {
                                mask = Constants.kMaskCenter;
                              }
                              return InkWell(
                                onTap: () {
                                  //hide status Bar and navigation Bar using setEnabled
                                  //
                                  SystemChrome.setEnabledSystemUIMode(
                                      SystemUiMode.immersiveSticky,
                                  );

                                  Navigator.of(context).pushNamed(
                                      '/movieDetails',
                                       arguments: cubit.topMoviesList[index]
                                  );

                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: index == 0 ? 20.0 : 0.0),
                                  height: 160,
                                  width: 142,
                                  child: Image.network(
                                    MovieCubit.get(context)
                                        .topMoviesList[index]
                                        .image,
                                    height: 160,
                                    width: 142,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                          child: Text(
                            "BoxOffice",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Constants.kWhiteColor),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          height: 160,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: cubit.boxOfficeMoviesList.length,
                            itemBuilder: (context, index) {
                              String mask;
                              if (index == 0) {
                                mask = Constants.kMaskFirstIndex;
                              } else if (index ==
                                  cubit.boxOfficeMoviesList.length - 1) {
                                mask = Constants.kMaskLastIndex;
                              } else {
                                mask = Constants.kMaskCenter;
                              }
                              return InkWell(
                                onTap: () {
                                  SystemChrome.setEnabledSystemUIMode(
                                    SystemUiMode.immersiveSticky,
                                  );
                                  Navigator.of(context).pushNamed(
                                      '/movieDetails',
                                      arguments:
                                      cubit.boxOfficeMoviesList[index]
                                  );
                                  },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: index == 0 ? 20.0 : 0.0),
                                  height: 160,
                                  width: 142,
                                  child: Image.network(
                                    MovieCubit.get(context)
                                        .boxOfficeMoviesList[index]
                                        .image,
                                    height: 160,
                                    width: 142,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: newMethod(),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            height: screenHeight * 0.1,
            color: Constants.kGreyColor.withOpacity(0.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(Constants.kIconHome),
                SvgPicture.asset(Constants.kIconPlayOnTv),
                SvgPicture.asset(Constants.kIconCategories),
                SvgPicture.asset(Constants.kIconDownload),
              ],
            ),
          ),
        );

        //    return Scaffold(
        //      backgroundColor: Constants.kBlackColor,
        //      body: Column(
        //        children: <Widget>[
        //           Padding(
        //             padding: const EdgeInsets.all(40.0),
        //             child: const Text('What would you\n like to watch?',
        //                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,
        //                    color: Colors.white)),
        //           ),
        //          buildFloatingSearchBar(context),
        //          SizedBox(height: 20),
        //          SizedBox(
        //            height: 160,
        //            child: ListView.builder(
        //              shrinkWrap: true,
        //              scrollDirection: Axis.horizontal,
        //              itemCount: 10,
        //              itemBuilder: (context, index) {
        //                String mask;
        //                if (index == 0) {
        //                  mask = Constants.kMaskFirstIndex;
        //                } else if (9 == index) {
        //                  mask = Constants.kMaskLastIndex;
        //                } else {
        //                  mask = Constants.kMaskCenter;
        //                }
        //                return InkWell(
        //                  onTap: () {
        //              //      Navigator.of(context).pushNamed('/MovieDetails',
        //              //          arguments: {'id': index, 'New': true});
        //                  },
        //                  child: Container(
        //                    margin: EdgeInsets.only(
        //                        left: index == 0 ? 20.0 : 0.0),
        //                    height: 160,
        //                    width: 142,
        //                    //image from internet
        //                    child: Image.network(
        //                      MovieCubit.get(context).topMoviesList[index].image,
        //                      height: 160,
        //                      width: 142,
        //                    ),
        //                  )
        //                );
        //              },
        //            ),
        //          ),
        //          const SizedBox(
        //            height: 20.0,
        //          ),
        //          Padding(
        //            padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
        //            child: Row(
        //              mainAxisAlignment: MainAxisAlignment.start,
        //              children: [
        //                Text(
        //                  "Upcoming movies",
        //                  style: TextStyle(
        //                      fontSize: 17,
        //                      fontWeight: FontWeight.bold,
        //                      color: Constants.kWhiteColor),
        //                ),
        //              ],
        //            ),
        //          ),
        //          const SizedBox(
        //            height: 37.0,
        //          ),
        //          SizedBox(
        //            height: 180,
        //            child: ListView.builder(
        //              shrinkWrap: true,
        //              scrollDirection: Axis.horizontal,
        //              itemCount: 10,
        //              itemBuilder: (context, index) {
        //                String mask;
        //                if (index == 0) {
        //                  mask = Constants.kMaskFirstIndex;
        //                }//todo: else if
        //                else if (9 == index) {
        //                  mask = Constants.kMaskLastIndex;
        //                } else {
        //                  mask = Constants.kMaskCenter;
        //                }
        //                return InkWell(
        //                    onTap: () {
        //                      //      Navigator.of(context).pushNamed('/MovieDetails',
        //                      //          arguments: {'id': index, 'New': true});
        //                    },
        //                    child:Container(
        //                      margin: EdgeInsets.only(
        //                          left: index == 0 ? 20.0 : 0.0),
        //                      height: 160,
        //                      width: 142,
        //                      //image from internet
        //                      child: Image.network(
        //                        MovieCubit.get(context).boxOfficeMoviesList[index].image,
        //                        height: 160,
        //                        width: 142,
        //                      ),
        //                    ),
        //                );
        //              },
        //            ),
        //          ),
        //          const SizedBox(
        //            height: 16,
        //          ),
        //        //  buildMovieList(MovieCubit.get(context).topMoviesList,context),
        //
        //        ],
        //      ),
        //    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        //    floatingActionButton: newMethod(),
        //      bottomNavigationBar: Container(
        //        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        //        //.2 of the height of the screan
        //
        //          height: screenHeight * 0.1,
        //        color: Constants.kGreyColor.withOpacity(0.2),
        //        child: Row(
        //          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //          crossAxisAlignment: CrossAxisAlignment.start,
        //          children: [
        //            SvgPicture.asset(Constants.kIconHome),
        //            SvgPicture.asset(Constants.kIconPlayOnTv),
        //            SvgPicture.asset(Constants.kIconCategories),
        //            SvgPicture.asset(Constants.kIconDownload),
        //          ],
        //        ),
        //      ),
        //    );
      },
    );
  }

  //TODO: implement buildMovieList
  buildMovieList(List<TopMoviesModel> movies, context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return buildMovieItem(movies[index]);
        },
      ),
    );
  }

  buildMovieItem(TopMoviesModel movie) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('ttyhty'
              //   movie.items[0].year,
              //    style: TextStyle(fontSize: 20),
              ),
          Text(
            'hiiiiiii',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  buildFloatingSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        //  margin: EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //search icon
            Icon(
              Icons.search,
              color: Colors.white,
            ),
            Expanded(
              child: CupertinoTextField(
                placeholder: 'Search',
                onChanged: (value) {
                  //          MovieCubit.get(context).searchMovies(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack newMethod() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              Constants.kPinkColor,
              Constants.kGreenColor,
            ]),
          ),
          child: null,
        ),
        Container(
          width: 58,
          height: 58,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Constants.kGreyColor),
          child: Container(
            alignment: Alignment.center,
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [
                Constants.kPinkColor.withOpacity(0.2),
                Constants.kGreenColor.withOpacity(0.2),
              ]),
            ),
            child: SvgPicture.asset(Constants.kIconPlus),
          ),
        ),
      ],
    );
  }
}
