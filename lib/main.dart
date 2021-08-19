//@dart=2.9
import 'package:flutter/material.dart';
import 'package:movie_watch_list/modules/movie_detail.dart';
import 'package:movie_watch_list/screens/edit_movie.dart';
import 'package:movie_watch_list/screens/edit_movie_screen.dart';
import 'package:movie_watch_list/screens/home_page.dart';
import 'package:movie_watch_list/screens/movie_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  var object = MovieDetail();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color.fromRGBO(57, 62, 70, 0),
      ),
      routes: {
        '/': (context) => HomePage(),
        '/edit-movies': (context) => EditMovie(),
        '/display-content': (context) => MovieDetailScreen(object),
        '/update-data': (context) => EditMovieScreen(object),
      },
    );
  }
}
