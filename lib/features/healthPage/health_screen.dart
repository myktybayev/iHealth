import 'package:flutter/material.dart';
import 'package:ihealth/features/healthPage/health_details_screen.dart';

class Course {
  final String title;
  final int progress;
  bool isSaved;
  final String imageUrl;

  Course(this.title, this.progress, this.imageUrl, {this.isSaved = false});
}

class HealthScreen extends StatefulWidget {
  @override
  _HealthScreenState createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  final List<Course> courses = [
    Course('Упражнения с гантелями/ утяжелителями', 60,
        'https://sojmarket.ru/upload/medialibrary/d81/d8kaou7bbsm9ejf0qvr3l523fw3ldlsx.png'),
    Course('Разминка', 40, 
        'https://thumb.tildacdn.com/tild3064-3734-4036-b864-656461666633/-/format/webp/1_1.jpg'),
    Course('Упражнения растяжка заминка', 20,
        'https://sojmarket.ru/upload/medialibrary/36e/ptb1tryh9p8wbic04e8qth72cbjqpqkv.png'),
    Course('Упражнения спина,ноги', 60,
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzYhYiJtkvSsW0gMWt8EdI46Nl9zXXdiQUjg&usqp=CAU'),
    Course('Упражнения верх тела', 40,
        'https://sojmarket.ru/upload/medialibrary/3d9/pce4qu1l9z2xuwd8pkxamocz44s08th9.png'),
    Course('Упражнения все тело - фулбоди', 20,
        'https://bubnovsky.ua/wp-content/uploads/elementor/thumbs/bubnovskyi-hymnastyka-pgxdp85xbhiwal4r5enoq1tv9hwnyety3gy1ot0ne8.png'),
  ];

  List<Course> filteredCourses = [];

  @override
  void initState() {
    super.initState();
    filteredCourses.addAll(courses);
  }

  void filterSearchResults(String query) {
    List<Course> searchResults = [];
    searchResults.addAll(courses);

    if (query.isNotEmpty) {
      searchResults.retainWhere(
          (course) => course.title.toLowerCase().contains(query.toLowerCase()));
    }

    searchResults.sort((a, b) {
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

    setState(() {
      filteredCourses.clear();
      filteredCourses.addAll(searchResults);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                decoration: const InputDecoration(
                  hintText: 'Поиск упражнения...',
                  prefixIcon:
                      Icon(Icons.search, color: Color.fromARGB(255, 0, 0, 0)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFBBF2EF)),
                  ),
                  border: InputBorder.none,
                ),
                cursorColor: Color(0xFFBBF2EF),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCourses.length,
                itemBuilder: (context, index) {
                  return CourseItem(
                    course: filteredCourses[index],
                    onCoursePressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HealthScreen(),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CourseDetailsScreen(
                              // course: filteredCourses[index],
                              ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseItem extends StatelessWidget {
  final Course course;
  final VoidCallback onCoursePressed;

  const CourseItem({
    super.key,
    required this.course,
    required this.onCoursePressed,
  });

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
