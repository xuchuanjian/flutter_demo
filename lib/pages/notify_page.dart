import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/notify_item.dart';

class NotifyPage extends StatefulWidget {
  NotifyPageState createState() => NotifyPageState();
}

class NotifyPageState extends State<NotifyPage> {
  List<NotifyItemModel> _models = List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1F20),
      appBar: AppBar(
        title: Text('消息通知'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          NotifyItemModel model = _models[index];
          // Color(0xFF1E1F20)
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  formatCreateTime(model.createTime),
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        model.title,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(width: 1, color: Color(0xFF232425)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        model.content,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        itemCount: _models.length,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  String formatCreateTime(String create) {
    int time = int.parse(create);
    var dateTime = DateTime.fromMillisecondsSinceEpoch(time);
    return '${dateTime.year}-${dateTime.month}-${dateTime.day}';
  }

  void _fetchData() {
    rootBundle.loadString('assets/notify_list.json').then((value) {
      List list = json.decode(value)['data']['list'];
      setState(() {
        _models = list.map((value) {
          return NotifyItemModel.fromJson(value);
        }).toList();
      });
      print(value);
    });
  }
}
