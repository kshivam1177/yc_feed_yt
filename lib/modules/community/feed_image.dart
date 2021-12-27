import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yc_app/shared/models/community/post.model.dart';
import 'package:yc_app/shared/models/media.model.dart';
import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/shared/widgets/other_components/scaled_image.dart';
import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/common_helpers.dart';
import 'package:yc_app/utils/spacing.dart';

import '../video_app.dart';

class FeedImage extends StatefulWidget {
  final Medias media;

  FeedImage(this.media, {Key? key}) : super(key: key);

  @override
  State<FeedImage> createState() => _FeedImageState();
}

class _FeedImageState extends State<FeedImage> {
  ImageInfo? _imageInfo;

  @override
  Widget build(BuildContext context) {
    // Image image = Image.network(widget.media.url ?? "");
    // image.image
    //     .resolve(ImageConfiguration())
    //     .addListener(ImageStreamListener((ImageInfo info, bool _) {
    //   _imageInfo = info;
    //   if (mounted) {
    //     setState(() {});
    //   }
    // }));
    //
    // debugPrint(
    //     "Retrived Size of Image ${(_imageInfo?.image.height ?? 0).toDouble()}");

    if (widget.media.url == null || widget.media.url!.isEmpty) {
      return SizedBox.shrink();
    }

    final String imgUrl = CommonHelpers.getSanitizedImageUrl(
      imgUrl: widget.media.url,
      params: {'w': '800'},
    );
    return Image.network(
      imgUrl,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Shimmer.fromColors(
          baseColor: AppColors.cBLACK_20,
          highlightColor: AppColors.cWHITE_100,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
          ),
        );
      },
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return const Icon(Icons.error);
      },
    );
  }
}

class FeedVideo extends StatelessWidget {
  final int mediaIndex;
  final Post currentPost;

  const FeedVideo({
    required this.mediaIndex,
    required this.currentPost,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Medias media = currentPost.media![mediaIndex];
    return media.url == null
        ? SizedBox.shrink()
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: SharedViews.screenWidth,
                child: Stack(
                  children: <Widget>[
                    Container(
                      color: AppColors.cBLACK_20,
                    ),
                    if (media.thumbnail != null && media.thumbnail!.isNotEmpty)
                      scaledImage(
                        imageUrl: media.thumbnail,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/play_button_icon.svg",
                              width: 128,
                              height: 128,
                            ),
                            SizedBox(height: AppSpacing.xxs),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSpacing.l,
                                vertical: AppSpacing.xs,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.cBODY_TEXT.withOpacity(0.3),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              child: Text(
                                "Tap to Play Video",
                                style: SharedViews.getTextStyle(
                                  TStyle.H5_400,
                                  customStyle: TextStyle(
                                    color: AppColors.cWHITE_100,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Scaffold(
                              backgroundColor: Colors.black,
                              body: VideoApp(
                                url: media.url,
                                heading: "",
                                postId: currentPost.id,
                                entityId: currentPost.entity!.id,
                                videoIndex: mediaIndex,
                                showCloseButton: true,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
