
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/business_logic/movie_cubit.dart';
import '../../constants/constants.dart';

class SearchFieldWidget extends StatelessWidget {
 final bool isSearching;
 final MovieCubit cubit;

  const SearchFieldWidget({required this.padding, Key? key, required this.isSearching,  required this.cubit}) : super(key: key);

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Constants.kGreyColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 8),
            SvgPicture.asset(Constants.kIconSearch),
            const SizedBox(width: 8),
            if (isSearching)
               Expanded(
                child: TextField(
                  onTap: () {
                    Navigator.pushNamed(context, '/searchScreen');
                  },
                  style: TextStyle(
                    color: Constants.kWhiteColor.withOpacity(0.6),
                    letterSpacing: -0.41,
                    fontSize: 17,
                  ),
                  decoration: InputDecoration(
                      hintText: "search",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Constants.kWhiteColor.withOpacity(0.6),
                        fontSize: 17,
                        letterSpacing: -0.41,
                      )),
                ),
              ),
            if (!isSearching)
               Expanded(
                child: TextField(
                 onChanged: (expression){
                    cubit.getPredictedMovies(expression);
                 },
                  style: TextStyle(
                    color: Constants.kWhiteColor.withOpacity(0.6),
                    letterSpacing: -0.41,
                    fontSize: 17,
                  ),
                  decoration: InputDecoration(
                      hintText: "search",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Constants.kWhiteColor.withOpacity(0.6),
                        fontSize: 17,
                        letterSpacing: -0.41,
                      )),
                ),
              ),
            const SizedBox(width: 8),
            SvgPicture.asset(Constants.kIconMic),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
