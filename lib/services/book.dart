class Book{
  int id;
  String title;
  String authorFirstName;
  String authorLastName;
  int rate;


  Book({this.authorFirstName,this.authorLastName,this.title,this.rate});

Book.fromJson(Map<String,dynamic> json){
  id = json["id"] as int;
  title = json["title"] as String;
  authorLastName = json["authorLastName"] as String;
  authorFirstName = json["authorFIrstName"]as String;
  rate = json["rate"] as int;
}
}