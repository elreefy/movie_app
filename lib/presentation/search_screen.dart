import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/presentation/widgets/search_field_widget.dart';

import '../business_logic/movie_cubit.dart';
import '../constants/constants.dart';

class SearchScreen extends StatelessWidget {
  final dynamic expression;
  const SearchScreen({Key? key, required this.expression}) : super(key: key);

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
                    SearchFieldWidget(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                    isSearching: false,
                      cubit: cubit,
                    ),
                    const SizedBox(height: 24),
                    //list view for predicted list of movies vertical
                    if (state is PredictedMovieLoaded &&cubit.PredictedMoviesList.isNotEmpty)
                      Expanded(
                        child: ListView.builder(
                          itemCount: cubit.PredictedMoviesList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                  cubit.PredictedMoviesList[index].title ??
                                      'hi'),
                              subtitle: Text(
                                  cubit.PredictedMoviesList[index].title! ),
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          cubit.PredictedMoviesList[index]
                                              .image ??
                                              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Angelina_Jolie_2_June_2014_%28cropped%29.jpg/640px-Angelina_Jolie_2_June_2014_%28cropped%29.jpg",
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                              onTap: () {
                                //navigate to movie details screen
                                Navigator.pushNamed(
                                    context,
                                    '/movieDetails',
                                    arguments:
                                        cubit.PredictedMoviesList[index]
                                );
                              },
                            );
                          },
                        ),
                      ),

                    // ListView.builder(
                    //   shrinkWrap: true,
                    //   scrollDirection: Axis.vertical,
                    //   itemCount: cubit.PredictedMoviesList.length,
                    //   itemBuilder: (context, index) {
                    //     return InkWell(
                    //       onTap: () {
                    //         Navigator.of(context).pushNamed(
                    //             '/movieDetails',
                    //             arguments: cubit.PredictedMoviesList[index]
                    //         );
                    //       },
                    //       child: Stack(
                    //         children: [
                    //           Container(
                    //
                    //           ),
                    //           Container(
                    //             margin: EdgeInsets.all(20.0),
                    //             height: 160,
                    //             width: screenWidth*.3,
                    //             child: Image.network(
                    //               MovieCubit.get(context)
                    //                   .topMoviesList[index]
                    //                   .image,
                    //               height: 160,
                    //               width: 142,
                    //             ),
                    //           ),
                    //         ],
                    //
                    //       ),
                    //     );
                    //   },
                    // ),
                  ],
                )),
          ],
        ),
      ),

    );
  },
);
  }
}
