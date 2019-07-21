import 'package:congresso_unama/ui/destination/destination.dart';
import 'package:congresso_unama/ui/destination/destination_view.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with TickerProviderStateMixin<App> {
  List<AnimationController> _faders;
  List<Key> _destinationKeys;

  int _currentIndex = 0;
  Color _currentColor = Colors.green;

  @override
  void initState() {
    super.initState();

    _faders =
        allDestinations.map<AnimationController>((Destination destination) {
      return AnimationController(
          vsync: this, duration: Duration(milliseconds: 200));
    }).toList();
    _faders[_currentIndex].value = 1.0;
    _destinationKeys =
        List<Key>.generate(allDestinations.length, (int index) => GlobalKey())
            .toList();
  }

  @override
  void dispose() {
    for (AnimationController controller in _faders) controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;

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
        body: Stack(
          fit: StackFit.expand,
          children: allDestinations.map((Destination destination) {
            final Widget view = FadeTransition(
              opacity: _faders[destination.index]
                  .drive(CurveTween(curve: Curves.fastOutSlowIn)),
              child: KeyedSubtree(
                key: _destinationKeys[destination.index],
                child: DestinationView(
                  destination: destination,
                ),
              ),
            );
            if (destination.index == _currentIndex) {
              _faders[destination.index].forward();
              return view;
            } else {
              _faders[destination.index].reverse();
              if (_faders[destination.index].isAnimating) {
                return IgnorePointer(child: view);
              }
              return Offstage(child: view);
            }
          }).toList(),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40.0),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0.0,
              currentIndex: _currentIndex,
              onTap: _onItemTapped,
              selectedItemColor: _currentColor,
              items: allDestinations.map((Destination destination) {
                return BottomNavigationBarItem(
                  icon: Icon(destination.icon),
                  title: SizedBox.shrink(),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
