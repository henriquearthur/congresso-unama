import 'package:congresso_unama/blocs/congress_filter/bloc.dart';
import 'package:congresso_unama/models/congress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterEventChip extends StatelessWidget {
  final Congress congress;

  const FilterEventChip({Key key, this.congress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final congressFilterBloc = BlocProvider.of<CongressFilterBloc>(context);

    return BlocBuilder<CongressFilterBloc, CongressFilterState>(
      builder: (context, state) {
        if (state is CongressesLoaded) {
          return FilterChip(
            label: Text(
              congress.shortestName,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            backgroundColor: congress.color.withAlpha(150),
            selectedColor: congress.color,
            selected: state.congresses.contains(congress.id),
            onSelected: (bool value) {
              if (value) {
                congressFilterBloc.dispatch(AddCongress(congress.id));
              } else {
                if (state.congresses.length > 1) {
                  congressFilterBloc.dispatch(DeleteCongress(congress.id));
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
