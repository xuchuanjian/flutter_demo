import 'package:flutter/material.dart';
import './home_page.dart';
import './focus_page.dart';
import './recommend_page.dart';
import './favorite_forum_page.dart';
import './notify_page.dart';

class MainPage extends StatefulWidget {
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController _tabCtrl;

  FocusPage focusPage = FocusPage();
  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: 3, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text("tes"),
        actions: <Widget>[
          Icon(Icons.linear_scale),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.line_weight),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NotifyPage();
              }));
            },
          )
        ],
        bottom: TabBar(
          controller: _tabCtrl,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: <Widget>[
            Tab(text: "关注"),
            Tab(text: "推荐"),
            Tab(text: "版区"),
          ],
        ),
      ),
      body: TabBarView(controller: _tabCtrl, children: <Widget>[
        FocusPage(),
        RecommendPage(),
        FavoriteForumPage()
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('發帖');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Icon(Icons.mode_edit), Text('發帖')],
        ),
      ),
    );
  }
}
