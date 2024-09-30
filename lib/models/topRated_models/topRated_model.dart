class TopRatedModel{
  int? id;
  String? posterPath;
  String? title;
  double? rate;
  String? releaseDate;

  TopRatedModel.fromJson(Map<String,dynamic>data){
    id=data['id'];
    posterPath=data['poster_path'];
    title=data['title'];
    rate=data['vote_average'];
    releaseDate=data['release_date'];
}
}