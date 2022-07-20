import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/business_logic/movie_cubit.dart';
import 'presentation/HomeScreen.dart';
import 'business_logic/BlocObserver.dart';
import 'data/webservices.dart';
import 'routiong.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  //initialize bloc observer
  BlocOverrides.runZoned(() => runApp(const MyApp())
      ,blocObserver: MyBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Multi Bloc Provider
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieCubit>(
          create: (context) => MovieCubit()
            ..getTopMovies()
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: RouteGenerator.generateRoute,
        home: HomeScreen(),
      ),
    );

  }
}
