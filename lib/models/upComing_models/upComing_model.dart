class UpComingModel{
  int? id;
  String? posterPath;
  String? title;
  String? releaseDate;

  UpComingModel.fromJson(Map<String,dynamic> data){
    id=data['id'];
    posterPath=data['poster_path'];
    title=data['title'];
    releaseDate=data['release_date'];
  }
}