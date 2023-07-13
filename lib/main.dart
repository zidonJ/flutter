import 'package:flutter/material.dart';
import 'package:my_app/chats.dart';
import 'package:my_app/read_book.dart';
import 'package:my_app/video.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Whitney'),
      // routes: <String, WidgetBuilder>{
      //   '/UI01': (BuildContext context) => Ui01(),
      //   '/UI02': (BuildContext context) => Ui02(),
      //   '/ListViewPage': (BuildContext context) => new ListViewPage(),
      //   '/SliverAppBarPage': (BuildContext context) => new SliverAppBarPage(),
      //   '/FlutterHtmlPage': (BuildContext context) => new FlutterHtmlPage(
      //         title: 'flutter_html',
      //       ),
      //   '/DioExercise': (BuildContext context) => new DioExercise(),
      //   '/AudioPlayer': (BuildContext context) => new AudioPlayerDemo(),
      //   '/BottomNavigationBar': (BuildContext context) => new BottomBarIndex(),
      // },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _currentIndex = 0;
  void onTap(int index) {
    _currentIndex = index;
  }

  List<String> titles = ["Chat", "Read", "Video"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   //导航栏
        //   title: Text(titles[_currentIndex]),
        //   actions: <Widget>[
        //     //导航栏右侧菜单
        //     IconButton(
        //         icon: const Icon(Icons.share),
        //         onPressed: () {
        //           print("点击");
        //         }),
        //   ],
        // ),
        // Chats("会话列表")
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.ac_unit), label: titles[0]),
            BottomNavigationBarItem(
                icon: const Icon(Icons.ac_unit_sharp), label: titles[1]),
            BottomNavigationBarItem(
                icon: const Icon(Icons.access_alarm), label: titles[2]),
          ],
          onTap: (value) {
            setState(() => {_currentIndex = value});
          },
          currentIndex: _currentIndex,
        ),
        body: [
          Chats(titles[0]),
          ReadBook(titles[1]),
          WatchVideos(titles[2]),
        ][_currentIndex],
      ),
    );
  }
}
