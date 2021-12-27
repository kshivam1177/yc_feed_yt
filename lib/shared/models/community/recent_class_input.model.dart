class RecentClassInput {
  List<String?>? profileIds;
  String? programType;

  RecentClassInput({this.profileIds, this.programType});

  RecentClassInput.fromJson(Map<String, dynamic> json) {
    profileIds = json['profileIds'];
    programType = json['programType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['profileIds'] = this.profileIds;
    data['programType'] = this.programType;
    return data;
  }
}
