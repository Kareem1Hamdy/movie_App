import 'package:movie_app/models/popular_models/popular_model.dart';

class PopularsModel{

  List<PopularModel> results=[];

  PopularsModel.fromJson(Map<String,dynamic>data){
   data['results'].forEach((element){
      results.add(PopularModel.fromJson(element));
   });
  }
}