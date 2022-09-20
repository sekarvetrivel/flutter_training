import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../global/global_functions.dart';

class AssetBundlePage extends StatefulWidget {
  const AssetBundlePage({super.key, required this.title});

  final String title;

  @override
  State<AssetBundlePage> createState() => _AssetBundlePageState();
}

class _AssetBundlePageState extends State<AssetBundlePage> {
  var loadImage = false;
  var json = 'assets/json/example_json.json';
  Uint8List? imageData = null;

  Future<void> rootBundleExample() async {
    String value = await rootBundle.loadString(json);
    print(value);
    mySnackBar(context, "Json loaded from file \n$value");
  }

  Future<void> defaultAssetBundleExample() async {
    String value = await DefaultAssetBundle.of(context).loadString(json);
    print(value);
    mySnackBar(context, "Json loaded from file \n$value");
  }

  networkAssetBundleExample() async {
    var url =
        "https://images.pexels.com/photos/6912842/pexels-photo-6912842.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
    final ByteData data = await NetworkAssetBundle(Uri.parse(url)).load("");
    var bytes = data!.buffer.asUint8List();
    setState(() => this.imageData = bytes);
  }

  Widget _ImageWrapper() {
    if (imageData == null) {
      return CircularProgressIndicator();
    }

    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        image: new DecorationImage(
            fit: BoxFit.cover, image: MemoryImage(imageData!, scale: 0.5)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  defaultAssetBundleExample();
                },
                child: Text('DefaultAssetBundle')),
            ElevatedButton(
                onPressed: () {
                  rootBundleExample();
                },
                child: Text('RootBundle')),
            ElevatedButton(
                onPressed: () {
                  setState(() => this.loadImage = true);
                  networkAssetBundleExample();
                },
                child: Text('NetworkAssetBundle')),
            loadImage ? _ImageWrapper() : SizedBox(),
          ],
        ),
      ),
    );
  }
}
