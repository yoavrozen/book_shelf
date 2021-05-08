import 'package:book_shelf/pages/addbook.dart';
import 'package:book_shelf/services/book.dart';
import 'package:book_shelf/services/customappbar.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  List<dynamic> books = [];
  var refreshkey = GlobalKey<RefreshIndicatorState>();

  void getBooks() async {
    final response = await http.get(Uri.parse(
        'http://testflutter-env.eba-5dbif6zm.us-east-1.elasticbeanstalk.com/data/getBooks/'));
    setState(() {
      books = json.decode(response.body);
    });
  }

  Future<void> refreshBookList() async {
    refreshkey.currentState?.show(atTop: false);
    setState(() {
      getBooks();
    });
  }


  String getTitleFromJson(dynamic book) {
    return book['title'];
  }

  String getFirstNameFromJson(dynamic book) {
    return book['authorFirstName'];
  }

  String getLastNameFromJson(dynamic book) {
    return book['authorLastName'];
  }

  int getRateFromJson(dynamic book) {
    return book['rate'];
  }

  @override
  void initState() {
    super.initState();
    getBooks();
  }

  @override
  Widget build(BuildContext context) {
    getBooks();
    return Scaffold(
        appBar: customAppBarTwoButtons("Welcome to the library", () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Addbook()));
        }, () {}),
        body: RefreshIndicator(
          onRefresh: refreshBookList,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bg.png"),
                    fit: BoxFit.fitHeight)),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/book.jpg'))),
                      alignment: Alignment.center,
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "showbook",
                                arguments: new Book(
                                    authorFirstName: getFirstNameFromJson(books[index]),
                                    authorLastName: getLastNameFromJson(books[index]),
                                    title: getTitleFromJson(books[index]),
                                    rate: getRateFromJson(books[index])));
                          },
                          child: Text(
                            getTitleFromJson(books[index]),
                            style: TextStyle(
                                fontFamily: 'Cal',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown[300]),
                          )));
                }),
          ),
        ));
  }
}
