import 'package:movie_app/models/movieDetails/similar_model.dart';

class SimilarsModel{
  List<SimilarModel> results=[];

  SimilarsModel.fromJson(Map<String,dynamic>data){
    data['results'].forEach((element){
      results.add(SimilarModel.fromJson(element));
    });
  }
}