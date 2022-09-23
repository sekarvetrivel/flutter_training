import 'package:flutter/material.dart';

import '../components/user.dart';

class UserDetailPage extends StatelessWidget {
  final User user;

  UserDetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.imageUrl),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                user.fullName,
                style: TextStyle(fontSize: 35.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "Email : ${user.email}",
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "Mobile : ${user.mobileNumber}",
                style: TextStyle(fontSize: 15.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
