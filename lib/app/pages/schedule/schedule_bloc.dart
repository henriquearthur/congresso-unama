import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:congresso_unama/app/shared/models/lecture.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScheduleBloc extends BlocBase {
  BehaviorSubject<List<String>> _filterController =
      BehaviorSubject<List<String>>.seeded([]);
  Observable<List<String>> get filterOut => _filterController.stream;
  Sink<List<String>> get filterIn => _filterController.sink;

  List<String> tags;

  @override
  void dispose() {
    _filterController.close();
    super.dispose();
  }

  List<String> extractTags(List<Lecture> lectures) {
    if (tags == null) {
      List<String> tagsList = [];

      if (lectures.where((lecture) => lecture.tag != null).length > 0) {
        Set<String> tagsSet = {};
        lectures.forEach((l) =>
            l.tag != null && l.tag.isNotEmpty ? tagsSet.add(l.tag) : null);

        tagsList = tagsSet.toList();
        tagsList.sort();
      }

      tags = tagsList;

      getTags(tagsList);
    }

    return tags;
  }

  Future<List<String>> getTags(List<String> defaultTags) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tags;

    if (prefs.containsKey('lectures_tags')) {
      tags = prefs.getStringList('lectures_tags');
    } else {
      tags = defaultTags;
    }

    filterIn.add(tags);

    return tags;
  }

  Future saveTags(List<String> tags) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('lectures_tags', tags);
  }
}
