import 'package:flutter/material.dart';

class Showbook extends StatefulWidget {
  @override
  _ShowBookState createState() => _ShowBookState();
}

class _ShowBookState extends State<Showbook> {
  @override
  Widget build(BuildContext context) {
      String chosenBookTitle = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("$chosenBookTitle"),
        centerTitle: true,
      ),
    );
  }
}