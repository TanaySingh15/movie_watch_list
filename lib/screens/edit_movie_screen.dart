//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_watch_list/modules/movie_detail.dart';
import 'package:movie_watch_list/services/movie_service.dart';
import 'package:movie_watch_list/widgets/movie_tile.dart';

class EditMovieScreen extends StatefulWidget {
  var movieList = MovieDetail();
  EditMovieScreen(this.movieList);
  @override
  _EditMovieScreen createState() => _EditMovieScreen(movieList);
}

class _EditMovieScreen extends State<EditMovieScreen> {
  DateTime _selectedDate;
  var movieTitle = TextEditingController();
  var poster = TextEditingController();
  var synopsis = TextEditingController();
  var director = TextEditingController();
  var movieList = MovieDetail();
  _EditMovieScreen(this.movieList);
  var movieDetail = MovieDetail();
  var movieService = MovieService();

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _presentData();
  }

  void _presentData() {
    movieTitle.text = movieList.movieTitle;
    poster.text = movieList.poster;
    _selectedDate = null;
    director.text = movieList.director;
    synopsis.text = movieList.movieDetails;
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('...');
  }

  _showSuccessSnackBar(message) {
    var _snackBar = SnackBar(content: Text(message));
    // ignore: deprecated_member_use
    _globalKey.currentState.showSnackBar(_snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
        style: const ButtonStyle(),
        onPressed: () async {
          print(movieList.watchDate);
          movieDetail.movieTitle = movieTitle.text;
          movieDetail.poster = poster.text;
          movieDetail.movieDetails = synopsis.text;
          movieDetail.director = director.text;
          movieDetail.watchDate = _selectedDate == null
              ? movieList.watchDate
              : DateFormat.yMd().format(_selectedDate).toString();
          var result = await movieService.updateCategory(movieDetail);
          Navigator.popAndPushNamed(context, '/');
        },
        child: const SizedBox(
          height: 50,
          child: Center(
            child: Text(
              "Update",
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
            Navigator.pop(context);
          },
          color: Colors.grey,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            const Text(
              "Update Your Data",
              style: TextStyle(
                  fontSize: 50,
                  height: 1.2,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontFamily: 'Raleway'),
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: movieTitle,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontFamily: 'Raleway',
              ),
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                hintText: "Movie Title",
                hintStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: poster,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontFamily: 'Raleway',
              ),
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                hintText: "Movie Poster url",
                hintStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: director,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontFamily: 'Raleway',
              ),
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                hintText: "Director Name",
                hintStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromRGBO(255, 240, 240, 1)),
                    padding: const EdgeInsets.all(16),
                    child: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      color: Colors.redAccent,
                      onPressed: () {
                        _presentDatePicker();
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    _selectedDate == null
                        ? 'Picked Date: ${movieList.watchDate}'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                    style: const TextStyle(
                        fontSize: 18,
                        height: 1.2,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                        fontFamily: 'Raleway'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontFamily: 'Raleway',
              ),
              controller: synopsis,
              maxLines: 8,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                hintText: 'Synopsis',
                hintStyle: TextStyle(color: Colors.white70, fontSize: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
