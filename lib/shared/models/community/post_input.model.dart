// To parse this JSON data, do
//
//     final postInput = postInputFromMap(jsonString);

import 'package:yc_app/utils/common_helpers.dart';

class PostInput {
  PostInput({
    required this.postInput,
  });

  PostInputClass postInput;

  Map<String, dynamic> toMap() => {
        "postInput": postInput == null ? null : postInput.toMap(),
      };
}

class PostInputClass {
  PostInputClass({
    this.caption,
    this.profileIds,
    this.batchToClassId,
    this.blogContent,
    this.postType,
    this.hasParentConsentToPost = false,
    this.hasVideo,
    this.isParentConsentRequired = true,
  });

  String? caption;
  List<String?>? profileIds;
  String? batchToClassId;
  String? blogContent;
  String? postType;
  bool hasParentConsentToPost;
  bool? hasVideo;
  bool isParentConsentRequired;

  Map<String, dynamic>? toMap() {
    Map<String, dynamic> _val = {
      "caption": caption == null ? null : caption,
      "blogContent": blogContent == null ? null : blogContent,
      "postType": postType == null ? null : postType,
      "profileIds": profileIds == null
          ? null
          : List<dynamic>.from(profileIds!.map((x) => x)),
      "batchToClassId": batchToClassId == null ? null : batchToClassId,
      "hasParentConsentToPost": hasParentConsentToPost,
      "hasVideo": hasVideo,
      "isParentConsentRequired": isParentConsentRequired,
    };
    return CommonHelpers.removeNullParams(_val);
  }
}
