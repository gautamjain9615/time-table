import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import './../widget/change_theme_button_widget.dart';
import 'package:provider/provider.dart';
import './../provider/theme_provider.dart';

// flutter build web
// firebase deploy --only hosting

class Bb extends StatefulWidget {
  static String id = 'bb';

  @override
  _BbState createState() => _BbState();
}

class _BbState extends State<Bb> {
  String day = DateFormat('EEEE').format(DateTime.now());
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      // backgroundColor: mode == "light" ? Colors.white : Colors.black26,
      appBar: AppBar(
        backgroundColor: Color(0xFF6E40C9),
        // actions: [ChangeThemeButtonWidget(), SizedBox(width: 15)],
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
              leading: Icon(Icons.today_outlined),
              title: const Text('Default'),
              onTap: () {
                setState(() {
                  day = DateFormat('EEEE').format(DateTime.now());
                });
                Navigator.of(context).pop();
              },
            ),
            SizedBox(height: 20),
            ChangeThemeButtonWidget(),
          ],
        ),
      ),
      body: Center(
        child: Widget1(day: day),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF6E40C9),
          onPressed: () => launch(
              "https://docs.google.com/spreadsheets/d/1gbBBumgCH54Hi03xkKZAxhWockdM1nwWjdICE7QbVMA/edit#gid=0"),
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
    'bi': classButton(
    link: 'http://meet.google.com/uqd-spcg-ucn',
    title: Text("Bioimaging"),
    width: 0.6),

    'bsb': classButton(
    link: 'https://meet.google.com/imi-wuja-fsf',
    title: size.width > 600 ? Text("Biophysics & Structural Biology") : Text("BP & SB"),
    width: 0.6),

    'be': classButton(
    link: 'https://meet.google.com/fgc-artn-hna',
    title: size.width > 600 ? Text("Biomaterials Engineering") : Text("Biomat Engg"),
    width: 0.6),

    'io': classButton(
    link: 'https://meet.google.com/icg-ehcp-pwy',
    title: size.width > 600 ? Text("Introductory Omics") : Text("Int Omics"),
    width: 0.6),

    'dl': classButton(
    link: 'https://meet.google.com/izc-idfr-iqr',
    title: Text("Deep Learning"),
    width: 0.6),

    'ab': classButton(
    link: 'https://meet.google.com/ugv-vvmx-afj',
    title: size.width > 600 ? Text("Algorithms in Biology") : Text("Algos in Bio"),
    width: 0.6),

    'om': classButton(
    link: 'https://meet.google.com/ijb-kctc-faq?authuser=1&pli=1',
    title: size.width > 600 ? Text("Operations Management") : Text("Ops Mgmt"),
    width: 0.6),

    'mhc': classButton(
    link: 'https://meet.google.com/yeu-tsoq-ihn?authuser=1&pli=1',
    title: size.width > 600 ? Text("Managing Human Capital") : Text("Mng HC"),
    width: 0.6),


    'pe': classButton(
    link: '',
    title:
    size.width > 600 ? Text("Professional Ethics") : Text("Ethics"),
    width: 0.6),
    };



    switch (day) {
      case "Monday":
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Widget2(time: "8:00 - 8:50", wid: classes['om']),
              Widget2(time: "10:00 - 10:50", wid: classes['bsb']),
              Widget2(time: "11:00 - 11:50", wid: classes['be']),
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
                      "Evening Classes",
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
              Widget2(time: "2:00 - 2:50", wid: classes['dl']),
              Widget2(time: "5:00 - 5:50", wid: classes['pe']),
            ],
          );
        }
        break;
      case "Tuesday":
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Widget2(time: "8:00 - 8:50", wid: classes['mhc']),
              Widget2(time: "10:00 - 10:50", wid: classes['bi']),
              Widget2(time: "11:00 - 11:50", wid: classes['io']),
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
                      "Evening Classes",
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
              Widget2(time: "2:00 - 2:50", wid: classes['dl']),
              Widget2(time: "4:00 - 4:50", wid: classes['ab']),
            ],
          );
        }
        break;
      case "Wednesday":
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Widget2(time: "8:00 - 8:50", wid: classes['om']),
              Widget2(time: "9:00 - 9:50", wid: classes['bi']),
              Widget2(time: "10:00 - 10:50", wid: classes['bsb']),
              Widget2(time: "11:00 - 11:50", wid: classes['be']),
            ],
          );
        }
        break;
      case "Thursday":
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Widget2(time: "8:00 - 8:50", wid: classes['mhc']),
              Widget2(time: "10:00 - 10:50", wid: classes['bsb']),
              Widget2(time: "11:00 - 11:50", wid: classes['io']),
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
                      "Evening Classes",
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
              Widget2(time: "2:00 - 2:50", wid: classes['dl']),
              Widget2(time: "4:00 - 4:50", wid: classes['ab']),
            ],
          );
        }
        break;
      case "Friday":
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Widget2(time: "8:00 - 8:50", wid: classes['om']),
              Widget2(time: "9:00 - 9:50", wid: classes['bi']),
              Widget2(time: "10:00 - 10:50", wid: classes['be']),
              Widget2(time: "11:00 - 11:50", wid: classes['io']),
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
                      "Evening Classes",
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
              Widget2(time: "4:00 - 4:50", wid: classes['ab']),
              Widget2(time: "5:00 - 5:50", wid: classes['mhc'])
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
      {@required this.link, @required this.title, @required this.width});
  final String link;
  final Widget title;
  final double width;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () => launch(link),
        style: OutlinedButton.styleFrom(
          // primary: Colors.blue.shade500,
          // onSurface: Colors.orangeAccent,
            side: BorderSide(color: Colors.black26, width: 1.5),
            // minimumSize: Size(50, 50),
            fixedSize: Size(MediaQuery.of(context).size.width * width, 50),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            textStyle: TextStyle(fontSize: 17)),
        child: title);
  }
}
