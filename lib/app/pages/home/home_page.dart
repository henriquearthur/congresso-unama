import 'package:congresso_unama/app/pages/home/home_bloc.dart';
import 'package:congresso_unama/app/pages/home/home_module.dart';
import 'package:congresso_unama/app/pages/pick_congress/pick_congress_module.dart';
import 'package:congresso_unama/app/shared/theme/styles.dart';
import 'package:flutter/material.dart';

import 'helpers/destination.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc _homeBloc = HomeModule.to.bloc<HomeBloc>();

  int _selectedIndex = 0;
  List<GlobalKey<NavigatorState>> _navigatorKeys;
  final _bottomBarViews = Map<int, Widget>();

  @override
  void initState() {
    super.initState();

    _navigatorKeys = List<GlobalKey<NavigatorState>>.generate(
        allDestinations.length, (int index) => GlobalKey()).toList();

    _homeBloc.mustSelectCongressOut.listen((mustSelectCongress) {
      if (mustSelectCongress) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => PickCongressModule()),
        );
      }
    });
  }

  Widget _buildOffstageNavigator(int viewIndex) {
    return Offstage(
      offstage: _selectedIndex != viewIndex,
      child: Navigator(
        key: _navigatorKeys[viewIndex],
        onGenerateRoute: (routeSettings) => MaterialPageRoute(
          builder: (context) {
            // Return the current view if it has to be show or if it is
            // present in _bottomBarViews. Otherwise return an empty
            // Container.
            if (_selectedIndex == viewIndex ||
                _bottomBarViews[viewIndex] != null) {
              return _bottomBarViews.putIfAbsent(
                viewIndex,
                () => allDestinations[viewIndex].screen(context),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_selectedIndex].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_selectedIndex != 0) {
            // select 'main' tab
            setState(() => _selectedIndex = 0);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            for (var i = 0; i < allDestinations.length; i++)
              _buildOffstageNavigator(i)
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Styles.primaryColor,
          unselectedItemColor: Styles.bottomNavigationBarIconColor,
          onTap: (int index) => setState(() => _selectedIndex = index),
          items: allDestinations.map((Destination destination) {
            return BottomNavigationBarItem(
              icon: Icon(destination.icon),
              title: Text(
                destination.title,
                style: Styles.bottomNavigationBarTitleText,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
