import 'package:flutter/material.dart';

class CongressBanner extends StatelessWidget {
  final ImageProvider image;
  final String heroTag;
  final VoidCallback onTap;

  const CongressBanner({Key key, this.image, this.onTap, this.heroTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 20 / 9,
        child: Hero(
          tag: heroTag,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: image,
              ),
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
