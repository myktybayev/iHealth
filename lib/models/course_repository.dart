class Course {
  final String title;
  final int progress;
  final String imageUrl;

  Course(this.title, this.progress, this.imageUrl);
}

class CourseRepository {
  static List<Course> getCourses() {
    return [
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
  }
}

