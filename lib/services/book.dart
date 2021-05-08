class Book{
  String title;
  String authorFirstName;
  String authorLastName;
  int rate;


  Book({this.authorFirstName,this.authorLastName,this.title,this.rate});

factory Book.fromJson(Map<String,dynamic> json){
  return Book(
  title: json["title"],
  authorLastName: json["authorLastName"],
  authorFirstName: json["authorFIrstName"],
  rate: json["rate"]
  );
}
}