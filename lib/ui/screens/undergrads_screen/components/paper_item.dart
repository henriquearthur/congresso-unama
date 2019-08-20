import 'package:congresso_unama/models/paper.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:congresso_unama/ui/utils/get_congress_color.dart';
import 'package:congresso_unama/ui/utils/get_congress_link.dart';
import 'package:congresso_unama/ui/utils/get_congress_name.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class PaperItem extends StatelessWidget {
  final Paper paper;

  const PaperItem({Key key, this.paper}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                paper.hourStart,
                style: TextStyle(
                    color: Styles.scheduleScreenColor, fontSize: 18.0),
              ),
              SizedBox(height: 5.0),
              Text("até"),
              SizedBox(height: 5.0),
              Text(
                paper.hourEnd,
                style: TextStyle(
                    color: Styles.scheduleScreenColor, fontSize: 18.0),
              ),
              SizedBox(height: 15.0),
              IconButton(
                onPressed: () {
                  print(
                      "Confira ${paper.title} no ${getCongressName(paper.congress)} de ${paper.hourStart} até ${paper.hourEnd} com ${paper.students.join(', ')}! Saiba mais em ${getCongressLink(paper.congress)}");
                  Share.share(
                      "Confira ${paper.title} no ${getCongressName(paper.congress)} de ${paper.hourStart} até ${paper.hourEnd} com ${paper.students.join(', ')}! Saiba mais em ${getCongressLink(paper.congress)}");
                },
                icon: Icon(
                  Icons.share,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          SizedBox(width: 30.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  paper.title,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  paper.type + " por:",
                  style: TextStyle(color: Colors.grey[500]),
                ),
                for (var student in paper.students)
                  Text(student, style: TextStyle(color: Colors.grey[600])),
                SizedBox(height: 10.0),
                RichText(
                  text: TextSpan(
                    text: 'Local de apresentaçao:\n',
                    style: DefaultTextStyle.of(context)
                        .style
                        .apply(color: Colors.grey[600]),
                    children: <TextSpan>[
                      TextSpan(
                        text: paper.location,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(text: " (${paper.presentationMethod})"),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Chip(
                  label: Text(
                    getCongressName(paper.congress),
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  backgroundColor: getCongressColor(paper.congress),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
