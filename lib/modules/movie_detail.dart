//@dart=2.9
class MovieDetail {
  int id;
  String movieTitle;
  String watchDate;
  String director;
  String poster;
  String movieDetails;

  MovieDetailMap() {
    var mapping = Map<String, dynamic>();
    mapping['movieTitle'] = movieTitle;
    mapping['poster'] = poster;
    mapping['movieDetails'] = movieDetails;
    mapping['director'] = director;
    mapping['watchDate'] = watchDate;
    return mapping;
  }
}
