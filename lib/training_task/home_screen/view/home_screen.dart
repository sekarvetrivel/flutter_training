import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/training_task/home_screen/view_model/home_view_model.dart';
import 'package:flutter_training/training_task/widgets/custom_scaffold.dart';
import 'package:flutter_training/training_task/widgets/custom_sized_box.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import '../../widgets/custom_button.dart';

Color login = Color(0xff5376a5);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamController _postsController;
  late HomeViewModel viewModel;

  int count = 1;

  Future fetchPost([howMany = 2]) async {
    final response = await http.get(Uri.parse(
        'https://blog.khophi.co/wp-json/wp/v2/posts/?per_page=$howMany&context=embed'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  loadPosts() async {
    fetchPost().then((res) async {
      _postsController.add(res);
      return res;
    });
  }

  Future<Null> _handleRefresh() async {
    count++;
    print(count);
    fetchPost(count * 2).then((res) async {
      _postsController.add(res);
      return null;
    });
  }

  @override
  void initState() {
    _postsController = BehaviorSubject();
    loadPosts();
    super.initState();
  }

  @override
  void dispose() {
    _postsController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    viewModel = context.watch<HomeViewModel>();
    Size size = MediaQuery.of(context).size;

    return Provider(
      create: (BuildContext context) => HomeViewModel(),
      child: CustomScaffold(
        appbar: AppBar(
          title: Text(widget.title),
        ),
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: EdgeInsets.all(size.height * 0.05),
          child: StreamBuilder(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
              return snapshot.data == ConnectivityResult.mobile ||
                      snapshot.data == ConnectivityResult.wifi
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomButton(
                              press: () {
                                viewModel.changeView("stream");
                              },
                              text: "Stream Builder",
                              radius: 30,
                              buttonColor: login,
                              borderColor: Colors.transparent,
                              textColor: !viewModel.switchView
                                  ? Colors.white
                                  : Colors.black,
                              width: size.width * 0.75,
                              height: size.height * 0.05,
                              isBorderedButton: false,
                              borderWidth: 0,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(100),
                              ),
                            ),
                          ],
                        ),
                        CustomSizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomButton(
                              press: () {
                                viewModel.changeView("future");
                              },
                              text: "Future Builder",
                              radius: 30,
                              buttonColor: login,
                              borderColor: Colors.transparent,
                              textColor: viewModel.switchView
                                  ? Colors.white
                                  : Colors.black,
                              width: size.width * 0.75,
                              height: size.height * 0.05,
                              isBorderedButton: false,
                              borderWidth: 0,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(top: size.height * 0.05),
                          child: Card(
                            child: viewModel.switchView
                                ? StreamBuilder(
                                    stream: _postsController.stream,
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      print('Has error: ${snapshot.hasError}');
                                      print('Has data: ${snapshot.hasData}');
                                      print('Snapshot Data ${snapshot.data}');

                                      if (snapshot.hasError) {
                                        return Text(snapshot.error.toString());
                                      }

                                      if (snapshot.hasData) {
                                        return Column(
                                          children: <Widget>[
                                            Expanded(
                                              child: Scrollbar(
                                                child: RefreshIndicator(
                                                  onRefresh: _handleRefresh,
                                                  child: ListView.builder(
                                                    physics:
                                                        const AlwaysScrollableScrollPhysics(),
                                                    itemCount:
                                                        snapshot.data.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      var post =
                                                          snapshot.data[index];
                                                      return ListTile(
                                                        title: Text(
                                                            post['title']
                                                                ['rendered']),
                                                        subtitle:
                                                            Text(post['date']),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }

                                      if (snapshot.connectionState !=
                                          ConnectionState.done) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }

                                      if (!snapshot.hasData &&
                                          snapshot.connectionState ==
                                              ConnectionState.done) {
                                        return Text('No Posts');
                                      }

                                      return SizedBox();
                                    },
                                  )
                                : FutureBuilder(
                                    builder: (ctx, snapshot) {
                                      // Checking if future is resolved or not
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        // If we got an error
                                        if (snapshot.hasError) {
                                          return Center(
                                            child: Text(
                                              '${snapshot.error} occurred',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          );

                                          // if we got our data
                                        } else if (snapshot.hasData) {
                                          // Extracting data from snapshot object
                                          //final data = snapshot.data as String;
                                          return Column(
                                            children: <Widget>[
                                              Expanded(
                                                child: Scrollbar(
                                                  child: ListView.builder(
                                                    physics:
                                                        const AlwaysScrollableScrollPhysics(),
                                                    itemCount:
                                                        snapshot.data.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      var post =
                                                          snapshot.data[index];
                                                      return ListTile(
                                                        title: Text(
                                                            post['title']
                                                                ['rendered']),
                                                        subtitle:
                                                            Text(post['date']),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }
                                      }

                                      // Displaying LoadingSpinner to indicate waiting state
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },

                                    // Future that needs to be resolved
                                    // inorder to display something on the Canvas
                                    future: fetchPost(100),
                                  ),
                          ),
                        ))
                      ],
                    )
                  : Center(
                      child: Lottie.asset(
                        'assets/images/lottie/no_connection.json',
                        repeat: true,
                        reverse: false,
                        animate: true,
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
