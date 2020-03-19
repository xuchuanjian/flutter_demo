import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/item_model.dart';
import '../view/list_item.dart';
import '../models/daren_speak_model.dart';
import '../models/chat_model.dart';

class RecommendPage extends StatefulWidget {
  RecommendPageState createState() => RecommendPageState();
}

class RecommendPageState extends State<RecommendPage> {
  List<ItemModel> _models = List();
  List<DarenSpeakModel> _darenSpeaks = List();
  List<ChatModel> _chatModel = List();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF0E1417),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              color: Color(0xFF1E1F20),
              width: double.infinity,
              padding: const EdgeInsets.only(left: 5),
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      '达人观点',
                      style: TextStyle(color: Color(0xFFDADBDC), fontSize: 18),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return _buildDarenSpeakItem(_darenSpeaks[index]);
                      },
                      itemCount: _darenSpeaks.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              '达人观点',
              style: TextStyle(color: Color(0xFFDADBDC), fontSize: 18),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(5),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 20.0,
                childAspectRatio: 7.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return _buildChatItem(_chatModel[index]);
                },
                childCount: _chatModel.length,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 10),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return GestureDetector(
                child: ListItem(item: _models[index]),
                onTap: () {
                  print(_models[index].author);
                },
              );
            }, childCount: _models.length),
          )
        ],
      ),
    );
  }

  Widget _buildChatItem(ChatModel model) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Color(0xFF303135),
        borderRadius: BorderRadius.circular(5),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        '#${model.subject}',
        style: TextStyle(color: Colors.blue),
      ),
    );
  }

  Widget _buildDarenSpeakItem(DarenSpeakModel model) {
    return Card(
      color: Color(0xFF303135),
      child: Container(
        padding: const EdgeInsets.all(5),
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Text(
                model.subject,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundImage: NetworkImage(model.avatarUrl),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        model.author,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        model.darenIntro,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() {
    rootBundle.loadString('assets/recommend.json').then(
      (value) {
        List list = json.decode(value)["data"]["list"];
        setState(() {
          _models = list.map((value) {
            return ItemModel.fromJson(value);
          }).toList();
        });
      },
    );
    rootBundle.loadString('assets/daren_speak.json').then(
      (value) {
        List list = json.decode(value)["data"]["list"];
        print(list);
        setState(() {
          _darenSpeaks =
              list.map((value) => DarenSpeakModel.fromJson(value)).toList();
        });
      },
    );
    rootBundle.loadString('assets/chat.json').then(
      (value) {
        List list = json.decode(value)["data"]["list"];
        print(list);
        setState(() {
          _chatModel = list.map((value) => ChatModel.fromJson(value)).toList();
        });
      },
    );
  }
}
