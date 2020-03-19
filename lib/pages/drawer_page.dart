import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  DrawerPageState createState() => DrawerPageState();
}

class DrawerPageState extends State<DrawerPage> {
  List<String> _section2 = ["关于我们", '切换模式', '隐私协议', '用户反馈', '系统设置'];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF252628),
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Color(0xFF363739),
                        ),
                      ),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.send,
                        color: Color(0xFFDCDDDE),
                      ),
                      title: Text(
                        _section2[index],
                        style: TextStyle(
                          color: Color(0xFFDCDDDE),
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF707173),
                      ),
                    ),
                  );
                },
                childCount: _section2.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
