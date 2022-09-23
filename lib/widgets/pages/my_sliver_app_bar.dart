import 'package:flutter/material.dart';

class MySliverAppBar extends StatefulWidget {
  const MySliverAppBar({Key? key}) : super(key: key);

  @override
  _MySliverAppBarState createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
            pinned: true,
            floating: true,
            snap: true,
            title: Text("Flutter"),
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Training"),
              centerTitle: true,
            )),
        SliverList(
            delegate: SliverChildListDelegate([
          Text(
            "SLIVER",
            style: TextStyle(
              fontSize: 600,
            ),
          )
        ]))
      ],
    );
  }
}
