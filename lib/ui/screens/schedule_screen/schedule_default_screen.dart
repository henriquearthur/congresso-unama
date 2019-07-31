import 'package:congresso_unama/models/lecture.dart';
import 'package:congresso_unama/services/database_service.dart';
import 'package:congresso_unama/ui/screens/schedule_screen/components/schedule_date_list.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleDefaultScreen extends StatelessWidget {
  final db = DatabaseService();
  final dates = ["25-10-2018", "26-10-2018", "27-10-2018"];

  void _filterSchedule(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Filtrar por área",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 22.0,
                    letterSpacing: -1.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Toque em uma ou mais áreas para visualizar apenas as palestras que lhe interessam.",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                FilterChip(
                  label: Text(
                    "3° Congresso de Arquitetura e Urbanismo",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  backgroundColor: Styles.architectureColor,
                  onSelected: (bool value) {},
                ),
                FilterChip(
                  label: Text(
                    "3º Congresso de Informática",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  backgroundColor: Styles.computingColor,
                  onSelected: (bool value) {},
                ),
                FilterChip(
                  label: Text(
                    "3º Congresso de Engenharia",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  backgroundColor: Styles.engineeringColor,
                  onSelected: (bool value) {},
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Programação',
            style: Styles.appBarTitleText,
          ),
          centerTitle: true,
          bottom: TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(text: "Dia 25"),
              Tab(text: "Dia 26"),
              Tab(text: "Dia 27"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            for (var date in dates)
              StreamProvider<List<Lecture>>.value(
                value: db.streamLectures(date),
                child: ScheduleDateList(date: date),
              ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _filterSchedule(context);
          },
          child: Icon(Icons.filter_list),
        ),
      ),
    );
  }
}
