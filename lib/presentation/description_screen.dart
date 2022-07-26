import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/business_logic/movie_cubit.dart';
import 'package:movie_app/constants/constants.dart';

import '../data/movie.dart';

class MovieDetails extends StatelessWidget {
  final dynamic movie;

  const MovieDetails({Key? key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return BlocConsumer<MovieCubit, MovieState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
          // floatingActionButton: FloatingActionButton(
          //   backgroundColor: Colors.transparent,
          //   onPressed: () {
          //   },
          //   child:
          //   SvgPicture.asset(Constants.kIconMenu,),
          // ),
          body: SafeArea(
            child: SizedBox(
              height: height,
              width: width,
              child: Stack(

                children: [

                  SizedBox(
                    height: height * .5,
                    width: double.infinity,
                    child: Image.network(
                      movie.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21.0
                        , vertical: 20.0
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Constants.kGreyColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Constants.kWhiteColor, width: 3),
                            ),
                            child: InkWell(
                              onTap: (() => Navigator.of(context).pop()),
                              child: SvgPicture.asset(Constants.kIconBack),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Constants.kGreyColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Constants.kWhiteColor, width: 3),
                            ),
                            child: InkWell(
                              child: SvgPicture.asset(Constants.kIconMenu),
                            ),
                          ),
                        ]),
                  ),
                  Positioned(
                    top: height * 0.32,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.only(top: height * 0.1),
                      height: height * 0.65,
                      width: width,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            stops: [0, 0.15, 0.9],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              //   Constants.kBlackColor,
                              Constants.kBlackColor,
                              Constants.kBlackColor,
                            ]),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Constants.kWhiteColor,
                                fontSize: 28),
                          ),
                          const SizedBox(height: 10),

                          Text(
                            movie.title+' ' + '2009',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Constants.kGreyColor,
                                fontSize: 15),
                          ),

                          const SizedBox(height: 10),
                          // RatingBarIndicator(
                          //   unratedColor: Constants.kGreyColor,
                          //   itemCount: 5,
                          //   itemSize: 25,
                          //   rating: MovieRating,
                          //   itemBuilder: ((context, _) => const Icon(
                          //     Icons.star,
                          //     color: Constants.kYellowColor,
                          //   )),
                          // ),
                          const SizedBox(height: 10),
                          Container(
                            width: width * 0.8,
                            child: Text(
                              ' The Dark Knight is a 2008 superhero film \n'
                                  ' directed by Christopher Nolan from a screenplay \n'
                                  ' he co-wrote with his brother Jonathan. \n '
                                  'Based on the DC Comics superhero Batman',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Constants.kWhiteColor.withOpacity(
                                      0.8)),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Divider(
                            indent: 20,
                            endIndent: 20,
                            thickness: 2,
                            color: Constants.kGreyColor,
                          ),
                          const SizedBox(height: 10),

                          Container(
                            margin: const EdgeInsets.only(left: 12),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Cast",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Constants.kWhiteColor,
                                  fontSize: 28),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //['Ben Schwartz', 'Idris Elba', 'Colleen O\'Shaughnessey'],
                                CastM(screenWidth: width,
                                  actorName: 'Amber Heard',
                                  image:
                                  "https://m.media-amazon.com/images/M/MV5BMjA4NDkyODA3M15BMl5BanBnXkFtZTgwMzUzMjYzNzM@._V1_.jpg",
                                ),
                                CastM(
                                  screenWidth: width,
                                  actorName: 'Jeffrey Wright',
                                  image:
                                  "https://voi.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fprismamedia_people.2F2017.2F06.2F30.2F9094a4c6-e9a7-4fc8-9534-9c52607e0455.2Ejpeg/2048x1536/quality/80/zoe-kravitz.jpeg",

                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 20,
                              left: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CastM(
                                  screenWidth: width,
                                  image: "https://m.media-amazon.com/images/M/MV5BMjE2ODEzZDktYjUxNS00MjVhLTk2ZDMtYTY1ODE2NzRiOWE2XkEyXkFqcGdeQXVyMjIzNTk0NTY@._V1_.jpg",
                                  actorName: 'Colleen O\'Shaughnessey',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: width * 0.8,
                    top: height * 0.30,
                    child: newMethod(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Stack CastM({required double screenWidth, actorName, image,}) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          padding: const EdgeInsets.all(2.0),
          height: 50,
          width: screenWidth * 0.4,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Constants.kWhiteColor.withOpacity(0.7),
                    Constants.kGreyColor,
                    Constants.kGreyColor.withOpacity(0.2),
                  ]),
              borderRadius: BorderRadius.circular(30)),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 70),
            height: 45,
            width: screenWidth * 0.35,
            decoration: BoxDecoration(
                color: Constants.kGreyColor,
                borderRadius: BorderRadius.circular(30)),
            child: Text(
              actorName,
              style: const TextStyle(
                  color: Constants.kWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ),
        CircleAvatar(
          radius: 30,
          backgroundColor: Constants.kBlackColor,
          backgroundImage: NetworkImage(image),
        )
      ],
    );
  }

//Button
  Stack newMethod() {
    return Stack(
      alignment: Alignment.center,
      children: [
      Container(
      width: 70,
      height: 70,
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
    width: 65,
    height:65,
    decoration: const BoxDecoration(
    shape: BoxShape.circle, color: Constants.kGreyColor),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SvgPicture.asset(
      Constants.kIconPlay,
      fit: BoxFit.cover,
        width: 25,
        height: 25,
      ),
    ),
    ),
    ],
    );
  }
}