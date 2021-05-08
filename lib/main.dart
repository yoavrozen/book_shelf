import 'package:book_shelf/pages/addbook.dart';
import 'package:book_shelf/pages/library.dart';
import 'package:book_shelf/pages/showbook.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
initialRoute: "/",
routes: {
  "/": (context) => Library(),
  "showbook": (context) => Showbook(),
  "addbook": (context) => Addbook(),
}
));


