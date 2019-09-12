import 'package:congresso_unama/blocs/congress_filter/congress_filter_bloc.dart';
import 'package:congresso_unama/blocs/information/bloc.dart';
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
  String getDayFromDate(String dateUndergrads) {
    return dateUndergrads.split('-')[0];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InformationBloc, InformationState>(
      builder: (context, informationState) {
        if (informationState is LoadedInformationState) {
          return BlocProvider(
            builder: (context) {
              PaperBloc paperBloc = PaperBloc(
                paperRepository: PaperRepository(),
                filterBloc: BlocProvider.of<CongressFilterBloc>(context),
                date: informationState.information
                    .dateUndergrads, // All papers from all congresses are presented on same date
              );

              paperBloc.dispatch(LoadPapers());

              return paperBloc;
            },
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Styles.primaryColor,
                title: Text(
                  'Trabalhos de Congressistas',
                  style: Styles.appBarTitleText,
                ),
                iconTheme: IconThemeData(color: Styles.appBarIconColor),
                centerTitle: true,
              ),
              body: BlocBuilder<PaperBloc, PaperState>(
                builder: (context, state) {
                  if (state is LoadedPapersState) {
                    if (state.papers.length == 0) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Text(
                              "Os trabalhos aprovados de congressistas ainda não foram divulgados.\n\nTente novamente em outro momento.",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return ListView.separated(
                        key: PageStorageKey("UndergradsDefaultScreen"),
                        separatorBuilder: (context, index) =>
                            Divider(height: 0.0),
                        itemCount: state.papers.length,
                        itemBuilder: (context, index) {
                          PaperItem paperItem =
                              PaperItem(paper: state.papers[index]);

                          if (index == 0) {
                            return Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: <Widget>[
                                      RichText(
                                        text: TextSpan(
                                          text:
                                              'Os trabalhos científicos abaixo foram submetidos por congressistas e aprovados pela Comissão Científica do Congresso. A apresentação de cada trabalho por seus respectivos autores é realizada por meio de ',
                                          style: DefaultTextStyle.of(context)
                                              .style
                                              .copyWith(
                                                  color: Colors.grey[600]),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'pôster ',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            TextSpan(text: 'ou '),
                                            TextSpan(
                                                text: 'apresentação oral.',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            TextSpan(
                                                text:
                                                    '\n\nTodas as apresentações serão em um único dia.'),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20.0),
                                      Text(
                                        "Dia ${getDayFromDate(informationState.information.dateUndergrads)}",
                                        style: TextStyle(
                                          color: Styles.primaryColor,
                                          fontSize: 24.0,
                                        ),
                                      ),
                                    ],
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
                  }

                  return PaperLoadingList();
                },
              ),
              floatingActionButton: BlocBuilder<PaperBloc, PaperState>(
                builder: (context, state) {
                  if (state is LoadedPapersState && state.papers.length > 0) {
                    return FabOpenFilter();
                  }

                  return SizedBox.shrink();
                },
              ),
            ),
          );
        }

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
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
