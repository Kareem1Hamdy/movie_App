class FavouriteModel{
  String? title;
  String? date;
  String? id;
  String? image;

  FavouriteModel.fromFireStore(Map<String,dynamic>data){
    title=data['title'];
    date=data['date'];
    id=data['id'];
    image=data['image'];
  }
}