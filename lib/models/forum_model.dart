
class ForumModel {
  String forumName;
  int fid;
  String forumIcon;
  int todayposts;
  int threads;
  int posts;
  int fup;
  String forumUrl;
  int forumType;

  ForumModel(
      {this.forumName,
      this.fid,
      this.forumIcon,
      this.todayposts,
      this.threads,
      this.posts,
      this.fup,
      this.forumUrl,
      this.forumType});

    ForumModel.fromJson(Map<String, dynamic> json) {
    forumName = json['forum_name'];
    fid = json['fid'];
    forumIcon = json['forum_icon'];
    todayposts = json['todayposts'];
    threads = json['threads'];
    posts = json['posts'];
    fup = json['fup'];
    forumUrl = json['forum_url'];
    forumType = json['forum_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['forum_name'] = this.forumName;
    data['fid'] = this.fid;
    data['forum_icon'] = this.forumIcon;
    data['todayposts'] = this.todayposts;
    data['threads'] = this.threads;
    data['posts'] = this.posts;
    data['fup'] = this.fup;
    data['forum_url'] = this.forumUrl;
    data['forum_type'] = this.forumType;
    return data;
  }
}
