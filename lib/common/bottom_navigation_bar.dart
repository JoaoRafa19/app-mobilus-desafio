import 'package:covid_status/screens/historico%20de%20medias/historico_medias.dart';
import 'package:covid_status/screens/media/pagina_media_movel.dart';
import 'package:covid_status/screens/historicodados/historicodados.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatefulWidget {
  CustomBottomNavigation({Key key}) : super(key: key);

  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Media(),
    HistoricoDados(), // Container(),
    HistoricoMedias(),
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
          backgroundColor: Color(0xFFBDAED6),
          unselectedItemColor: Colors.black26,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.data_usage_rounded),
                label: 'Histórico de Dados'),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.bar_chart),
            //   label: 'Gráficos',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_rounded),
              label: 'Histórico de médias',
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
