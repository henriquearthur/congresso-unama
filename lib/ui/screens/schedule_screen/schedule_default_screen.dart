import 'package:congresso_unama/blocs/congress_schedule_filter/bloc.dart';
import 'package:congresso_unama/ui/screens/schedule_screen/components/schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleDefaultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) {
        CongressScheduleFilterBloc congressScheduleFilterBloc =
            CongressScheduleFilterBloc();
        congressScheduleFilterBloc.dispatch(LoadCongresses());

        return congressScheduleFilterBloc;
      },
      child: ScheduleScreen(),
    );
  }
}
