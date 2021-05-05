import 'package:book_shelf/pages/addbook.dart';
import 'package:book_shelf/services/book.dart';
import 'package:book_shelf/services/booklist.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  List<Book> parseBooks(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Book>((json) => Book.fromJson(json)).toList();
  }

  Future<List<Book>> getBooks(http.Client client) async {
    final response = await client.get(Uri.parse(
        'http://testflutter-env.eba-5dbif6zm.us-east-1.elasticbeanstalk.com/data/getBooks/'));

    return parseBooks(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to library"),
        centerTitle: true,
        backgroundColor: Colors.red,
        backwardsCompatibility: false,
      ),
      body: FutureBuilder<List<Book>>(
        future: getBooks(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? BookList(books: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Addbook()));
        },
        label: Text("Add a book"),
        icon: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
