import 'package:flutter/material.dart';
import 'package:book_shelf/services/book.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Addbook extends StatefulWidget {
  @override
  _AddbookState createState() => _AddbookState();
}

class _AddbookState extends State<Addbook> {
  Future<Book> postBook(Book book) async {
    final response = await http.post(
        Uri.http(
            'http://testflutter-env.eba-5dbif6zm.us-east-1.elasticbeanstalk.com/',
            'insert/addBook'),
        headers: {
          'Content-Type': 'application/json;'
        },
        body: {
          "title": {book.title},
          "authorFirstName": {book.authorFirstName},
          "authorLastName": {book.authorLastName},
          "rate": {book.rate.toString()}
        });
    if (response.statusCode == 200) {
      return Book.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to post the book");
    }
  }

  final titleController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  Book newBook;
  Future<Book> postedBook;
  int _dropdownvalue = 1;
  @override
  void dispose() {
    titleController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a new book to the library"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
          child: Column(
            children: [
              Container(
                  width: 320,
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: titleController,
                    autocorrect: true,
                    decoration: InputDecoration(
                        labelText: "Title", icon: Icon(Icons.text_fields)),
                  )),
              Container(
                  width: 320,
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: firstNameController,
                    autocorrect: true,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        labelText: "Enter author's first name",
                        icon: Icon(Icons.person)),
                  )),
              Container(
                  width: 320,
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: lastNameController,
                    autocorrect: true,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        labelText: "Enter author's last name",
                        icon: Icon(Icons.person)),
                  )),
              Container(
                  width: 320,
                  padding: EdgeInsets.all(10.0),
                  child: DropdownButtonFormField<int>(
                    value: _dropdownvalue,
                    onChanged: (int newvalue) {
                      setState(() {
                        _dropdownvalue = newvalue;
                      });
                    },
                    items: <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                        .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                        labelText: "Book's rating",
                        icon: Icon(Icons.rate_review)),
                  )),
              ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                                "Wait! Are you sure these are the correct detatils of this book?",
                                style: TextStyle(
                                  fontSize: 22,
                                )),
                            content: Text(
                                "Title: ${titleController.text}, Rating: $_dropdownvalue, Author's first name: ${firstNameController.text}, Author's last name: ${lastNameController.text} ? ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            actions: <Widget>[
                              TextButton(
                                child: Text("Yes, add this book to the library",
                                    style: TextStyle(
                                      fontSize: 15,
                                    )),
                                onPressed: (){
                                  setState((){
                                    newBook = new Book(
                                      authorFirstName: firstNameController.text,
                                      authorLastName: lastNameController.text,
                                      rate: _dropdownvalue,
                                      title: titleController.text);
                                  postedBook = postBook(newBook);
                                  });
                                  Navigator.pushNamed(context, "/");
                                },
                              ),
                              TextButton(
                                child: Text("No, i have something to correct",
                                    style: TextStyle(
                                      fontSize: 15,
                                    )),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        });
                  },
                  icon: Icon(Icons.add),
                  label: Text("Add this book"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.grey[100]),
                  ))
            ],
          )),
    );
  }
}
