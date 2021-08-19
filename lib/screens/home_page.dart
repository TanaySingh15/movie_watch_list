//@dart=2.9
import 'package:flutter/material.dart';
import 'package:movie_watch_list/modules/movie_detail.dart';
import 'package:movie_watch_list/services/movie_service.dart';
import 'package:movie_watch_list/widgets/movie_tile.dart';
import 'package:movie_watch_list/widgets/profile_section.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: deprecated_member_use, prefer_collection_literals
  List<MovieDetail> movieList = List<MovieDetail>();
  var movieService = MovieService();

  @override
  void initState() {
    super.initState();
    _getAllCategories();
  }

  _getAllCategories() async {
    movieList = List<MovieDetail>();
    var categories = await movieService.readCategory();
    //print(categories);
    if (categories.length == 0) {
      setState(() {
        movieList = List<MovieDetail>();
        //print("Null Categpries");
      });
    } else {
      //print("THis is printint=g");
      categories.forEach((movie) {
        setState(() {
          var movieModel = MovieDetail();
          movieModel.movieTitle = movie['movieTitle'];
          movieModel.poster = movie['poster'];
          movieModel.director = movie['director'];
          movieModel.movieDetails = movie['movieDetails'];
          movieModel.watchDate = movie['watchDate'];
          movieList.add(movieModel);
        });
      });
    }
  }

  _deleteCategories(categoryId) async {
    var result = await movieService.deleteCategory(categoryId);
    print(result);
    if (result > 0) {
      _getAllCategories();
      //Navigator.pushReplacementNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
        style: ButtonStyle(),
        onPressed: () {
          Navigator.popAndPushNamed(context, '/edit-movies');
        },
        child: const SizedBox(
          height: 50,
          child: Center(
            child: Text(
              "Add Movies",
              style: TextStyle(fontSize: 20, fontFamily: 'Raleway'),
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          ProfileSection(size: size),
          MovieTile(movieList, _deleteCategories),
        ],
      ),
    );
  }
}
