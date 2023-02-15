import 'package:flutter/material.dart';

import '../load_more/components/user.dart';

class MultiSelectListViewPage extends StatefulWidget {
  const MultiSelectListViewPage({super.key, required this.title});

  final String title;

  @override
  State<MultiSelectListViewPage> createState() =>
      _MultiSelectListViewPageState();
}

class _MultiSelectListViewPageState extends State<MultiSelectListViewPage> {
  List<User> users = <User>[];

  @override
  void initState() {
    super.initState();
    users.add(User("sekar", "sekar@gmail.com", "", "123456"));
    users.add(User("rishi", "rishi@gmail.com", "", "234567"));
    users.add(User("divya", "divya@gmail.com", "", "345678"));
    users.add(User("1", "1@gmail.com", "", "456789"));
    users.add(User("2", "2@gmail.com", "", "344234"));
    users.add(User("3", "3@gmail.com", "", "231231"));
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "Selected item count - ${users.where((element) => element.isSelected).toList().length}"),
          ),
          Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Ink(
                      color:
                          users[index].isSelected ? Colors.green : Colors.white,
                      child: ListTile(
                        onTap: () {
                          setState(() {
                            users[index].isSelected = !users[index].isSelected;
                          });
                        },
                        trailing: Text(users[index].isSelected
                            ? "Selected"
                            : "UnSelected"),
                        title: Text(users[index].fullName),
                        subtitle: Text(users[index].mobileNumber),
                        leading: CircleAvatar(backgroundColor: Colors.amber),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
