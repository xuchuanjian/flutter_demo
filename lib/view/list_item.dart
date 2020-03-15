import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../utils/utils.dart';

class ListItem extends StatelessWidget {
  final ItemModel item;

  ListItem({Key key, @required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color(0xFF232425),
          ),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildContent(),
          ),
          Positioned(
            right: 20,
            bottom: 0,
            child: Text(
              Utils.formatTimestamp(item.publishTime),
              style: TextStyle(color: Colors.white),
            ),
          ),
          Positioned(
            top: 10,
            right: 0,
            child: Text(
              item.source,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildContent() {
    List<Widget> widgets = List();

    widgets.add(
      Row(
        children: <Widget>[
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(item.avatarUrl), fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              item.author,
              style: TextStyle(
                color: Color(0xFF676869),
              ),
            ),
          )
        ],
      ),
    );

    widgets.add(
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          item.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
    widgets.add(
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Text(
          item.content,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
    if (item.imageList != null && item.imageList.length > 0) {
      List<Widget> images = List();
      item.imageList.forEach((value) {
        images.add(
          Container(
            margin: const EdgeInsets.only(bottom: 10, right: 10),
            width: item.imageList.length == 1 ? 80 : 60,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(item.imageList.first.url),
                  fit: BoxFit.fitWidth),
            ),
          ),
        );
      });
      widgets.add(
        Row(
          children: images,
        ),
      );
    }
    widgets.add(
      Row(
        children: <Widget>[
          Icon(
            Icons.comment,
            color: Color(0xFF676869),
            size: 18,
          ),
          Text(
            " ${item.replies}",
            style: TextStyle(
              color: Color(0xFF676869),
            ),
          )
        ],
      ),
    );
    return widgets;
  }
}
