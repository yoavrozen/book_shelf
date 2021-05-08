import 'package:flutter/material.dart';

customAppBarTwoButtons(
    String title, Function pressFunction, Function secondPressFunction) {
  return PreferredSize(
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.brown, Colors.green[100]])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.add), onPressed: pressFunction),
            Text(
              title,
              style: TextStyle(
                  fontFamily: 'Cal', fontSize: 30, fontWeight: FontWeight.bold),
            ),
            IconButton(icon: Icon(Icons.menu_book), onPressed: () {})
          ],
        ),
      ),
      preferredSize: Size.fromHeight(50));
}

customAppBarOneButton(String title, Function pressFunction) {
  return PreferredSize(
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.brown, Colors.green[100]])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.arrow_back), onPressed: pressFunction),
            Text(
              title,
              style: TextStyle(
                  fontFamily: 'Cal', fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      preferredSize: Size.fromHeight(50));
}

customAppBarButtonless(String title) {
  return PreferredSize(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.brown, Colors.green[100]])),
        child: Column(
          children: [
            SizedBox(height: 25),
            Text(
              title,
              style: TextStyle(
                  fontFamily: 'Cal', fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      preferredSize: Size.fromHeight(42));
}
