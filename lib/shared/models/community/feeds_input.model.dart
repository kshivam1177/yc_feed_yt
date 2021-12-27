class FeedsInput {
  // int skip;
  int? page;
  List<String>? specialPostIds;

  FeedsInput({
    this.page,
    this.specialPostIds,
  });

  FeedsInput.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    specialPostIds = json['specialPostIds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['page'] = this.page;
    data['specialPostIds'] = this.specialPostIds;
    return data;
  }
}
