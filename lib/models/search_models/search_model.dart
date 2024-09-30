class SearchMovieModel{
  int? id;
  String? title;
  String? releaseDate;
  String? posterPath;

  SearchMovieModel.fromJson(Map<String,dynamic>data){
    id=data['id'];
    title=data['title'];
    releaseDate=data['release_date'];
    posterPath=data['poster_path'];
  }

}