import 'package:flutter/material.dart';
import './drawer_page.dart';
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
      backgroundColor: Color(0xFF1E1F20),
      drawer: DrawerPage(),
      appBar: AppBar(
        title: TextFieldWidget(),
        leading: IconButton(
            iconSize: 30,
            icon: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2515232837,4198669243&fm=26&gp=0.jpg'),
            ),
            onPressed: null),
        actions: <Widget>[
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(
                Icons.event_note,
                color: Color(0xFF868788),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return NotifyPage();
                  },
                ),
              );
            },
          )
        ],
        bottom: TabBar(
          controller: _tabCtrl,
          indicatorColor: Colors.red,
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

class TextFieldWidget extends StatelessWidget {
  Widget buildTextField() {
    // theme设置局部主题
    return Theme(
      data: new ThemeData(primaryColor: Colors.grey),
      child: new TextField(
        cursorColor: Colors.grey, // 光标颜色
        // 默认设置
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
          border: InputBorder.none,
          icon: Icon(
            Icons.search,
            color: Color(0xFF868788),
          ),
          hintText: "搜索 flutter 组件",
          hintStyle: new TextStyle(
            fontSize: 14,
            color: Color(0xFF868788),
          ),
        ),
        style: new TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // 修饰搜索框, 白色背景与圆角
      decoration: new BoxDecoration(
        color: Color(0xFF303135),
        borderRadius: new BorderRadius.all(new Radius.circular(18)),
      ),
      alignment: Alignment.center,
      height: 36,
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child: buildTextField(),
    );
  }
}
