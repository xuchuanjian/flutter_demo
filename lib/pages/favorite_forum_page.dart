import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/forum_model.dart';

class FavoriteForumPage extends StatefulWidget {
  FavoriteForumPageState createState() => FavoriteForumPageState();
}

class FavoriteForumPageState extends State<FavoriteForumPage> {
  List<ForumModel> _models = List();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF010203),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int position) {
                return Text(position.toString(), style: TextStyle(color: Colors.white),);
              }, childCount: 1),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                
                 ),
                
              
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext ctx, int index) {
                return GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF1E1F20),
                      border: Border(
                        bottom: BorderSide(width: 10, color: Color(0xFF010203)),
                      ),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(_models[index].forumIcon),
                      ),
                      title: Text(
                        _models[index].forumName,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Container(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '主题: ${formatCount(_models[index].threads)}',
                              style: _subTitleTextStyle(),
                            ),
                            Text(
                              '帖子: ${formatCount(_models[index].posts)}',
                              style: _subTitleTextStyle(),
                            ),
                          ],
                        ),
                      ),
                      trailing: RaisedButton(
                        onPressed: null,
                        child: Container(
                          child: Text(
                            _models[index].forumType == 1 ? "取消关注" : "关注",
                            style: TextStyle(color: Color(0xFF7B7C7D)),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: _models.length,
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  String formatCount(int count) {
    if (count < 10000) {
      return count.toString();
    }
    return (count / 10000).toString() + '万';
  }

  TextStyle _subTitleTextStyle() {
    return TextStyle(
      color: Color(0xFF7B7C7D),
      fontSize: 12,
    );
  }

  void _fetchData() {
    rootBundle.loadString("assets/favoriteForum.json").then((value) {
      List list = json.decode(value)["data"]["list"];
      setState(() {
        _models = list.map((value) {
          return ForumModel.fromJson(value);
        }).toList();
      });
    });
  }
}
