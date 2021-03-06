class CommentItemModel {
  int invisible;
  int tid;
  int fid;
  int pid;
  int authorid;
  String author;
  int dateline;
  String message;
  String subject;
  int position;
  String grouptitle;
  String grouptitleColor;
  String signature;
  int isLandlord;
  int likeNum;
  int isDaren;
  ReplyMessage replyMessage;
  String avatarUrl;

  CommentItemModel(
      {this.invisible,
      this.tid,
      this.fid,
      this.pid,
      this.authorid,
      this.author,
      this.dateline,
      this.message,
      this.subject,
      this.position,
      this.grouptitle,
      this.grouptitleColor,
      this.signature,
      this.isLandlord,
      this.likeNum,
      this.isDaren,
      this.replyMessage,
      this.avatarUrl});

  CommentItemModel.fromJson(Map<String, dynamic> json) {
    invisible = json['invisible'];
    tid = json['tid'];
    fid = json['fid'];
    pid = json['pid'];
    authorid = json['authorid'];
    author = json['author'];
    dateline = json['dateline'];
    message = json['message'];
    subject = json['subject'];
    position = json['position'];
    grouptitle = json['grouptitle'];
    grouptitleColor = json['grouptitle_color'];
    signature = json['signature'];
    isLandlord = json['is_landlord'];
    likeNum = json['like_num'];
    isDaren = json['is_daren'];
    replyMessage = json['reply_message'] != null
        ? new ReplyMessage.fromJson(json['reply_message'])
        : null;
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invisible'] = this.invisible;
    data['tid'] = this.tid;
    data['fid'] = this.fid;
    data['pid'] = this.pid;
    data['authorid'] = this.authorid;
    data['author'] = this.author;
    data['dateline'] = this.dateline;
    data['message'] = this.message;
    data['subject'] = this.subject;
    data['position'] = this.position;
    data['grouptitle'] = this.grouptitle;
    data['grouptitle_color'] = this.grouptitleColor;
    data['signature'] = this.signature;
    data['is_landlord'] = this.isLandlord;
    data['like_num'] = this.likeNum;
    data['is_daren'] = this.isDaren;
    if (this.replyMessage != null) {
      data['reply_message'] = this.replyMessage.toJson();
    }
    data['avatar_url'] = this.avatarUrl;
    return data;
  }
}

class ReplyMessage {
  String author;
  int dateline;
  String message;

  ReplyMessage({this.author, this.dateline, this.message});

  ReplyMessage.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    dateline = json['dateline'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['dateline'] = this.dateline;
    data['message'] = this.message;
    return data;
  }
}
