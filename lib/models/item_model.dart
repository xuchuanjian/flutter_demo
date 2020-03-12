class ItemModel {
  int id;
  int fid;
  String source;
  String sourceUrl;
  String title;
  String content;
  int replies;
  int publishTime;
  String author;
  int authorid;
  String authorUrl;
  String avatarUrl;
  int views;
  String targetUrl;
  List<ImageList> imageList;
  String likes;
  int isDaren;
  int isNewUserThread;
  String msgType;

  ItemModel(
      {this.id,
      this.fid,
      this.source,
      this.sourceUrl,
      this.title,
      this.content,
      this.replies,
      this.publishTime,
      this.author,
      this.authorid,
      this.authorUrl,
      this.avatarUrl,
      this.views,
      this.targetUrl,
      this.imageList,
      this.likes,
      this.isDaren,
      this.isNewUserThread,
      this.msgType});

  ItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fid = json['fid'];
    source = json['source'];
    sourceUrl = json['source_url'];
    title = json['title'];
    content = json['content'];
    replies = json['replies'];
    publishTime = json['publish_time'];
    author = json['author'];
    authorid = json['authorid'];
    authorUrl = json['author_url'];
    avatarUrl = json['avatar_url'];
    views = json['views'];
    targetUrl = json['target_url'];
    if (json['image_list'] != null) {
      imageList = new List<ImageList>();
      json['image_list'].forEach((v) {
        imageList.add(new ImageList.fromJson(v));
      });
    }
    likes = json['likes'].toString();
    isDaren = json['is_daren'];
    isNewUserThread = json['is_new_user_thread'];
    msgType = json['msg_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fid'] = this.fid;
    data['source'] = this.source;
    data['source_url'] = this.sourceUrl;
    data['title'] = this.title;
    data['content'] = this.content;
    data['replies'] = this.replies;
    data['publish_time'] = this.publishTime;
    data['author'] = this.author;
    data['authorid'] = this.authorid;
    data['author_url'] = this.authorUrl;
    data['avatar_url'] = this.avatarUrl;
    data['views'] = this.views;
    data['target_url'] = this.targetUrl;
    if (this.imageList != null) {
      data['image_list'] = this.imageList.map((v) => v.toJson()).toList();
    }
    data['likes'] = this.likes;
    data['is_daren'] = this.isDaren;
    data['is_new_user_thread'] = this.isNewUserThread;
    data['msg_type'] = this.msgType;
    return data;
  }


}

class ImageList {
  String url;

  ImageList({this.url});

  ImageList.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}
