import 'package:congresso_unama/ui/screens/undergrads_screen/components/paper_item.dart';
import 'package:congresso_unama/ui/shared_components/fab_open_filter.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';

class UndergradsDefaultScreen extends StatefulWidget {
  @override
  _UndergradsDefaultScreenState createState() =>
      _UndergradsDefaultScreenState();
}

class _UndergradsDefaultScreenState extends State<UndergradsDefaultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.primaryColor,
        title: Text(
          'Trabalhos submetidos',
          style: Styles.appBarTitleText,
        ),
        iconTheme: IconThemeData(color: Styles.appBarIconColor),
        centerTitle: true,
      ),
      body: ListView.separated(
        key: PageStorageKey("UndergradsDefaultScreen"),
        separatorBuilder: (context, index) => Divider(height: 0.0),
        itemCount: 3,
        itemBuilder: (context, index) {
          return PaperItem();
        },
      ),
      floatingActionButton: FabOpenFilter(),
    );
  }
}
