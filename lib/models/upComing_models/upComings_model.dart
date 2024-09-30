import 'package:movie_app/models/upComing_models/upComing_model.dart';

class UpComingsModel{
  List<UpComingModel> results=[];

  UpComingsModel.fromJson(Map<String,dynamic>data){
    data['results'].forEach((element) {
      results.add(UpComingModel.fromJson(element));
    }
    );
  }
}