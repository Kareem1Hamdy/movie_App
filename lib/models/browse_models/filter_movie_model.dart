class FilterMovieModel{
  int? id;
  String? title;
  String? releaseDate;
  String? posterPath;
  List<int> genre_ids=[];

  FilterMovieModel.fromJson(Map<String,dynamic>data){
    id=data['id'];
    title=data['title'];
    releaseDate=data['release_date'];
    posterPath=data['poster_path'];
    data['genre_ids'].forEach((element){
      genre_ids.add(element);
    });
  }

}