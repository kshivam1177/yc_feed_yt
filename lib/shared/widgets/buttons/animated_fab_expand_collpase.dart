import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Widget to animate the button when scroll down
class YcFabScrollAnimated extends StatefulWidget {
  /// Function to use when press the button
  final GestureTapCallback? onPress;

  /// Double value to set the button elevation
  final double? elevation;

  /// Double value to set the button width
  final double? width;

  /// Double value to set the button height
  final double? height;

  /// Value to set the duration for animation
  final Duration? duration;

  /// Widget to use as button icon
  final Widget? icon;

  /// Widget to use as button text when button is expanded
  final Widget? text;

  /// Value to set the curve for animation
  final Curve? curve;

  /// ScrollController to use to determine when user is on top or not
  final ScrollController? scrollController;

  /// Double value to set the boundary value when scroll animation is triggered
  final double? limitIndicator;

  /// Color to set the button background color
  final Color? color;

  /// Shape to set the button background shape
  final Radius? shapeRadius;

  YcFabScrollAnimated(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onPress,
      required this.scrollController,
      this.elevation = 5.0,
      this.width = 160.0,
      this.height = 55.0,
      this.duration = const Duration(milliseconds: 200),
      this.curve,
      this.limitIndicator = 10.0,
      this.shapeRadius,
      this.color = Colors.blueAccent})
      : super(key: key);

  @override
  _YcFabScrollAnimatedState createState() => _YcFabScrollAnimatedState();
}

class _YcFabScrollAnimatedState extends State<YcFabScrollAnimated> {
  /// Boolean value to indicate when scroll view is on top
  bool _onTop = true;

  @override
  void initState() {
    super.initState();
    _handleScroll();
  }

  @override
  void dispose() {
    widget.scrollController!.removeListener(() {});
    super.dispose();
  }

  /// Function to add listener for scroll
  void _handleScroll() {
    ScrollController _scrollController = widget.scrollController!;
    _scrollController.addListener(() {
      print(_scrollController.position.userScrollDirection);
      if (_scrollController.position.pixels > widget.limitIndicator! &&
          _scrollController.position.userScrollDirection ==
              ScrollDirection.reverse) {
        setState(() {
          _onTop = false;
        });
      } else if (_scrollController.position.pixels <= widget.limitIndicator! &&
          _scrollController.position.userScrollDirection ==
              ScrollDirection.forward) {
        print(_scrollController.position.pixels);
        setState(() {
          _onTop = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
      child: Card(
        elevation: widget.elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(widget.shapeRadius!),
        ),
        child: AnimatedContainer(
          curve: widget.curve ?? Curves.easeInOut,
          duration: widget.duration!,
          height: widget.height,
          width: _onTop ? widget.width : widget.height,
          decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.all(widget.shapeRadius!)),
          child: _onTop
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [widget.icon!, widget.text!],
                )
              : widget.icon,
        ),
      ),
    );
  }
}
