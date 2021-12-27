class Medias {
  String? mediaType;
  String? order;
  String? caption;
  String? url;
  String? thumbnail;
  String? format;

  Medias({
    this.mediaType,
    this.order,
    this.caption,
    this.url,
    this.thumbnail,
    this.format,
  });

  Medias.fromJson(Map<String, dynamic> json) {
    mediaType = json['mediaType'];
    order = json['order'];
    caption = json['caption'];
    url = json['url'];
    thumbnail = json['thumbnail'];
    format = json['format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['mediaType'] = this.mediaType;
    data['order'] = this.order;
    data['caption'] = this.caption;
    data['url'] = this.url;
    data['thumbnail'] = this.thumbnail;
    data['format'] = this.format;
    return data;
  }
}
