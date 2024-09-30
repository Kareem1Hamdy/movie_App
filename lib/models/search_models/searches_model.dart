import 'package:movie_app/models/search_models/search_model.dart';

class SearchesModel{
  List<SearchMovieModel> results=[];

  SearchesModel.fromJson(Map<String,dynamic>data){
    data['results'].forEach((element){
      results.add(SearchMovieModel.fromJson(element));
    });
  }
}