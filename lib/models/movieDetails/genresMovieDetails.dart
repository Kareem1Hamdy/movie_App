class GenresMovieDetailsModel{
  int? id;
  String? name;

  GenresMovieDetailsModel.fromJson(Map<String,dynamic>data){
    id=data['id'];
    name=data['name'];
  }
}