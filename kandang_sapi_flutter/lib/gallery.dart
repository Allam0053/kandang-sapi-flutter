import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:kadang_sapi_flutter/detail.dart';
import 'package:kadang_sapi_flutter/drawer.dart';

class GalleryPage extends StatelessWidget {
  Future<List<Cowsdata>> fetchCows() async {
    var response =
        await http.get("http://iwandepee.000webhostapp.com/cows.php");

    if (response.statusCode == 200) {
      final items = jsonDecode(response.body).cast<Map<String, dynamic>>();

      List<Cowsdata> listOffCows = items.map<Cowsdata>((json) {
        return Cowsdata.fromJson(json);
      }).toList();
      return listOffCows;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      drawer: DrawerComponent(),
      appBar: AppBar(title: Text('Cow Gallery')),
      body: FutureBuilder<List<Cowsdata>>(
        future: fetchCows(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return GridView.count(
            crossAxisCount: 2,
            children: snapshot.data
                .map((data) => AspectRatio(
                      aspectRatio: 3 / 2,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(data: data)),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          width: double.infinity,
                          color: Theme.of(context).accentColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AspectRatio(
                                aspectRatio: 4 / 3,
                                child: Image.network(data.imageURL),
                              ),
                              Text(data.name,
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}

class Cowsdata {
  String name;
  String detail;
  String imageURL;

  Cowsdata({this.name, this.detail, this.imageURL});

  factory Cowsdata.fromJson(Map<String, dynamic> json) {
    return Cowsdata(
      name: json['name'],
      detail: json['detail'],
      imageURL: json['image'],
    );
  }
}
