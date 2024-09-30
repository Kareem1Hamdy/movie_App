class SimilarModel{
  int? id;
  String? posterPath;
  String? releaseDate;
  String? title;
  double? rate;

  SimilarModel.fromJson(Map<String,dynamic>data){
    id=data['id'];
    posterPath=data['poster_path'];
    releaseDate=data['release_date'];
    title=data['title'];
    rate=data['vote_average'];
  }
}