class PostTimespent {
  String? postId;
  String? profileId;
  String? userId;
  int? timeSpent;
  String? trackingId;
  String? anonymousId;
  String? sessionTrackingId;
  String? postType;

  PostTimespent({
    this.postId,
    this.userId,
    this.profileId,
    this.timeSpent,
    this.trackingId,
    this.anonymousId,
    this.sessionTrackingId,
    this.postType,
  });

  PostTimespent.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    userId = json['userId'];
    profileId = json['profileId'];
    timeSpent = json['timeSpent'];
    trackingId = json['trackingId'];
    anonymousId = json['anonymousId'];
    sessionTrackingId = json['sessionTrackingId'];
    postType = json['postType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['postId'] = this.postId;
    data['userId'] = this.userId;
    data['profileId'] = this.profileId;
    data['timeSpent'] = this.timeSpent;
    data['trackingId'] = this.trackingId;
    data['anonymousId'] = this.anonymousId;
    data['sessionTrackingId'] = this.sessionTrackingId;
    data['postType'] = this.postType;
    return data;
  }
}
