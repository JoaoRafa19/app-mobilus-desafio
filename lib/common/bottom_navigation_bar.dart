import 'package:covid_status/screens/media/pagina_media_movel.dart';
import 'package:covid_status/screens/medias_solicitadas/medias_solicitadas.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatefulWidget {
  CustomBottomNavigation({Key key}) : super(key: key);

  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Media(),
    MediasSolicitadas(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      minimum: EdgeInsets.only(top: 25),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Covid Status',
          ),
          centerTitle: true,
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.data_usage), label: 'Data'),
            BottomNavigationBarItem(
              icon: Icon(Icons.stacked_line_chart),
              label: 'Chart',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
