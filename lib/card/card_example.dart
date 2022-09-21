import 'package:flutter/material.dart';

import '../global/global_functions.dart';
import 'components/elevated_card.dart';
import 'components/filled_card.dart';
import 'components/outlined_card.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key, required this.title});

  final String title;

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    const ListTile(
                      leading: Icon(Icons.album),
                      title: Text('A Material Design card'),
                      subtitle: Text(
                          'A panel with slightly rounded corners and an elevation shadow.'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            /* ... */
                          },
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('CANCEL'),
                          onPressed: () {
                            /* ... */
                          },
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    //debugPrint('Card tapped.');
                    mySnackBar(context, 'Card tapped.');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const SizedBox(
                      width: 300,
                      height: 100,
                      child: Text('A card that can be tapped'),
                    ),
                  ),
                ),
              ),
              ElevatedCardExample(),
              FilledCardExample(),
              OutlinedCardExample(),
            ],
          ),
        ),
      ),
    );
  }
}
