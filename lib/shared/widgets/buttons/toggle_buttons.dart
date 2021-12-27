import 'package:flutter/material.dart';

import 'package:yc_app/utils/colors.dart';

import 'package:yc_app/shared/views/shared_views.dart';

class ToggleButtonWidget extends StatefulWidget {
  ToggleButtonWidget({
    this.isSmall: true,
    this.text1: 'Today',
    this.text2: 'This Week',
    this.text3: 'Next Week',
  });

  final bool isSmall;
  final String text1;
  final String text2;
  final String text3;

  @override
  _ToggleButtonWidgetState createState() => _ToggleButtonWidgetState();
}

class _ToggleButtonWidgetState extends State<ToggleButtonWidget> {
  List<bool> isSelected = [false, true, false];
  FocusNode focusNodeButton1 = FocusNode();
  FocusNode focusNodeButton2 = FocusNode();
  FocusNode focusNodeButton3 = FocusNode();
  List<FocusNode>? focusToggle;

  @override
  void initState() {
    focusToggle = [focusNodeButton1, focusNodeButton2, focusNodeButton3];
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    focusNodeButton1.dispose();
    focusNodeButton2.dispose();
    focusNodeButton3.dispose();
    super.dispose();
  }

  Widget _buildButtons(String text, bool isSelected, {bool isSmall: true}) {
    return Container(
        height: isSmall ? 32 : 40,
        width: isSmall ? 100 : 140,
        key: UniqueKey(),
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.cGREEN_100 : AppColors.cWHITE_100,
          borderRadius: BorderRadius.circular(isSmall ? 6 : 8),
          border: Border.all(color: AppColors.cBLACK_20),
        ),
        child: Center(
          child: Text(
            text,
            style: isSmall
                ? (isSelected
                    ? SharedViews.getTextStyle(
                        TStyle.B1_700,
                        customStyle: TextStyle(color: AppColors.cWHITE_100),
                      )
                    : SharedViews.getTextStyle(TStyle.B1_600))
                : (isSelected
                    ? SharedViews.getTextStyle(
                        TStyle.H3_700,
                        customStyle: TextStyle(color: AppColors.cWHITE_100),
                      )
                    : SharedViews.getTextStyle(
                        TStyle.H3_600,
                        customStyle: TextStyle(color: AppColors.cBODY_TEXT),
                      )),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      fillColor: Colors.transparent,
      renderBorder: false,
      focusNodes: focusToggle,
      children: <Widget>[
        _buildButtons(widget.text1, isSelected[0], isSmall: widget.isSmall),
        _buildButtons(widget.text2, isSelected[1], isSmall: widget.isSmall),
        _buildButtons(widget.text3, isSelected[2], isSmall: widget.isSmall),
      ],
      isSelected: isSelected,
      onPressed: (int index) {
        setState(
          () {
            for (int indexBtn = 0; indexBtn < isSelected.length; indexBtn++) {
              if (indexBtn == index) {
                isSelected[indexBtn] = !isSelected[indexBtn];
              } else {
                isSelected[indexBtn] = false;
              }
            }
          },
        );

        ///implement switch case on index for button actions
      },
    );
  }
}

class SwitchWidget extends StatefulWidget {
  SwitchWidget(
      {required this.setValueFunction,
      Key? key,
      this.initialValue,
      this.showBorder = true})
      : super(key: key);

  final Function(bool?) setValueFunction;
  final bool? initialValue;
  final bool showBorder;

  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool? isSwitched;

  void toggle() {
    setState(() {
      isSwitched = !isSwitched!;
    });
  }

  @override
  void didUpdateWidget(covariant SwitchWidget oldWidget) {
    setState(() {
      isSwitched = widget.initialValue;
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    isSwitched = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toggle();
        widget.setValueFunction(isSwitched);
      },
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        toggle();
        widget.setValueFunction(isSwitched);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 48,
            height: 24,
            decoration: BoxDecoration(
              color: isSwitched! ? AppColors.cGREEN_100 : AppColors.cBLACK_10,
              border: widget.showBorder
                  ? Border.all(color: AppColors.cBLACK_20)
                  : null,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 100),
            left: isSwitched! ? 25 : 3,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: AppColors.cWHITE_100,
                border: widget.showBorder
                    ? Border.all(color: AppColors.cBLACK_20)
                    : null,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NewSwitchWidget extends StatefulWidget {
  NewSwitchWidget(
      {this.key, required this.setValueFunction, this.initialValue});

  Key? key;
  final Function(bool?) setValueFunction;
  bool? initialValue;

  @override
  _NewSwitchWidgetState createState() => _NewSwitchWidgetState();
}

class _NewSwitchWidgetState extends State<NewSwitchWidget> {
  bool? isSwitched;

  @override
  void initState() {
    isSwitched = widget.initialValue ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: AppColors.cGREEN_100,
      ),
      child: Checkbox(
        value: isSwitched,
        onChanged: (value) {
          setState(() {
            isSwitched = value;
          });
          widget.setValueFunction(isSwitched);
        },
      ),
    );
    // return Stack(
    //   alignment: Alignment.center,
    //   children: [
    //     Container(
    //       width: 48,
    //       height: 24,
    //       decoration: BoxDecoration(
    //         color: isSwitched ? AppColors.cGREEN_100 : AppColors.cBLACK_10,
    //         border: Border.all(color: AppColors.cBLACK_20),
    //         borderRadius: BorderRadius.circular(20),
    //       ),
    //     ),
    //     AnimatedPositioned(
    //       duration: Duration(milliseconds: 100),
    //       left: isSwitched ? 10 : -10,
    //       child: IconButton(
    //         onPressed: () {
    //           toggle();
    //           widget.setValueFunction(isSwitched);
    //         },
    //         icon: Container(
    //           width: 20,
    //           height: 20,
    //           decoration: BoxDecoration(
    //             color: AppColors.cWHITE_100,
    //             border: Border.all(color: AppColors.cBLACK_20),
    //             borderRadius: BorderRadius.circular(20),
    //           ),
    //         ),
    //       ),
    //     )
    //   ],
    // );
  }
}
