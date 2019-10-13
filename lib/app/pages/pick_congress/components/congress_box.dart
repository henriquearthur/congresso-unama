import 'package:cached_network_image/cached_network_image.dart';
import 'package:congresso_unama/app/shared/models/congress.dart';
import 'package:congresso_unama/app/shared/theme/styles.dart';
import 'package:flutter/material.dart';

class CongressBox extends StatelessWidget {
  final Congress congress;
  final VoidCallback onTap;

  const CongressBox({Key key, @required this.congress, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: AspectRatio(
            aspectRatio: 20 / 9,
            child: CachedNetworkImage(
              imageUrl: congress.image,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
              ),
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(congress.color),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                decoration: BoxDecoration(
                  color: congress.color.withOpacity(0.2),
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                child: Center(
                  child: Icon(Icons.error),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: onTap,
          child: Text(
            congress.title,
            style: TextStyle(
              color: Styles.primaryColorDark,
              fontSize: 18.0,
              fontWeight: Styles.primaryFontSemiboldWeight,
              letterSpacing: -0.5,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          "de ${congress.getFullDateStart()}",
        ),
        Text(
          "até ${congress.getFullDateEnd()}",
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
