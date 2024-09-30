class AppUser{
  String? userId;

  AppUser.fromFireStore(Map<String,dynamic>data){
    userId=data[''];
  }
}