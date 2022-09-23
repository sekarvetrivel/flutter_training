import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'components/user.dart';
import 'pages/user_detail_page.dart';

class LoadMorePage extends StatefulWidget {
  const LoadMorePage({super.key, required this.title});

  final String title;

  @override
  State<LoadMorePage> createState() => _LoadMorePageState();
}

class _LoadMorePageState extends State<LoadMorePage> {
  List<User> users = <User>[];
  bool isPerformingRequest = false;
  int pageNumber = 0;

  @override
  void initState() {
    super.initState();

    // Loading initial data or first request to get the data
    _getMoreData();

    // Loading data after scroll reaches end of the list
    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels ==
    //       _scrollController.position.maxScrollExtent) {
    //     _getMoreData();
    //   }
    // });
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isPerformingRequest ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<List<User>> _getUsers() async {
    List<User> users = <User>[];
    setState(() {
      pageNumber++;
    });

    String url =
        "https://api.randomuser.me/?page=$pageNumber&results=20&seed=abc";
    print(url);

    var uri = Uri.parse(url);
    var response = await http.get(uri);
    var jsonData = json.decode(response.body);

    print(jsonData);

    var usersData = jsonData["results"];
    for (var user in usersData) {
      User newUser = User(user["name"]["first"] + user["name"]["last"],
          user["email"], user["picture"]["large"], user["phone"]);
      users.add(newUser);
    }

    return users;
  }

  _getMoreData() async {
    if (!isPerformingRequest) {
      setState(() {
        isPerformingRequest = true;
      });
      List<User> newEntries = await _getUsers(); //returns empty list
      if (newEntries.isEmpty) {}
      setState(() {
        users.addAll(newEntries);
        isPerformingRequest = false;
      });
    }
  }

  Widget loadMoreButton() {
    return Container(
      color: Colors.blue,
      child: TextButton(
        child: Text(
          "Load More",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          _getMoreData();
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Users',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      body: Container(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: users.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == users.length) {
                  return loadMoreButton(); //_buildProgressIndicator();
                } else {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  UserDetailPage(users[index])));
                    },
                    title: Text(users[index].fullName),
                    subtitle: Text(users[index].mobileNumber),
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(users[index].imageUrl)),
                  );
                }
              })),
    );
  }
}
