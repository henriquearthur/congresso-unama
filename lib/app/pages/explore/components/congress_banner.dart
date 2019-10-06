import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CongressBanner extends StatelessWidget {
  final String imageUrl;
  final Color color;
  final VoidCallback onTap;

  const CongressBanner({Key key, this.imageUrl, this.color, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 20 / 9,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
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
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
            child: Center(
              child: Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
