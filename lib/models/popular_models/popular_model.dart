class PopularModel{
  int? id;
  String? posterPath;

  PopularModel.fromJson(Map<String,dynamic>data){
    id=data['id'];
    posterPath=data['poster_path'];
  }
}