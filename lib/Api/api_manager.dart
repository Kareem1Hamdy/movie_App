import 'package:http/http.dart' as http;
class EndPoints{
  static String popular='3/movie/popular';
  static String upComing='3/movie/upcoming';
  static String topRated='3/movie/top_rated';
  static String movieList='3/genre/movie/list';
  static String movieDetailsByCatId='3/movie/';
  static String filterMovies='3/discover/movie';
  static String searchMovie='3/search/movie';
}


class ApiManager{


  static String serverLink='api.themoviedb.org';

  static Future<http.Response> getApi({Map<String,dynamic>? query,required String endPoint,required String authorization})async{
    var url=Uri.https(serverLink,endPoint,query);
    var response=await http.get(url,headers: {"Authorization":authorization});
    return response;
}


}