
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/Api/api_manager.dart';
import 'package:movie_app/models/browse_models/filters_movie_model.dart';
import 'package:movie_app/models/browse_models/generals_movie_model.dart';
import 'package:movie_app/models/movieDetails/movie_details.dart';
import 'package:movie_app/models/movieDetails/similars_model.dart';
import 'package:movie_app/models/popular_models/populars_model.dart';
import 'package:movie_app/models/search_models/searches_model.dart';
import 'package:movie_app/models/topRated_models/topRateds_model.dart';
import 'package:movie_app/models/upComing_models/upComings_model.dart';

class AppProvider extends ChangeNotifier{
  int currentIndex=0;
  changeItemOnBottomNavBar(index){
    currentIndex=index;
    notifyListeners();
  }

  PopularsModel? popularsModel;
  UpComingsModel? upComingsModel;
  TopRatedsModel? topRatedsModel;
  GeneralsMovieModel? generalsMovieModel;
  MovieDetailsModel? movieDetailsModel;
  SimilarsModel? similarsModel;
  FiltersMovieModel? filtersMovieModel;
  SearchesModel? searchesModel;


   getPopular()async{
   try{
     var response= await ApiManager.getApi(endPoint: EndPoints.popular, authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZWRjZDU5M2U4ZmVhYTliZGQ2YjA0M2QwYzRkZDhlNyIsIm5iZiI6MTcyNzEyMTM0NS44NDc1OCwic3ViIjoiNjZmMGE2YjNjMjM3MjU4ZTRjMjY2YWM4Iiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.9OZDHoHMbKOKCBJAeo2LuH6scej5Ocen8ek5_MsD_HE');
     var data=jsonDecode(response.body);
     popularsModel= PopularsModel.fromJson(data);
     notifyListeners();
     //print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk${data['page']}');
   }
   catch(e){
     print('errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrror${e}');
   }
  }
   getupComing()async{
    try{
      var response= await ApiManager.getApi(endPoint: EndPoints.upComing, authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZWRjZDU5M2U4ZmVhYTliZGQ2YjA0M2QwYzRkZDhlNyIsIm5iZiI6MTcyNzEyMzU3NS43NDY2MTgsInN1YiI6IjY2ZjBhNmIzYzIzNzI1OGU0YzI2NmFjOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qxL81RgrInS1ZWLJTnBL5zlCuvLzTJw7Fp-ksVDnQ4o');
      var data=jsonDecode(response.body);
      upComingsModel= UpComingsModel.fromJson(data);
      notifyListeners();
      print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr${upComingsModel?.results[4].id}');
    }
    catch(e){
      print('errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrror${e}');
    }
  }
   gettopRated()async{
    try{
      var response= await ApiManager.getApi(endPoint: EndPoints.topRated, authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZWRjZDU5M2U4ZmVhYTliZGQ2YjA0M2QwYzRkZDhlNyIsIm5iZiI6MTcyNzEyMzU3NS43NDY2MTgsInN1YiI6IjY2ZjBhNmIzYzIzNzI1OGU0YzI2NmFjOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qxL81RgrInS1ZWLJTnBL5zlCuvLzTJw7Fp-ksVDnQ4o');
      var data=jsonDecode(response.body);
      topRatedsModel= TopRatedsModel.fromJson(data);
      notifyListeners();
      //print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk${data['page']}');
    }
    catch(e){
      print('errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrror${e}');
    }
  }
   getMovieDetailsByCatId({required int catId})async{

    try{
      var response=await ApiManager.getApi(endPoint: '${EndPoints.movieDetailsByCatId}$catId', authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZWRjZDU5M2U4ZmVhYTliZGQ2YjA0M2QwYzRkZDhlNyIsIm5iZiI6MTcyNzEyMzU3NS43NDY2MTgsInN1YiI6IjY2ZjBhNmIzYzIzNzI1OGU0YzI2NmFjOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qxL81RgrInS1ZWLJTnBL5zlCuvLzTJw7Fp-ksVDnQ4o');
      var data=jsonDecode(response.body);
      movieDetailsModel= MovieDetailsModel.fromJson(data);
      notifyListeners();
    }catch(e){
      print(e);
    }
   }
   getSimilarMovieDetailsByCatId({required int movieId})async{

    try{
      var response=await ApiManager.getApi(endPoint: '3/movie/$movieId/similar', authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZWRjZDU5M2U4ZmVhYTliZGQ2YjA0M2QwYzRkZDhlNyIsIm5iZiI6MTcyNzEyMTM0NS44NDc1OCwic3ViIjoiNjZmMGE2YjNjMjM3MjU4ZTRjMjY2YWM4Iiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.9OZDHoHMbKOKCBJAeo2LuH6scej5Ocen8ek5_MsD_HE');
      var data=jsonDecode(response.body);
      similarsModel= SimilarsModel.fromJson(data);
      notifyListeners();
      print(data['results'][0]['title']);
    }catch(e){
      print(e);
    }
   }
   getMovieList()async{
    try{
      var response= await ApiManager.getApi(endPoint: EndPoints.movieList, authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZWRjZDU5M2U4ZmVhYTliZGQ2YjA0M2QwYzRkZDhlNyIsIm5iZiI6MTcyNzEyMzU3NS43NDY2MTgsInN1YiI6IjY2ZjBhNmIzYzIzNzI1OGU0YzI2NmFjOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qxL81RgrInS1ZWLJTnBL5zlCuvLzTJw7Fp-ksVDnQ4o');
      var data=jsonDecode(response.body);
      generalsMovieModel= GeneralsMovieModel.fromJson(data);
      notifyListeners();
      //print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk${data['page']}');
    }
    catch(e){
      print('errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrror${e}');
    }
  }
   getFilterMovies()async{

    try{
      var response=await ApiManager.getApi(endPoint: EndPoints.filterMovies, authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZWRjZDU5M2U4ZmVhYTliZGQ2YjA0M2QwYzRkZDhlNyIsIm5iZiI6MTcyNzU1MzExMi44OTM0MjgsInN1YiI6IjY2ZjBhNmIzYzIzNzI1OGU0YzI2NmFjOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8V29fLDeuk9MHn-1soqMnJ0HBq0Yhxdz5TgTuIYauyc');
      var data=jsonDecode(response.body);
      filtersMovieModel= FiltersMovieModel.fromJson(data);
      notifyListeners();
      //print(data['results'][0]['title']);ttttt
    }catch(e){
      print(e);
    }
  }
   getSearchMovies(String searchText)async{

    try{
      var response=await ApiManager.getApi(query: {"query":searchText},endPoint: EndPoints.filterMovies, authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZWRjZDU5M2U4ZmVhYTliZGQ2YjA0M2QwYzRkZDhlNyIsIm5iZiI6MTcyNzU1MzExMi44OTM0MjgsInN1YiI6IjY2ZjBhNmIzYzIzNzI1OGU0YzI2NmFjOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8V29fLDeuk9MHn-1soqMnJ0HBq0Yhxdz5TgTuIYauyc');
      var data=jsonDecode(response.body);
      searchesModel= SearchesModel.fromJson(data);
      notifyListeners();
      //print(data['results'][0]['title']);ttttt
    }catch(e){
      print(e);
    }
  }

}