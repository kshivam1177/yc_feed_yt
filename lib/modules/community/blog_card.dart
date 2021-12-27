import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:yc_app/shared/models/community/post.model.dart';
import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/spacing.dart';
import 'package:markdown/markdown.dart' as md;

class FeedBlogCard extends StatefulWidget {
  FeedBlogCard({
    this.blogContent,
    this.index,
    this.title,
    this.isInEditor = false,
    Key? key,
  }) : super(key: key);
  final String? blogContent;
  final String? title;
  final int? index;
  final bool isInEditor;
  ScrollController? scrollController;

  @override
  _FeedBlogCardState createState() => _FeedBlogCardState();
}

class _FeedBlogCardState extends State<FeedBlogCard> {
  GlobalKey _keyRed = GlobalKey();
  late bool showMore;
  final double boxHeight = SharedViews.screenHeight / 4;

  void handleSize() {
    RenderBox box = _keyRed.currentContext!.findRenderObject() as RenderBox;
    if (box.size.height >= boxHeight) {
      setState(() {
        showMore = true;
      });
    }
  }

  @override
  void initState() {
    showMore = false;
    WidgetsBinding.instance!.addPostFrameCallback((_) => handleSize());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.blogContent == null) {
      return SizedBox();
    } else {
      return Container(
        key: _keyRed,
        height: showMore ? boxHeight : null,
        // constraints: showMore
        //     ? BoxConstraints(maxHeight: 150, minWidth: double.infinity)
        //     : BoxConstraints(minHeight: 134, minWidth: double.infinity),
        margin: widget.isInEditor
            ? null
            : EdgeInsets.symmetric(horizontal: AppSpacing.m),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.cBLACK_10),
        ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(
                      AppSpacing.s,
                    ),
                    child: widget.title != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: SharedViews.screenWidth! / 1.3,
                                ),
                                child: Text(
                                  widget.title!,
                                  textAlign: TextAlign.left,
                                  style:
                                      SharedViews.getTextStyle(TStyle.H5_700),
                                ),
                              ),
                            ],
                          )
                        : SizedBox(),
                  ),
                  Markdown(
                    controller: ScrollController(),
                    shrinkWrap: true,
                    selectable: false,
                    physics: NeverScrollableScrollPhysics(),
                    data: widget.blogContent!,
                    extensionSet: md.ExtensionSet(
                      md.ExtensionSet.gitHubFlavored.blockSyntaxes,
                      [
                        md.EmojiSyntax(),
                        ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes
                      ],
                    ),
                  ),
                ],
              ),
              showMore
                  ? Positioned.fill(
                      top: boxHeight - 30,
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        padding: const EdgeInsets.only(right: AppSpacing.m),
                        decoration: BoxDecoration(
                          color: AppColors.cWHITE_100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '...read more',
                          textAlign: TextAlign.right,
                          style: SharedViews.getTextStyle(
                            TStyle.B2_400,
                            customStyle: TextStyle(
                              color: AppColors.cGREEN_TEXT,
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      );
    }
  }
}

class MediaCountWidget extends StatelessWidget {
  const MediaCountWidget({
    required int currentCount,
    required this.post,
    Key? key,
  })  : _currentCount = currentCount,
        super(key: key);

  final int _currentCount;
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      right: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
            child: Row(
              children: [
                Text(
                  (_currentCount + 1).toString(),
                  style: SharedViews.getTextStyle(
                    TStyle.B3_600,
                    customStyle: TextStyle(
                      color: AppColors.cWHITE_100,
                    ),
                  ),
                ),
                Text(
                  ' / ' + post.media!.length.toString(),
                  style: SharedViews.getTextStyle(
                    TStyle.B3_600,
                    customStyle: TextStyle(
                      color: AppColors.cWHITE_100,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FeedPostDots extends StatelessWidget {
  const FeedPostDots({
    required int currentPage,
    required this.post,
    Key? key,
  })  : _currentPage = currentPage,
        super(key: key);

  final int _currentPage;
  final Post post;

  @override
  Widget build(BuildContext context) {
    if (post.media != null && post.media!.length > 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(post.media!.length, (index) {
          return Container(
            width: 6.0,
            height: 6.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPage == index ? AppColors.cGREEN_100 : Colors.grey,
            ),
          );
        }).toList(),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
