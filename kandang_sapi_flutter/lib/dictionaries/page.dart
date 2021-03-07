import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kadang_sapi_flutter/dictionaries/detail.dart';
import 'package:kadang_sapi_flutter/util/drawer.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class DictionaryPage extends StatelessWidget {
  static List<Dictdata> states = [];

  Future<List<Dictdata>> fetchDict() async {
    var response =
        await http.get("http://allamcowsmoo.000webhostapp.com/dictionaries.php");

    if (response.statusCode == 200) {
      final items = jsonDecode(response.body).cast<Map<String, dynamic>>();

      List<Dictdata> listOffNews = items.map<Dictdata>((json) {
        Dictdata dict = Dictdata.fromJson(json);
        // states.add(dict);
        return dict;
      }).toList();

      states = (listOffNews);
      return listOffNews;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static List<Dictdata> getSuggestions(String query) {
    List<Dictdata> matches = List();
    matches.addAll(states);
    matches.retainWhere(
        (s) => s.term.toLowerCase().startsWith(query.toLowerCase()));
    return matches;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      drawer: DrawerComponent(),
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Stack(
              children: [
                Container(
                  // color: Theme.of(context).primaryColor,
                  color: Theme.of(context).primaryColor,
                  width: double.infinity,
                  height:
                      MediaQuery.of(context).size.height * (0.25 - 0.065 / 2),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Dictionary",
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                ),

                // Search bar
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: MediaQuery.of(context).size.height * 0.065,
                      width: MediaQuery.of(context).size.width * 0.92,
                      child: TypeAheadField(
                        textFieldConfiguration: TextFieldConfiguration(
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search here',
                          ),
                        ),
                        suggestionsCallback: (pattern) async {
                          return await getSuggestions(pattern);
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text(suggestion.term),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DictionaryDetailPage(
                                data: suggestion,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          // Give distance search and item
          SizedBox(height: 10),

          // Dictionary list item
          Expanded(
            child: FutureBuilder<List<Dictdata>>(
              future: fetchDict(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(child: CircularProgressIndicator());
                return ListView(
                  children: snapshot.data
                      .map((data) => Container(
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.all(Radius.circular(2)),
                              border: Border(
                                top: BorderSide(
                                    width: 1,
                                    color: Colors.grey.withOpacity(0.3)),
                                bottom: BorderSide(
                                    width: 1,
                                    color: Colors.grey.withOpacity(0.3)),
                              ),
                              color: Theme.of(context).accentColor,
                            ),
                            child: ListTile(
                              title: Text(
                                data.term,
                                style: TextStyle(color: Colors.white),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DictionaryDetailPage(
                                      data: data,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ))
                      .toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Dictdata {
  String term;
  String meaning;

  Dictdata({this.term, this.meaning});

  factory Dictdata.fromJson(Map<String, dynamic> json) {
    return Dictdata(
      term: json['list_term'],
      meaning: json['list_meaning'],
    );
  }
}
