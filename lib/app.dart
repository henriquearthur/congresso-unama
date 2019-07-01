import 'package:congresso_unama/ui/screens/location/location-screen.dart';
import 'package:congresso_unama/ui/screens/main/main-screen.dart';
import 'package:congresso_unama/ui/screens/schedule/schedule-screen.dart';
import 'package:congresso_unama/ui/screens/undergrads/undergrads-screen.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  final List<Widget> screensList = <Widget>[
    MainScreen(),
    ScheduleScreen(),
    UndergradsScreen(),
    LocationScreen(),
  ];

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  Color _currentColor = Colors.green;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 0) {
        _currentColor = Colors.cyan;
      } else if (index == 1) {
        _currentColor = Colors.green;
      } else if (index == 2) {
        _currentColor = Colors.orange;
      } else if (index == 3) {
        _currentColor = Colors.red[300];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5, 0.9],
          colors: [
            Colors.grey[50],
            Colors.grey[100],
            Colors.grey[200],
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: widget.screensList.elementAt(_selectedIndex),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40.0),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0.0,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              selectedItemColor: _currentColor,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: SizedBox.shrink(),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  title: SizedBox.shrink(),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  title: SizedBox.shrink(),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.location_on),
                  title: SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
