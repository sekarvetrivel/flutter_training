import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertraining/localization/view_model/locale_view_model.dart';
import 'package:provider/provider.dart';

import 'l10n/l10n.dart';

class LocalizationPage extends StatefulWidget {
  @override
  _LocalizationPageState createState() => _LocalizationPageState();
}

class _LocalizationPageState extends State<LocalizationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _title(String val) {
      switch (val) {
        case 'en':
          return Text(
            'English',
            style: TextStyle(fontSize: 16.0),
          );
        case 'hi':
          return Text(
            'Hindi',
            style: TextStyle(fontSize: 16.0),
          );
        case 'ar':
          return Text(
            'Arabic',
            style: TextStyle(fontSize: 16.0),
          );
        case 'es':
          return Text(
            'Spanish',
            style: TextStyle(fontSize: 16.0),
          );
        case 'de':
          return Text(
            'German',
            style: TextStyle(fontSize: 16.0),
          );
        case 'ta':
          return Text(
            'Tamil',
            style: TextStyle(fontSize: 16.0),
          );
        default:
          return Text(
            'English',
            style: TextStyle(fontSize: 16.0),
          );
      }
    }

    return Consumer<LocaleViewModel>(builder: (context, provider, snapshot) {
      var lang = provider.locale ?? Localizations.localeOf(context);
      return Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Localization'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.hello_world,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 85.0),
                DropdownButton(
                    value: lang,
                    onChanged: (Locale? val) {
                      provider.setLocale(val!);
                    },
                    items: L10n.all
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: _title(e.languageCode),
                            ))
                        .toList())
              ],
            ),
          ));
    });
  }
}
