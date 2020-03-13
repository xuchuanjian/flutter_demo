class DetailHeaderModel {
  int tid;
  int fid;
  String subject;
  String message;
  int authorid;
  String author;
  int dateline;
  String grouptitle;
  String signature;
  int replies;
  int views;
  int isClosed;
  int displayorder;
  String shareUrl;
  String grouptitleColor;
  String forumName;
  int gid;
  String forumIcon;
  int isDaren;
  String shareDesc;
  String shareImg;
  String shareTitle;
  String avatarUrl;
  int recommendAdd;
  int isFavThread;
  int isFavForum;
  String likeNum;
  List<LikeUsers> likeUsers;
  String wxAppId;
  String wxAppPath;
  String wxAppShareImg;

  DetailHeaderModel(
      {this.tid,
      this.fid,
      this.subject,
      this.message,
      this.authorid,
      this.author,
      this.dateline,
      this.grouptitle,
      this.signature,
      this.replies,
      this.views,
      this.isClosed,
      this.displayorder,
      this.shareUrl,
      this.grouptitleColor,
      this.forumName,
      this.gid,
      this.forumIcon,
      this.isDaren,
      this.shareDesc,
      this.shareImg,
      this.shareTitle,
      this.avatarUrl,
      this.recommendAdd,
      this.isFavThread,
      this.isFavForum,
      this.likeNum,
      this.likeUsers,
      this.wxAppId,
      this.wxAppPath,
      this.wxAppShareImg});

  DetailHeaderModel.fromJson(Map<String, dynamic> json) {
    tid = json['tid'];
    fid = json['fid'];
    subject = json['subject'];
    message = json['message'];
    authorid = json['authorid'];
    author = json['author'];
    dateline = json['dateline'];
    grouptitle = json['grouptitle'];
    signature = json['signature'];
    replies = json['replies'];
    views = json['views'];
    isClosed = json['is_closed'];
    displayorder = json['displayorder'];
    shareUrl = json['share_url'];
    grouptitleColor = json['grouptitle_color'];
    forumName = json['forum_name'];
    gid = json['gid'];
    forumIcon = json['forum_icon'];
    isDaren = json['is_daren'];
    shareDesc = json['share_desc'];
    shareImg = json['share_img'];
    shareTitle = json['share_title'];
    avatarUrl = json['avatar_url'];
    recommendAdd = json['recommend_add'];
    isFavThread = json['is_fav_thread'];
    isFavForum = json['is_fav_forum'];
    likeNum = json['like_num'];
    if (json['like_users'] != null) {
      likeUsers = new List<LikeUsers>();
      json['like_users'].forEach((v) {
        likeUsers.add(new LikeUsers.fromJson(v));
      });
    }
    wxAppId = json['wx_app_id'];
    wxAppPath = json['wx_app_path'];
    wxAppShareImg = json['wx_app_share_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tid'] = this.tid;
    data['fid'] = this.fid;
    data['subject'] = this.subject;
    data['message'] = this.message;
    data['authorid'] = this.authorid;
    data['author'] = this.author;
    data['dateline'] = this.dateline;
    data['grouptitle'] = this.grouptitle;
    data['signature'] = this.signature;
    data['replies'] = this.replies;
    data['views'] = this.views;
    data['is_closed'] = this.isClosed;
    data['displayorder'] = this.displayorder;
    data['share_url'] = this.shareUrl;
    data['grouptitle_color'] = this.grouptitleColor;
    data['forum_name'] = this.forumName;
    data['gid'] = this.gid;
    data['forum_icon'] = this.forumIcon;
    data['is_daren'] = this.isDaren;
    data['share_desc'] = this.shareDesc;
    data['share_img'] = this.shareImg;
    data['share_title'] = this.shareTitle;
    data['avatar_url'] = this.avatarUrl;
    data['recommend_add'] = this.recommendAdd;
    data['is_fav_thread'] = this.isFavThread;
    data['is_fav_forum'] = this.isFavForum;
    data['like_num'] = this.likeNum;
    if (this.likeUsers != null) {
      data['like_users'] = this.likeUsers.map((v) => v.toJson()).toList();
    }
    data['wx_app_id'] = this.wxAppId;
    data['wx_app_path'] = this.wxAppPath;
    data['wx_app_share_img'] = this.wxAppShareImg;
    return data;
  }
}

class LikeUsers {
  int uid;
  String avatarUrl;

  LikeUsers({this.uid, this.avatarUrl});

  LikeUsers.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['avatar_url'] = this.avatarUrl;
    return data;
  }
}
