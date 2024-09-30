import 'package:movie_app/models/topRated_models/topRated_model.dart';

class TopRatedsModel{
  List<TopRatedModel> results=[];

  TopRatedsModel.fromJson(Map<String,dynamic>data){
    data['results'].forEach((element){
      results.add(TopRatedModel.fromJson(element));
    });
  }
}