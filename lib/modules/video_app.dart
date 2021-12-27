import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:yc_app/shared/views/shared_views.dart';
import 'package:yc_app/utils/colors.dart';
import 'package:yc_app/utils/spacing.dart';

class VideoApp extends StatefulWidget {
  final String? url;
  final String? heading;
  final String? postId;
  final String? entityId;
  final int? videoIndex;
  bool? showDropShadow;
  bool? showVideoControls = true;
  final bool showCloseButton;

  VideoApp({
    this.url,
    this.heading,
    this.postId,
    this.entityId,
    this.videoIndex,
    this.showDropShadow = false,
    this.showVideoControls,
    this.showCloseButton = false,
  });

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController? _controller;
  bool _displayControls = false;
  Timer? _autoCloseVideoControlsTimer;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url!)
      ..initialize().then((_) {
        setState(
          () {
            _displayControls = true;
          },
        );
        if (_displayControls) {
          _scheduleAutoCloseVideoControls();
        }
      });
    _controller!.play();
  }

  void videoCloseEvent() {
    if (widget.postId != null) {
      // SocialEvents.videoClose(
      //   postId: widget.postId,
      //   entityId: widget.entityId,
      //   videoIndex: widget.videoIndex,
      // );
    }
  }

  void _showDropShadow() {
    setState(() {
      widget.showDropShadow = true;
    });
  }

  void _hideDropShadow() {
    setState(() {
      widget.showDropShadow = false;
    });
  }

  void _scheduleAutoCloseVideoControls() {
    _autoCloseVideoControlsTimer?.cancel();
    _autoCloseVideoControlsTimer = Timer(Duration(seconds: 3), () {
      setState(() {
        _displayControls = false;
        _hideDropShadow();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _displayControls = _displayControls ? false : true;
        });
        widget.showDropShadow! ? _hideDropShadow() : _showDropShadow();
        if (_displayControls) {
          _scheduleAutoCloseVideoControls();
        }
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          _buildVideoView(),
          _buildShadow(),
          _buildVideoControls(),
          _buildBufferingView(),
          _buildCloseButton(),
        ],
      ),
    );
  }

  Widget _buildBufferingView() {
    return _controller!.value.isBuffering
        ? CircularProgressIndicator()
        : SizedBox();
  }

  Widget _buildCloseButton() {
    return widget.showCloseButton
        ? Positioned(
            right: AppSpacing.xl,
            top: AppSpacing.xxl,
            child: GestureDetector(
              onTap: () {
                // navigation.goBack();
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.close, color: Colors.white),
              ),
            ),
          )
        : SizedBox.shrink();
  }

  Widget _buildVideoControls() {
    return widget.showVideoControls ?? true
        ? Positioned.fill(
            child: _controller != null
                ? Container(
                    child: _displayControls
                        ? VideoControls(
                            _controller,
                            heading: widget.heading,
                            postId: widget.postId,
                            entityId: widget.entityId,
                            videoIndex: widget.videoIndex,
                            scheduleAutoCloseVideoControls:
                                _scheduleAutoCloseVideoControls,
                          )
                        : SizedBox.shrink(),
                  )
                : SizedBox.shrink(),
          )
        : SizedBox.shrink();
  }

  Widget _buildShadow() {
    return widget.showDropShadow!
        ? Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, AppColors.cBLACK],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          )
        : SizedBox.shrink();
  }

  Center _buildVideoView() {
    return Center(
      child: _controller!.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: VideoPlayer(_controller!),
            )
          : CircularProgressIndicator(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    videoCloseEvent();
    _controller!.dispose();
  }
}


class VideoControls extends StatefulWidget {
  final String? heading;
  final VideoPlayerController? _controller;
  final String? postId;
  final String? entityId;
  final int? videoIndex;
  final Function? scheduleAutoCloseVideoControls;
  VideoControls(
      this._controller, {
        this.heading,
        this.postId,
        this.entityId,
        this.videoIndex,
        this.scheduleAutoCloseVideoControls,
      });

  @override
  _VideoControlsState createState() => _VideoControlsState();
}

class _VideoControlsState extends State<VideoControls> {
  double? _position;
  VideoPlayerController? _controller;
  double? volume;
  Duration? duration;

  @override
  void initState() {
    super.initState();
    _position = 0.0;
    _controller = widget._controller;
    duration = Duration(seconds: 0);
    _controller!.addListener(
          () {
        if (mounted && _controller!.value.position != null) {
          setState(
                () {
              _position = _controller!.value.position.inMicroseconds /
                  _controller!.value.duration.inMicroseconds;
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = SharedViews.getScreenWidth();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text(
                widget.heading ?? "",
                style: SharedViews.getTextStyle(
                  TStyle.B1_600,
                  customStyle: TextStyle(color: AppColors.cWHITE_100),
                ),
              ),
              Spacer(),
              widget.heading == "About mentor"
                  ? IconButton(
                  icon: Icon(
                    Icons.close,
                    color: AppColors.cWHITE_100,
                  ),
                  onPressed: () => Navigator.pop(context))
                  : Container()
            ],
          ),
        ),
        Spacer(),
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(8, 32, 8, 0),
              child: Row(
                children: [
                  IconButton(
                    icon: !_controller!.value.isPlaying
                        ? Icon(Icons.play_arrow_rounded,
                        color: AppColors.cWHITE_100)
                        : Icon(Icons.pause, color: AppColors.cWHITE_100),
                    onPressed: () {
                      _controller!.value.isPlaying
                          ? _controller!.pause()
                          : _controller!.play();
                      if (widget.postId != null) {
                        // SocialEvents.toggleVideoPlay(
                        //   isPlaying: _controller!.value.isPlaying,
                        //   postId: widget.postId,
                        //   entityId: widget.entityId,
                        //   videoIndex: widget.videoIndex,
                        // );
                      }
                      widget.scheduleAutoCloseVideoControls!();
                      setState(() {});
                    },
                  ),
                  IconButton(
                    icon: _controller!.value.volume != 0.0
                        ? Icon(
                      Icons.volume_up_outlined,
                      color: AppColors.cWHITE_100,
                    )
                        : Icon(
                      Icons.volume_off_outlined,
                      color: AppColors.cWHITE_100,
                    ),
                    onPressed: () {
                      _controller!.value.volume != 0.0
                          ? _controller!.setVolume(0.0)
                          : _controller!.setVolume(0.5);
                      widget.scheduleAutoCloseVideoControls!();
                      setState(() {});
                    },
                  ),
                  Spacer(),
                  // IconButton(
                  //   icon: Icon(
                  //     Icons.fullscreen_sharp,
                  //     color: AppColors.cWHITE_100,
                  //   ),
                  //   onPressed: () {},
                  // )
                ],
              ),
            ),
            Positioned(
              bottom: 28,
              child: Container(
                width: widget.heading == "About mentor" ? width : width - 32,
                child: SliderTheme(
                  data: SliderThemeData(
                      thumbShape: RoundSliderThumbShape(
                          disabledThumbRadius: 0.0, enabledThumbRadius: 0.0),
                      trackHeight: 2.0),
                  child: Slider(
                    min: 0.0,
                    max: 1.0,
                    activeColor: AppColors.cWHITE_100,
                    inactiveColor: AppColors.cWHITE_100.withOpacity(0.35),
                    onChanged: (v) {
                      int totalDuration =
                          _controller!.value.duration.inMicroseconds;
                      _controller!.seekTo(
                          Duration(microseconds: (v * totalDuration).toInt()));
                      setState(() {
                        _position = v.toDouble();
                      });
                    },
                    value:
                    _position != null && _position! > 0 && _position! <= 1.0
                        ? _position!
                        : 0.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
