import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import './../widget/change_theme_button_widget.dart';
import 'package:provider/provider.dart';
import './../provider/theme_provider.dart';
import 'package:http/http.dart';
import 'settings.dart';

// npm install -g firebase-tools
// firebase login
// firebase init
// build/web
// flutter build web
// firebase deploy --only hosting

class Cse extends StatefulWidget {
  static String id = 'cse';

  @override
  _CseState createState() => _CseState();
}

final url = "https://gautamjain9615.github.io/jsonapi/cselinks.json";
var temp = {};
var _postsJson = {
  "sfm": {"room": "SME L2", "link": ""},
  "mnv": {"room": "SME L5", "link": ""},
  "pied": {"room": "LHB 307", "link": ""},
  "far": {
    "room": "SME L1",
    "link": "https://meet.google.com/xcs-pdfq-dyo?authuser=1&pli=1"
  },
  "itb": {"room": "LHB 308", "link": ""},
  "es": {"room": "LHB 110", "link": ""},
  "pc": {"room": "CSE 102", "link": ""},
  "mm": {"room": "SME L1", "link": ""},
  "free": {"room": "", "link": ""}
};
var finalList = {};

class _CseState extends State<Cse> {
  String day = DateFormat('EEEE').format(DateTime.now());
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  void fetchData() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as Map;

      setState(() {
        temp = jsonData;
      });
    } catch (err) {
      print("Error Occoured");
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    if (temp.length == 0) {
      print("Data not fetched");
      finalList = _postsJson;
    } else {
      print("Data fetched");
      finalList = temp;
    }

    return Scaffold(
      // backgroundColor: mode == "light" ? Colors.white : Colors.black26,
      appBar: AppBar(
        backgroundColor: Color(0xFF6E40C9),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Settings.id);
              },
              icon: Icon(Icons.settings_rounded))
        ],
        title: Center(child: Text("Time Table for " + day)),
        leading: IconButton(
          icon: Icon(Icons.menu_rounded),
          // color: Colors.white,
          tooltip: 'Menu Icon',
          onPressed: () {
            if (_scaffoldKey.currentState.isDrawerOpen == false) {
              _scaffoldKey.currentState.openDrawer();
            } else {
              _scaffoldKey.currentState.openEndDrawer();
            }
          },
        ),
      ),
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              decoration: BoxDecoration(
                // border: Border(
                //   bottom: BorderSide(width: 2.0, color: Colors.grey),
                // ),
                // color: Colors.blue,
                color: Color(0xFF6E40C9),
              ),
              padding: EdgeInsets.fromLTRB(0, 120, 0, 30),
              child: Center(
                  child: Text(
                "Change Week Day",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              )),
            ),
            SizedBox(height: 7),
            // Divider(
            //   color: Colors.grey,
            //   thickness: 2,
            // ),
            ListTile(
              leading: Icon(Icons.date_range_outlined),
              title: const Text('Monday'),
              onTap: () {
                // day = "Monday";
                setState(() {
                  day = "Monday";
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.date_range_outlined),
              title: const Text('Tuesday'),
              onTap: () {
                setState(() {
                  day = "Tuesday";
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.date_range_outlined),
              title: const Text('Wednesday'),
              onTap: () {
                setState(() {
                  day = "Wednesday";
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.date_range_outlined),
              title: const Text('Thursday'),
              onTap: () {
                setState(() {
                  day = "Thursday";
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.date_range_outlined),
              title: const Text('Friday'),
              onTap: () {
                setState(() {
                  day = "Friday";
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.date_range_outlined),
              title: const Text('Saturday'),
              onTap: () {
                setState(() {
                  day = "Saturday";
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.today_outlined),
              title: const Text('Default'),
              onTap: () {
                setState(() {
                  day = DateFormat('EEEE').format(DateTime.now());
                });
                Navigator.of(context).pop();
              },
            ),
            // SizedBox(height: 20),
            // ChangeThemeButtonWidget(),
          ],
        ),
      ),
      body: Center(
        child: Widget1(day: day),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF6E40C9),
          onPressed: () => launch(
              "https://docs.google.com/spreadsheets/d/1kXEqzTlsOMqdmcOtgWt2jhdpGBbNtX7ZTnUhpPZGIQA/edit#gid=0"),
          child: Icon(Icons.navigate_next, color: Colors.white),
          tooltip: "Complete Timetable"),
    );
  }
}

class Widget1 extends StatelessWidget {
  Widget1({@required this.day});
  final String day;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var classes = {
      'sfm': classButton(
          link: finalList['sfm']['link'],
          title: Text("Statistics for Management", textAlign: TextAlign.center),
          width: 0.6,
          room: finalList['sfm']['room']),
      'mnv': classButton(
          link: finalList['mnv']['link'],
          title: Text("Managing New Ventures", textAlign: TextAlign.center),
          width: 0.6,
          room: finalList['mnv']['room']),
      'pied': classButton(
          link: finalList['pied']['link'],
          title: Text("Political and Institutional Economics",
              textAlign: TextAlign.center
              // softWrap: false,
              // overflow: TextOverflow.fade,
              ),
          width: 0.6,
          room: finalList['pied']['room']),
      'far': classButton(
          link: finalList['far']['link'],
          title: Text("Financial Accouting and Reporting",
              textAlign: TextAlign.center),
          width: 0.6,
          room: finalList['far']['room']),
      'itb': classButton(
          link: finalList['itb']['link'],
          title:
              Text("Introduction to Blockchain", textAlign: TextAlign.center),
          width: 0.6,
          room: finalList['itb']['room']),
      'es': classButton(
          link: finalList['es']['link'],
          title: Text("Environmental Science", textAlign: TextAlign.center),
          width: 0.6,
          room: finalList['es']['room']),
      'pc': classButton(
          link: finalList['pc']['link'],
          title: Text("Parameterized Complexity", textAlign: TextAlign.center),
          width: 0.6,
          room: finalList['pc']['room']),
      'mm': classButton(
          link: finalList['mm']['link'],
          title: Text("Marketing Management", textAlign: TextAlign.center),
          width: 0.6,
          room: finalList['mm']['room']),
      'free': classButton(
          link: finalList['free']['link'],
          title: Text("Free Slot"),
          width: 0.6,
          room: finalList['free']['room']),
    };

    switch (day) {
      case "Monday":
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Widget2(time: "8:00 - 8:50", wid: classes['mm']),
              Widget2(time: "9:00 - 9:50", wid: classes['mnv']),
              Widget2(time: "10:00 - 10:50", wid: classes['pied']),
            ],
          );
        }
        break;
      case "Tuesday":
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Widget2(time: "8:00 - 8:50", wid: classes['pc']),
              Widget2(time: "9:00 - 9:50", wid: classes['mnv']),
              Widget2(time: "10:00 - 10:50", wid: classes['far']),
              Widget2(time: "11:00 - 11:50", wid: classes['es']),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Color(0xFF6E40C9),
                    ),
                    Text(
                      "Classes After Lunch",
                      style: TextStyle(
                          // color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Color(0xFF6E40C9),
                    ),
                  ]),
              Widget2(time: "3:00 - 3:50", wid: classes['sfm']),
            ],
          );
        }
        break;
      case "Wednesday":
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Widget2(time: "8:00 - 8:50", wid: classes['mm']),
              Widget2(time: "9:00 - 9:50", wid: classes['far']),
              Widget2(time: "10:00 - 10:50", wid: classes['pied']),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Color(0xFF6E40C9),
                    ),
                    Text(
                      "Classes After Lunch",
                      style: TextStyle(
                          // color: Colors.black,
                          // fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Color(0xFF6E40C9),
                    ),
                  ]),
              Widget2(time: "2:00 - 2:50", wid: classes['sfm']),
              Widget2(time: "6:00 - 7:30", wid: classes['itb']),
            ],
          );
        }
        break;
      case "Thursday":
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Widget2(time: "8:00 - 8:50", wid: classes['pc']),
              Widget2(time: "9:00 - 9:50", wid: classes['mnv']),
              Widget2(time: "10:00 - 10:50", wid: classes['pied']),
              Widget2(time: "11:00 - 11:50", wid: classes['es']),
            ],
          );
        }
        break;
      case "Friday":
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Widget2(time: "8:00 - 8:50", wid: classes['mm']),
              Widget2(time: "9:00 - 9:50", wid: classes['far']),
              Widget2(time: "10:00 - 10:50", wid: classes['free']),
              Widget2(time: "11:00 - 11:50", wid: classes['es']),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Color(0xFF6E40C9),
                    ),
                    Text(
                      "Classes After Lunch",
                      style: TextStyle(
                          // color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Color(0xFF6E40C9),
                    ),
                  ]),
              Widget2(time: "2:00 - 2:50", wid: classes['sfm']),
              Widget2(time: "5:00 - 5:50", wid: classes['pc']),
            ],
          );
        }
        break;
      case "Saturday":
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Color(0xFF6E40C9),
                    ),
                    Text(
                      "Classes After Lunch",
                      style: TextStyle(
                          // color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Color(0xFF6E40C9),
                    ),
                  ]),
              Widget2(time: "3:00 - 3:50", wid: classes['itb']),
            ],
          );
        }
        break;

      default:
        {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("No classes today :)")]);
        }
        break;
    }
  }
}

class Widget2 extends StatelessWidget {
  Widget2({@required this.time, @required this.wid});
  final String time;
  final Widget wid;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.35,
            child: Center(
              child: Text(
                time,
                style: TextStyle(fontSize: 17),
              ),
            ),
          ),
          wid,
        ],
      ),
    );
  }
}

class classButton extends StatelessWidget {
  classButton(
      {@required this.link,
      @required this.title,
      @required this.width,
      @required this.room});
  final String link;
  final Widget title;
  final double width;
  final String room;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          final snackBar = SnackBar(
            action: SnackBarAction(
              label: link == "" ? 'Ok' : 'Join Online',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                if (link != "") {
                  launch(link);
                }
              },
            ),
            content: Text("Room Number: " + room),
          );
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        style: OutlinedButton.styleFrom(
            // primary: Colors.blue.shade500,
            // onSurface: Colors.orangeAccent,
            side: BorderSide(color: Colors.black26, width: 1.5),
            // minimumSize: Size(50, 50),
            fixedSize: Size(MediaQuery.of(context).size.width * width, 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            textStyle: TextStyle(fontSize: 15)),
        child: Center(child: title));
  }
}
