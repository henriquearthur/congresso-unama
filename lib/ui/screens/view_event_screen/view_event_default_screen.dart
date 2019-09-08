import 'package:cached_network_image/cached_network_image.dart';
import 'package:congresso_unama/models/congress.dart';
import 'package:congresso_unama/ui/screens/view_event_screen/components/event_info_title.dart';
import 'package:congresso_unama/ui/screens/view_event_screen/components/speakers_list.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';

class ViewEventDefaultScreen extends StatelessWidget {
  final Congress congress;

  const ViewEventDefaultScreen({Key key, this.congress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 180.0,
              floating: false,
              pinned: true,
              backgroundColor: congress.color,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  congress.shortestName,
                  style:
                      Styles.appBarPageTitleText.copyWith(color: Colors.white),
                ),
                background: Stack(
                  children: <Widget>[
                    Image(
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                      height: 180.0 + 24.0,
                      image: CachedNetworkImageProvider(congress.image),
                    ),
                    Container(
                      height: 180.0 + 24.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.1),
                            congress.color.withOpacity(0.8),
                          ],
                          stops: [0.0, 1.0],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Theme(
          data: Theme.of(context).copyWith(accentColor: congress.color),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          EventInfoTitle(title: "Sobre o evento"),
                          Text(
                            congress.description,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14.0,
                            ),
                          ),
                          SpeakersList(congress: congress),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
