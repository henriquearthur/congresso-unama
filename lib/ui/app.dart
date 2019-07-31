import 'package:congresso_unama/navigation/destination/destination.dart';
import 'package:congresso_unama/navigation/destination/destination_view.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with TickerProviderStateMixin<App> {
  List<AnimationController> _faders;
  List<GlobalKey<NavigatorState>> _navigatorKeys;
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
    _navigatorKeys = List<GlobalKey<NavigatorState>>.generate(
        allDestinations.length, (int index) => GlobalKey()).toList();
    _destinationKeys =
        List<Key>.generate(allDestinations.length, (int index) => GlobalKey())
            .toList();
  }

  @override
  void dispose() {
    for (AnimationController controller in _faders) controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final NavigatorState navigator =
            _navigatorKeys[_currentIndex].currentState;
        if (!navigator.canPop()) return true;
        navigator.pop();
        return false;
      },
      child: Container(
        child: Scaffold(
          body: SafeArea(
            top: false,
            child: Container(
              child: Stack(
                fit: StackFit.expand,
                children: allDestinations.map((Destination destination) {
                  final Widget view = FadeTransition(
                    opacity: _faders[destination.index]
                        .drive(CurveTween(curve: Curves.fastOutSlowIn)),
                    child: KeyedSubtree(
                      key: _destinationKeys[destination.index],
                      child: DestinationView(
                        destination: destination,
                        navigatorKey: _navigatorKeys[destination.index],
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
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            selectedItemColor: _currentColor,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;

                if (index == 0) {
                  _currentColor = Styles.mainScreenColor;
                } else if (index == 1) {
                  _currentColor = Styles.scheduleScreenColor;
                } else if (index == 2) {
                  _currentColor = Styles.undergradsScreenColor;
                } else if (index == 3) {
                  _currentColor = Styles.locationScreenColor;
                }
              });
            },
            items: allDestinations.map((Destination destination) {
              return BottomNavigationBarItem(
                icon: Icon(destination.icon),
                title: SizedBox.shrink(),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
