import 'package:flutter/material.dart';
import 'package:ihealth/models/course_repository.dart';

class CourseItem extends StatelessWidget {
  final Course course;
  final VoidCallback onCoursePressed;

  const CourseItem({
    Key? key,
    required this.course,
    required this.onCoursePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCoursePressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(course.imageUrl),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.3),
                    BlendMode.lighten,
                  ),
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            Text(
              course.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
            LinearProgressIndicator(
              value: course.progress / 100,
              backgroundColor: Colors.grey,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(Color(0xFFBBF2EF)),
            ),
          ],
        ),
      ),
    );
  }
}
