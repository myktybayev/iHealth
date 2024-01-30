import 'package:flutter/material.dart';
import 'course_repository.dart';

class CourseProvider extends ChangeNotifier {
  List<Course> courses = [];
  List<Course> filteredCourses = [];

  CourseProvider() {
    getCourses();
  }

  void getCourses() {
    courses = CourseRepository.getCourses();
    filteredCourses.addAll(courses);
  }

  void filterSearchResults(String query) {
    filteredCourses.clear();
    filteredCourses.addAll(courses);

    if (query.isNotEmpty) {
      filteredCourses.retainWhere(
          (course) => course.title.toLowerCase().contains(query.toLowerCase()));
    }

    filteredCourses.sort((a, b) {
      List<String> priorityCourses = [
        'Упражнения с гантелями/ утяжелителями',
        'Упражнения растяжка заминка',
        'Упражнения спина,ноги',
      ];

      if (priorityCourses.contains(a.title) &&
          !priorityCourses.contains(b.title)) {
        return -1;
      } else if (!priorityCourses.contains(a.title) &&
          priorityCourses.contains(b.title)) {
        return 1;
      } else {
        return b.progress.compareTo(a.progress);
      }
    });

    notifyListeners();
  }
}
