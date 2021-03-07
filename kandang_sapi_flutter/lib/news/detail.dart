import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {
  final dynamic data;

  NewsDetailPage({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Image.network(data.imageURL),
            Container(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
              child: Text(
                data.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                data.content,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
