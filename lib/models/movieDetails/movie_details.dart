import 'package:movie_app/models/movieDetails/genresMovieDetails.dart';

class MovieDetailsModel{
  int? id;
  String? title;
  String? posterPath;
  String? backdropPath;
  String? releaseDate;
  String? overView;
  double? rate;
  List<GenresMovieDetailsModel> genres=[];

  MovieDetailsModel.fromJson(Map<String,dynamic>data){
    id=data['id'];
    title=data['title'];
    posterPath=data['poster_path'];
    backdropPath=data['backdrop_path'];
    releaseDate=data['release_date'];
    overView=data['overview'];
    rate=data['vote_average'];
    data['genres'].forEach((element){
      genres.add(GenresMovieDetailsModel.fromJson(element));
    });
  }
}