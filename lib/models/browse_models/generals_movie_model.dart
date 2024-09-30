import 'package:movie_app/models/browse_models/general_movie_model.dart';

class GeneralsMovieModel{
   List<GeneralMovieModel> genres=[];

  GeneralsMovieModel.fromJson(Map<String,dynamic>data){
    data['genres'].forEach((element){
      genres.add(GeneralMovieModel.fromJson(element));
    });
  }
}