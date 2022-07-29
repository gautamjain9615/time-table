import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './../provider/theme_provider.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return FlutterSwitch(
      value: themeProvider.isDarkMode,
      // width: 100.0,
      // height: 55.0,
      // toggleSize: 45.0,
      // value: status7,
      borderRadius: 30.0,
      padding: 2.0,
      activeToggleColor: Color(0xFF6E40C9),
      inactiveToggleColor: Color(0xFF2F363D),
      activeSwitchBorder: Border.all(
        color: Color(0xFF3C1E72),
        width: 2.0,
      ),
      inactiveSwitchBorder: Border.all(
        color: Color(0xFFD1D5DA),
        width: 2.0,
      ),
      activeColor: Color(0xFF271052),
      inactiveColor: Colors.white,
      activeIcon: Icon(
        Icons.nightlight_round,
        color: Color(0xFFF8E3A1),
      ),
      inactiveIcon: Icon(
        Icons.wb_sunny_rounded,
        color: Color(0xFFFFDF5D),
      ),
      onToggle: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
    );

    // return FlutterSwitch(
    //   width: 100.0,
    //   height: 55.0,
    //   toggleSize: 45.0,
    //   // value: status7,
    //   borderRadius: 30.0,
    //   padding: 2.0,
    //   activeToggleColor: Color(0xFF6E40C9),
    //   inactiveToggleColor: Color(0xFF2F363D),
    //   activeSwitchBorder: Border.all(
    //     color: Color(0xFF3C1E70),
    //     width: 6.0,
    //   ),
    //   inactiveSwitchBorder: Border.all(
    //     color: Color(0xFFD1D5DA),
    //     width: 6.0,
    //   ),
    //   activeColor: Color(0xFF271052),
    //   inactiveColor: Colors.white,
    //   activeIcon: Icon(
    //     Icons.nightlight_round,
    //     color: Color(0xFFF8E3A1),
    //   ),
    //   inactiveIcon: Icon(
    //     Icons.wb_sunny,
    //     color: Color(0xFFFFDF5D),
    //   ),
    //   // onToggle: (){},
    //   onToggle: (value) {
    //     print(themeProvider.isDarkMode);
    //     final provider = Provider.of<ThemeProvider>(context, listen: false);
    //     provider.toggleTheme(value);
    //   },
    // );

    // return themeProvider.isDarkMode
        // ? IconButton(
        //     onPressed: () {
        //       setState(() {
        //         counter++;
        //       });
        //     },
        //     icon: Icon(Icons.light_mode_outlined))
        // :

    return IconButton(
            onPressed: () {

              final provider =
                  Provider.of<ThemeProvider>(context, listen: false);
              // print(them);
              // them == true ? provider.toggleTheme(true) : provider.toggleTheme(false);
              // them = !them;
              provider.toggleTheme(true);
            },
            icon: Icon(Icons.dark_mode_outlined));
  }
}
