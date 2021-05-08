import 'package:book_shelf/services/book.dart';
import 'package:book_shelf/services/customappbar.dart';
import 'package:flutter/material.dart';

class Showbook extends StatefulWidget {
  @override
  _ShowBookState createState() => _ShowBookState();
}

class _ShowBookState extends State<Showbook> {
  Book chosenBook;
  final Color bookColor = Color.fromRGBO(188, 172, 141, 1);
  double marginSizeTitle = 5;
  double marginSizeRate = 12;
  double phoneSize;

  @override
  Widget build(BuildContext context) {
    setState(() {
      chosenBook = ModalRoute.of(context).settings.arguments;
      phoneSize = MediaQuery.of(context).size.height;
    });
    return Scaffold(
        appBar: customAppBarOneButton("Book's cover", () {
          Navigator.pop(context);
        }),
        body: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/cover.jpg'),
                        fit: BoxFit.fill))),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0, phoneSize / marginSizeTitle, 0, 0),
                    child: Text(
                      "${chosenBook.title}",
                      style: TextStyle(
                          fontFamily: 'Cal',
                          fontWeight: FontWeight.bold,
                          fontSize: 70,
                          color: bookColor),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0, 0, 0, phoneSize / marginSizeTitle),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "by",
                            style: TextStyle(
                                fontFamily: 'Cal',
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: bookColor),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "${chosenBook.authorFirstName}",
                            style: TextStyle(
                                fontFamily: 'Cal',
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                                color: bookColor),
                          ),
                        ),
                        Text(
                            "${chosenBook.authorLastName}",
                            style: TextStyle(
                                fontFamily: 'Cal',
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                                color: bookColor),
                          ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, phoneSize / marginSizeRate, 0, 0),
                          child: Text(
                            "Rating: ${chosenBook.rate}" + "/10",
                            style: TextStyle(
                                fontFamily: 'Cal',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: bookColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
