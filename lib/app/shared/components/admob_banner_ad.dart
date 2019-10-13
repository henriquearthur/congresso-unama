import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';

class AdmobBannerAd extends StatefulWidget {
  final String adUnit;

  const AdmobBannerAd({Key key, @required this.adUnit}) : super(key: key);

  @override
  _AdmobBannerAdState createState() => _AdmobBannerAdState();
}

class _AdmobBannerAdState extends State<AdmobBannerAd>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return AdmobBanner(
      adUnitId: widget.adUnit,
      adSize: AdmobBannerSize.BANNER,
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        switch (event) {
          case AdmobAdEvent.loaded:
            print('Admob banner loaded!');
            break;

          case AdmobAdEvent.opened:
            print('Admob banner opened!');
            break;

          case AdmobAdEvent.closed:
            print('Admob banner closed!');
            break;

          case AdmobAdEvent.failedToLoad:
            print(
                'Admob banner failed to load. Error code: ${args['errorCode']}');
            break;

          default:
            print('Ended up in default.');
            break;
        }
      },
    );
  }
}
