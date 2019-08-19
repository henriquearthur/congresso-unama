import 'package:congresso_unama/blocs/congress_filter/bloc.dart';
import 'package:congresso_unama/navigation/destination/destination.dart';
import 'package:congresso_unama/navigation/destination/destination_view.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with TickerProviderStateMixin<App> {
  List<GlobalKey<NavigatorState>> _navigatorKeys;
  List<Key> _destinationKeys;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _navigatorKeys = List<GlobalKey<NavigatorState>>.generate(
        allDestinations.length, (int index) => GlobalKey()).toList();
    _destinationKeys =
        List<Key>.generate(allDestinations.length, (int index) => GlobalKey())
            .toList();
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
      child: Scaffold(
        body: BlocProvider(
          builder: (context) {
            CongressFilterBloc congressFilterBloc = CongressFilterBloc();
            congressFilterBloc.dispatch(LoadCongresses());

            return congressFilterBloc;
          },
          child: SafeArea(
            top: false,
            child: Container(
              child: Stack(
                fit: StackFit.expand,
                children: allDestinations.map((Destination destination) {
                  final Widget view = KeyedSubtree(
                    key: _destinationKeys[destination.index],
                    child: DestinationView(
                      destination: destination,
                      navigatorKey: _navigatorKeys[destination.index],
                    ),
                  );
                  if (destination.index == _currentIndex) {
                    return view;
                  } else {
                    return Offstage(child: view);
                  }
                }).toList(),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          selectedItemColor: Styles.primaryColor,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
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
    );
  }
}
