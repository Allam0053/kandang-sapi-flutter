import 'package:flutter/material.dart';
import 'detail.dart';

class NewsCard extends StatelessWidget{
  final Newsdata data;

  NewsCard({this.data});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NewsDetailPage(data: data),
                    ),
                  );},
        child: Container(
          color: Color(0xFF424B5E),
          width: 300.0,
          height: 100.0,
          margin: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(data.title, style: TextStyle(fontFamily: 'Nunito',fontSize: 20.0, color: Colors.white),),
              Image.network(data.imageURL, fit: BoxFit.cover),
            ],
          ),
        ),
      ),
    );
  }
}

class Newsdata {
  String id;
  String title;
  String content;
  String imageURL;

  Newsdata({this.id, this.title, this.content, this.imageURL});

  factory Newsdata.fromJson(Map<String, dynamic> json) {
    return Newsdata(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      imageURL: json['image'],
    );
  }
}