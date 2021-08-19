//@dart=2.9
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movie_watch_list/modules/movie_detail.dart';
import 'package:movie_watch_list/screens/edit_movie_screen.dart';
import 'package:movie_watch_list/screens/movie_detail_screen.dart';
//import 'package:movie_watch_list/screens/movie_detail.dart';
import 'package:movie_watch_list/services/movie_service.dart';

class MovieTile extends StatelessWidget {
  List<MovieDetail> movieList = List<MovieDetail>();
  Function deleteMovie;

  MovieTile(this.movieList, this.deleteMovie);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: movieList.isEmpty
          ? const Center(
              child: Text(
                'No Movies added yet!',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Raleway', fontSize: 30),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.60,
                child: ListView.builder(
                  //scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.black,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MovieDetailScreen(movieList[index])));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 150,
                                  width: 100.25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Image.network(movieList[index].poster),
                                ),
                                SizedBox(width: 30),
                                FittedBox(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        movieList[index].movieTitle,
                                        style: const TextStyle(
                                            fontSize: 30,
                                            height: 1.2,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                            fontFamily: 'Raleway'),
                                      ),
                                      Container(
                                        width: 150,
                                        child: Text(
                                          movieList[index].director,
                                          style: const TextStyle(
                                              fontSize: 25,
                                              height: 1.2,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontFamily: 'Raleway'),
                                        ),
                                      ),
                                      Text(
                                        movieList[index].watchDate,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            height: 1.2,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                            fontFamily: 'Raleway'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  color: Colors.grey,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditMovieScreen(
                                                    movieList[index])));
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  color: Colors.redAccent,
                                  onPressed: () {
                                    deleteMovie(movieList[index].movieTitle);
                                  },
                                ),
                              ],
                            )
                          ],
                          // ignore: missing_required_param
                        ),
                      ),
                    );
                  },
                  shrinkWrap: true,
                  itemCount: movieList.length,
                ),
              ),
            ),
    );
  }
}
