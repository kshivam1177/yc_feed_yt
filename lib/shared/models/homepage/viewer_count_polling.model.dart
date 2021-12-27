class ViewerCountPollingRequest {
  ViewerCountPollingRequest({
    this.ids,
  });

  List<String?>? ids;

  Map<String, dynamic> toMap() => {
        "ids": ids == null ? null : List<dynamic>.from(ids!.map((x) => x)),
      };
}

class ViewerCountPollingResponse {
  ViewerCountPollingResponse({
    this.getViewerCount,
  });

  List<GetViewerCount>? getViewerCount;

  factory ViewerCountPollingResponse.fromMap(Map<String, dynamic> json) =>
      ViewerCountPollingResponse(
        getViewerCount: json["getViewerCount"] == null
            ? null
            : List<GetViewerCount>.from(
                json["getViewerCount"].map((x) => GetViewerCount.fromMap(x))),
      );
}

class GetViewerCount {
  GetViewerCount({
    this.id,
    this.viewerCount,
  });

  String? id;
  String? viewerCount;

  factory GetViewerCount.fromMap(Map<String, dynamic> json) => GetViewerCount(
        id: json["id"],
        viewerCount: json["viewerCount"],
      );
}
