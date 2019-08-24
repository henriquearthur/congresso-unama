import 'package:congresso_unama/blocs/congress_filter/congress_filter_bloc.dart';
import 'package:congresso_unama/blocs/paper/bloc.dart';
import 'package:congresso_unama/blocs/paper/paper_bloc.dart';
import 'package:congresso_unama/repositories/paper_repository.dart';
import 'package:congresso_unama/ui/screens/undergrads_screen/components/paper_item.dart';
import 'package:congresso_unama/ui/screens/undergrads_screen/components/paper_loading_list.dart';
import 'package:congresso_unama/ui/shared_components/fab_open_filter.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          'Trabalhos de Congressistas',
          style: Styles.appBarTitleText,
        ),
        iconTheme: IconThemeData(color: Styles.appBarIconColor),
        centerTitle: true,
      ),
      body: BlocProvider(
        builder: (context) {
          PaperBloc paperBloc = PaperBloc(
            paperRepository: PaperRepository(),
            filterBloc: BlocProvider.of<CongressFilterBloc>(context),
            date:
                "26-10-2018", // All papers on 3 congresses are presented on same date
          );

          paperBloc.dispatch(LoadPapers());

          return paperBloc;
        },
        child: BlocBuilder<PaperBloc, PaperState>(
          builder: (context, state) {
            if (state is InitialPaperState) {
              return PaperLoadingList();
            } else if (state is LoadingPapersState) {
              return PaperLoadingList();
            } else if (state is LoadedPapersState) {
              return ListView.separated(
                key: PageStorageKey("UndergradsDefaultScreen"),
                separatorBuilder: (context, index) => Divider(height: 0.0),
                itemCount: state.papers.length,
                itemBuilder: (context, index) {
                  PaperItem paperItem = PaperItem(paper: state.papers[index]);

                  if (index == 0) {
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: RichText(
                            text: TextSpan(
                              text:
                                  'Os trabalhos científicos abaixo foram submetidos por congressistas e aprovados pela Comissão Científica do Congresso. A apresentação de cada trabalho por seus respectivos autores é realizada por meio de ',
                              style: DefaultTextStyle.of(context)
                                  .style
                                  .copyWith(color: Colors.grey[600]),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'pôster ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                                TextSpan(text: 'ou '),
                                TextSpan(
                                    text: 'apresentação oral.',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ),
                        paperItem,
                      ],
                    );
                  }

                  return paperItem;
                },
              );
            }

            return PaperLoadingList();
          },
        ),
      ),
      floatingActionButton: FabOpenFilter(),
    );
  }
}
