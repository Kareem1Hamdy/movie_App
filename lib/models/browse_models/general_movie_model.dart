class GeneralMovieModel{
  static int? id;
  String? name;

  GeneralMovieModel.fromJson(Map<String,dynamic>data){
    id=data['id'];
    name=data['name'];
  }
}