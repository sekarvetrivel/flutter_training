import 'package:flutter/material.dart';

class CustomScrollPage extends StatefulWidget {
  const CustomScrollPage({super.key, required this.title});

  final String title;

  @override
  State<CustomScrollPage> createState() => _CustomScrollPageState();
}

class _CustomScrollPageState extends State<CustomScrollPage> {
//Variables needed to adapt FlexibleSpaceBar text color (title)
  late ScrollController _scrollController;
  bool lastStatus = true;
  double height = 250;

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (height - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: height,
              floating: false,
              pinned: true,
              bottom: PreferredSize(
                // Add this code
                preferredSize: Size.fromHeight(100.0), // Add this code
                child: Text(''), // Add this code
              ),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: _isShrink
                    ? Column(
                        children: [
                          Row(
                            children: [
                              //Replace container with your chart
                              // Here you can also use SizedBox in order to define a chart size
                              Container(
                                  margin: EdgeInsets.all(10.0),
                                  width: 30,
                                  height: 30,
                                  color: Colors.yellow),
                              Text('A little long title'),
                            ],
                          ),
                          Row(
                            children: [
                              //Replace container with your chart
                              // Here you can also use SizedBox in order to define a chart size
                              Container(
                                  margin: EdgeInsets.all(10.0),
                                  width: 30,
                                  height: 30,
                                  color: Colors.red),
                              Text('Your chart here'),
                            ],
                          ),
                          Row(
                            children: [
                              //Replace container with your chart
                              // Here you can also use SizedBox in order to define a chart size
                              Container(
                                  margin: EdgeInsets.all(10.0),
                                  width: 30,
                                  height: 30,
                                  color: Colors.purple),
                              Text('For test'),
                            ],
                          ),
                        ],
                      )
                    : SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                'A little long title',
                                textAlign: TextAlign.center,
                              ),
                              //Replace container with your chart
                              Container(
                                height: 80,
                                color: Colors.yellow,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('Your chart here'),
                                  ],
                                ),
                              ),
                            ]),
                      ),
              ),
            ),
          ];
        },
        body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return Container(
              height: 40,
              child: Text(index.toString()),
            );
          },
        ),
      ),
    );
  }
}
