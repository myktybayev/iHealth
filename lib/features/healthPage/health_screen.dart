import 'package:flutter/material.dart';
import 'package:ihealth/features/healthPage/health_details_screen.dart';
import 'package:ihealth/models/course_item.dart';
import 'package:provider/provider.dart';
import 'package:ihealth/models/course_provider.dart';

class HealthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CourseProvider(),
      child: _HealthScreenContent(),
    );
  }
}

class _HealthScreenContent extends StatefulWidget {
  @override
  __HealthScreenContentState createState() => __HealthScreenContentState();
}

class __HealthScreenContentState extends State<_HealthScreenContent> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var courseProvider = Provider.of<CourseProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  courseProvider.filterSearchResults(value);
                },
                decoration: const InputDecoration(
                  hintText: 'Поиск упражнения...',
                  prefixIcon: Icon(Icons.search, color: Color.fromARGB(255, 0, 0, 0)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFBBF2EF)),
                  ),
                  border: InputBorder.none,
                ),
                cursorColor: Color(0xFFBBF2EF),
              ),
            ),
            Expanded(
              child: Consumer<CourseProvider>(
                builder: (context, courseProvider, child) {
                  return ListView.builder(
                    itemCount: courseProvider.filteredCourses.length,
                    itemBuilder: (context, index) {
                      return CourseItem(
                        course: courseProvider.filteredCourses[index],
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
                              builder: (context) => CourseDetailsScreen(),
                            ),
                          );
                        },
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
