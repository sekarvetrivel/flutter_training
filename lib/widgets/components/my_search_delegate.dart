import 'package:flutter/material.dart';

class MySearchDelegate extends StatelessWidget {
  const MySearchDelegate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showSearch(context: context, delegate: CustomSearchDelegate());
        },
        icon: Icon(Icons.search));
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "Apple",
    "Mango",
    "Banana",
    "Orange",
    "Pear",
    "Grapes",
    "PineApple",
    "Papaya",
    "Guava",
    "WaterMelon",
    "Strawberry"
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    matchQuery = searchTerms
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return matchQuery.isEmpty
        ? Center(child: Text("No Item Found"))
        : ListView.builder(
            itemCount: matchQuery.length,
            itemBuilder: (context, index) {
              var result = matchQuery[index];
              return ListTile(
                title: Text(result),
              );
            });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    matchQuery = searchTerms
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return matchQuery.isEmpty
        ? Center(child: Text("No Item Found"))
        : ListView.builder(
            itemCount: matchQuery.length,
            itemBuilder: (context, index) {
              var result = matchQuery[index];
              return ListTile(
                title: Text(result),
              );
            });
  }
}
