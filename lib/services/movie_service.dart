//@dart=2.9
import '../modules/movie_detail.dart';
import '../repositories/repository.dart';

class MovieService {
  Repository _repository;

  MovieService() {
    _repository = Repository();
  }

  //Insert Data
  saveCategory(MovieDetail movie) async {
    return await _repository.insertData('details', movie.MovieDetailMap());
  }

  countEntries() async {
    return await _repository.countEntries('details');
  }

  readCategory() async {
    return await _repository.readData('details');
  }

  deleteCategory(categoryId) async {
    return await _repository.deleteData('details', categoryId);
  }

  updateCategory(MovieDetail movieDetail) async {
    return await _repository.updateData(
        'details', movieDetail.MovieDetailMap());
  }

  hasCategory(String id) async {
    return await _repository.findById('details', id);
  }
}
