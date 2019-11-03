import 'package:congresso_unama/app/pages/schedule/schedule_bloc.dart';
import 'package:congresso_unama/app/pages/schedule/schedule_module.dart';
import 'package:congresso_unama/app/shared/theme/styles.dart';
import 'package:flutter/material.dart';

class FilterLectureChip extends StatelessWidget {
  final String tag;
  final _scheduleBloc = ScheduleModule.to.getBloc<ScheduleBloc>();

  FilterLectureChip({Key key, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<String>>(
      stream: _scheduleBloc.filterOut,
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.hasData) {
          List<String> currentTags = snapshot.data;

          return FilterChip(
            label: Text(
              tag,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.grey,
            selectedColor: Styles.primaryColor,
            selected: currentTags.contains(tag),
            onSelected: (bool value) async {
              List<String> newTags = currentTags.toList();

              if (value) {
                newTags.add(tag);
              } else {
                if (newTags.length > 1) newTags.remove(tag);
              }

              _scheduleBloc.filterIn.add(newTags);
              _scheduleBloc.saveTags(newTags);
            },
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
