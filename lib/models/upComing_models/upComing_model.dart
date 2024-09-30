class UpComingModel{
  int? id;
  String? posterPath;

  UpComingModel.fromJson(Map<String,dynamic> data){
    id=data['id'];
    posterPath=data['poster_path'];
  }
}