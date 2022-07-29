import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './../provider/theme_provider.dart';
import './../widget/change_theme_button_widget.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Settings extends StatefulWidget {
  static String id = 'settings';

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      // backgroundColor: mode == "light" ? Colors.white : Colors.black26,
      appBar: AppBar(
        backgroundColor: Color(0xFF6E40C9),
        title: Text("Settings"),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(width: 1),
              Container(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05, 0, 0, 0),
                  child: Text(
                    "Show Notifications",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  )),
              Container(
                padding: EdgeInsets.fromLTRB(
                    0, 0, MediaQuery.of(context).size.width * 0.05, 0),
                child: FlutterSwitch(
                  activeToggleColor: Color(0xFF6E40C9),
                  inactiveToggleColor: Color(0xFF2F363D),
                  activeColor: Color(0xFF271052),
                  inactiveColor: Colors.white,
                  activeSwitchBorder: Border.all(
                    color: Color(0xFF3C1E72),
                    width: 2.0,
                  ),
                  inactiveSwitchBorder: Border.all(
                    color: Color(0xFFD1D5DA),
                    width: 2.0,
                  ),
                  value: status,
                  onToggle: (val) {
                    print(val);
                    setState(() {
                      status = val;
                    });
                  },
                ),
              ),
              // SizedBox(width: 1),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(width: 1),
              Container(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05, 0, 0, 0),
                  child: Text(
                    "Theme",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  )),
              Container(
                  padding: EdgeInsets.fromLTRB(
                      0, 0, MediaQuery.of(context).size.width * 0.05, 0),
                  child: ChangeThemeButtonWidget()),
              // SizedBox(width: 1),
            ],
          ),
        ],
      ),
    );
  }
}
