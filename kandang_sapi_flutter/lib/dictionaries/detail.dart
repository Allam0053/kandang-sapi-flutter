import 'package:flutter/material.dart';

class DictionaryDetailPage extends StatelessWidget {
  final dynamic data;

  DictionaryDetailPage({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        shadowColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Text(
                data.term,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              width: double.infinity,
              alignment: Alignment.bottomLeft,
              child: Text(
                'Arti',
                style:
                    TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                data.meaning,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
