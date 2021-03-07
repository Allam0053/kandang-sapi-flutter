import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final dynamic data;

  DetailPage({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(title: Text('Detail')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(data.imageURL),
          Container(
            margin: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(data.name,
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Text(data.detail,
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.white, fontSize: 18))),
        ],
      ),
    );
  }
}
