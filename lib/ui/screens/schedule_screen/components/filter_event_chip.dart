import 'package:congresso_unama/blocs/congress_filter/bloc.dart';
import 'package:congresso_unama/models/congress.dart';
import 'package:congresso_unama/ui/utils/get_congress_color.dart';
import 'package:congresso_unama/ui/utils/get_congress_short_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterEventChip extends StatelessWidget {
  final String congressId;

  const FilterEventChip({Key key, this.congressId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final congressFilterBloc = BlocProvider.of<CongressFilterBloc>(context);

    return BlocBuilder<CongressFilterBloc, CongressFilterState>(
      builder: (context, state) {
        if (state is CongressesLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CongressesLoaded) {
          return FilterChip(
            label: Text(
              getCongressShortName(congressId),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            backgroundColor: getCongressColor(congressId).withAlpha(150),
            selectedColor: getCongressColor(congressId),
            selected: state.congresses.contains(Congress(id: congressId)),
            onSelected: (bool value) {
              if (value) {
                congressFilterBloc.dispatch(AddCongress(congressId));
              } else {
                if (state.congresses.length > 1) {
                  congressFilterBloc.dispatch(DeleteCongress(congressId));
                }
              }
            },
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
