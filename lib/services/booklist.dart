import 'package:book_shelf/pages/showbook.dart';
import 'package:flutter/material.dart';
import 'package:book_shelf/services/book.dart';

class BookList extends StatelessWidget {

  final List<Book> books;

  BookList({Key key,this.books}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                  child: Material(
                    child: ListTile(
                      onTap: () {
                        String title = books[index].title;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Showbook(),
                                settings: RouteSettings(arguments: title,)));
                      },
                      title: Text(books[index].title),
                    ),
                  ),
                ),
              );
            });
  }
}