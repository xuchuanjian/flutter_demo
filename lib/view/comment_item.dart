import 'package:flutter/material.dart';
import '../models/comment_item_model.dart';
import '../utils/utils.dart';

class CommentItem extends StatefulWidget {
  CommentItemModel model;
  CommentItem({CommentItemModel mode}) : this.model = mode;
  CommentItemState createState() => CommentItemState(model);
}

class CommentItemState extends State<CommentItem> {
  CommentItemModel model;
  CommentItemState(this.model);
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    CommentItemModel model = widget.model;
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xFF1E1F20),
            border: Border(
              bottom: BorderSide(width: 1, color: Color(0xFF353637)),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(model.avatarUrl),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildItem(model),
                ),
              )
            ],
          ),
        ),
        Positioned(
          child: GestureDetector(
            child: Container(
              width: 40,
              child: Row(
                children: _buildLike(model),
              ),
            ),
            onTap: () {
              setState(() {
                _isFavorite = !_isFavorite;
                if (_isFavorite) {
                  model.likeNum += 1;
                } else {
                  model.likeNum -= 1;
                }
                model = model;
              });
            },
          ),
          top: 20,
          right: 20,
        ),
        Positioned(
          child: Container(
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    print(model.grouptitle);
                  },
                  child: Text('...',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text('${1.toString()}楼',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ),
          bottom: 10,
          right: 10,
        ),
      ],
    );
  }

  List<Widget> _buildLike(CommentItemModel model) {
    List<Widget> widgets = List();
    widgets.add(
      Expanded(
        child: Text(
          model.likeNum != 0 ? model.likeNum.toString() : "",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
    widgets.add(
      Icon(
        _isFavorite ? Icons.favorite : Icons.favorite_border,
        color: _isFavorite ? Colors.red : Colors.grey,
      ),
    );
    return widgets;
  }

  List<Widget> _buildItem(CommentItemModel model) {
    List<Widget> widgets = List();
    widgets.add(
      Text(
        model.author,
        style: TextStyle(color: Colors.white),
      ),
    );

    widgets.add(
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: <Widget>[
            Text(
              model.grouptitle,
              style: TextStyle(
                color: Color(0xFF6E6F70),
                fontSize: 12,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                Utils.formatTimestamp(model.dateline),
                style: TextStyle(
                  color: Color(0xFF6E6F70),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    if (model.replyMessage != null && model.replyMessage.message != null) {
      print(model.replyMessage.message);
      widgets.add(Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        padding: const EdgeInsets.all(5),
        color: Color(0xFF303135),
        child: Row(
          children: <Widget>[
            Text(
              model.replyMessage.author + ': ',
              style: TextStyle(color: Color(0xFF4A72A2)),
            ),
            Expanded(
              child: Text(
                model.replyMessage.message.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Color(0xFF6E6F70)),
              ),
            ),
          ],
        ),
      ));
    }

    widgets.add(
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Text(
          model.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    widgets.add(
      Text(
        '回复',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
    );
    return widgets;
  }
}
