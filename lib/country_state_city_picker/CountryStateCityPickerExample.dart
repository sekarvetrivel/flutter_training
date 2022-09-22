import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

class CSCPickerPage extends StatefulWidget {
  CSCPickerPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _CSCPickerPageState createState() => _CSCPickerPageState();
}

class _CSCPickerPageState extends State<CSCPickerPage> {
  /// Variables to store country state city data in onChanged method.
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";

  @override
  Widget build(BuildContext context) {
    GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 600,
            child: Column(
              children: [
                ///Adding CSC Picker Widget in app
                CSCPicker(
                  //flagState: CountryFlag.DISABLE,
                  //showStates: true,
                  //showCities: true,
                  onCountryChanged: (value) {},

                  ///triggers once state selected in dropdown
                  onStateChanged: (value) {},

                  ///triggers once city selected in dropdown
                  onCityChanged: (value) {},
                ),

                ///print newly selected country state and city in Text Widget
                TextButton(
                    onPressed: () {
                      setState(() {
                        address = "$cityValue, $stateValue, $countryValue";
                      });
                    },
                    child: Text("Print Data")),
                Text(address),
                SelectState(
                  style: TextStyle(color: Colors.blue),

                  onCountryChanged: (value) {
                    setState(() {
                      countryValue = value;
                    });
                  },
                  onStateChanged: (value) {
                    setState(() {
                      stateValue = value;
                    });
                  },
                  onCityChanged: (value) {
                    setState(() {
                      cityValue = value;
                    });
                  },
                ),
              ],
            )),
      ),
    );
  }
}
