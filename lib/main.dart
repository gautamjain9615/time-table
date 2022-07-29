import 'package:flutter/material.dart';
import 'package:time_table/screens/cse.dart';
import 'package:time_table/screens/bb.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:time_table/screens/settings.dart';
import './provider/theme_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return MaterialApp(
            title: 'TimeTable Sem 7',
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            initialRoute: Cse.id,
            debugShowCheckedModeBanner: false,
            routes: {
              Cse.id: (context) => Cse(),
              Bb.id: (context) => Bb(),
              Settings.id: (context) => Settings(),
            });
      });

// ThemeData light = ThemeData(
//     brightness: Brightness.light,
//     primarySwatch: Colors.indigo,
//     accentColor: Colors.pink,
//     scaffoldBackgroundColor: Color(0xfff1f1f1));
//
// ThemeData dark = ThemeData(
//     brightness: Brightness.dark,
//     primarySwatch: Colors.green,
//     accentColor: Colors.blue,
//     scaffoldBackgroundColor: Colors.grey);

// void main() {
//   return runApp(ChangeNotifierProvider<ThemeNotifier>(
//     create: (_) => new ThemeNotifier(),
//     child: MyApp(),
//   ));
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ThemeNotifier>(
//         builder: (context, theme, child) => MaterialApp(
//               theme: theme.getTheme(),
//               home: Scaffold(
//                 appBar: AppBar(
//                   title: Text('Hybrid Theme'),
//                 ),
//                 body: Row(
//                   children: [
//                     Container(
//                       child: FlatButton(
//                         onPressed: () => {
//                           print('Set Light Theme'),
//                           theme.setLightMode(),
//                         },
//                         child: Text('Set Light Theme'),
//                       ),
//                     ),
//                     Container(
//                       child: FlatButton(
//                         onPressed: () => {
//                           print('Set Dark theme'),
//                           theme.setDarkMode(),
//                         },
//                         child: Text('Set Dark theme'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ));
//   }
}
