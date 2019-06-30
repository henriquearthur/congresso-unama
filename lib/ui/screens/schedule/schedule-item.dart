import 'package:flutter/material.dart';

class ScheduleItem extends StatelessWidget {
  final String hourStart;
  final String hourEnd;
  final String title;
  final String description;

  const ScheduleItem(
      {Key key, this.hourStart, this.hourEnd, this.title, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  this.hourStart + " até " + this.hourEnd,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16.0,
                  ),
                ),
                Chip(
                  backgroundColor: Colors.green[200],
                  label: Text(
                    'falta 1 hora e 2 minutos',
                    style: TextStyle(fontSize: 12.0),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (title != null)
                        Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Text(
                            this.title,
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontFamily: "Lato",
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      if (description != null)
                        Text(
                          this.description,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontFamily: "Lato",
                            fontSize: 14.0,
                          ),
                        ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                    child: Image.network(
                      "https://eventos.sereduc.com/_image.aspx/CU01lPGvBVqP1bSYmyX2JnsJmCPGGXiTqDHy92sB8jk=/conferencista2049.jpg",
                      fit: BoxFit.cover,
                      width: 50.0,
                      height: 50.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
