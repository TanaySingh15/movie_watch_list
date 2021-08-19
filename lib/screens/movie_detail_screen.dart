// ignore_for_file: unnecessary_new

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_watch_list/modules/movie_detail.dart';
import 'package:movie_watch_list/screens/edit_movie_screen.dart';

class MovieDetailScreen extends StatelessWidget {
  var movieList = MovieDetail();

  MovieDetailScreen(this.movieList);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
        style: const ButtonStyle(),
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditMovieScreen(movieList)));
        },
        child: const SizedBox(
          height: 50,
          child: Center(
            child: Text(
              "Update Data",
              style: TextStyle(fontSize: 20, fontFamily: 'Raleway'),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, '/');
          },
          color: Colors.grey,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Card(
                elevation: 5,
                child: Hero(
                  tag: "Movie",
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.50,
                    width: MediaQuery.of(context).size.height * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(movieList.poster),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Center(
              child: FittedBox(
                child: Text(
                  movieList.movieTitle,
                  style: const TextStyle(
                      fontSize: 30,
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontFamily: 'Raleway'),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Text(
              "About",
              style: TextStyle(
                  fontSize: 20,
                  height: 1.2,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontFamily: 'Raleway'),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                movieList.movieDetails,
                maxLines: 20,
                style: const TextStyle(
                    fontSize: 15,
                    height: 1.2,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontFamily: 'Raleway'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromRGBO(255, 240, 240, 1),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Directed By",
                        style: TextStyle(
                            fontSize: 20,
                            height: 1.2,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontFamily: 'Raleway'),
                      ),
                      FittedBox(
                        child: Text(
                          movieList.director,
                          style: const TextStyle(
                              fontSize: 15,
                              height: 1.2,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontFamily: 'Raleway'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromRGBO(255, 240, 240, 1),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: const Icon(
                      Icons.calendar_today_rounded,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Watched On",
                        style: TextStyle(
                            fontSize: 20,
                            height: 1.2,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontFamily: 'Raleway'),
                      ),
                      FittedBox(
                        child: Text(
                          movieList.watchDate,
                          style: const TextStyle(
                              fontSize: 15,
                              height: 1.2,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontFamily: 'Raleway'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}


/*
ListView(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: size.height * 0.4 - 50,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(50)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://images-na.ssl-images-amazon.com/images/I/9101ShqfIqL.jpg'),
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.0)),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 10),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.network(
                        'https://images-na.ssl-images-amazon.com/images/I/9101ShqfIqL.jpg'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(.0),
                    child: Text(
                      "Dunkirk",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 10),
              child: Text(
                "Story Plot",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        
*/