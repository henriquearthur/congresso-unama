import 'package:flutter/material.dart';

class SpeakerImage extends StatelessWidget {
  final String image;
  final double size;

  const SpeakerImage({Key key, this.image, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(size)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color.fromARGB(100, 0, 0, 0),
            offset: Offset(0.0, 3.0),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: new BorderRadius.circular(size),
        // TODO: Add default image
        child: (image.isNotEmpty)
            ? Image.network(
                image,
                height: 50.0,
                width: 50.0,
              )
            : Placeholder(),
      ),
    );
  }
}
