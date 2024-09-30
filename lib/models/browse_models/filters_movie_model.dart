import 'package:movie_app/models/browse_models/filter_movie_model.dart';

class FiltersMovieModel{
  List<FilterMovieModel> results=[];

  FiltersMovieModel.fromJson(Map<String,dynamic> data){
    data['results'].forEach((element){
      results.add(FilterMovieModel.fromJson(element));
    });
  }
}