import 'dart:ui';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GlassContainer extends StatefulWidget {
  dynamic height;
  dynamic width;
  dynamic padding;

  dynamic child;

  dynamic borderRadius;
  dynamic borderWidth;
  dynamic borderColor;

  dynamic blurValue;
  dynamic backgroundBeginColor;
  dynamic backgroundEndColor;

  GlassContainer({
    super.key,
    this.height,
    this.width,
    this.padding,
    this.child,
    this.borderWidth,
    this.blurValue,
    this.backgroundBeginColor,
    this.backgroundEndColor,
    this.borderColor,
    required this.borderRadius,
  });

  @override
  State<GlassContainer> createState() => _GlassContainerState();
}

class _GlassContainerState extends State<GlassContainer> {
  @override
  Widget build(BuildContext context) {
    widget.borderWidth = 1.5;
    widget.borderColor = Colors.white;
    widget.blurValue = 10.0;

    widget.backgroundBeginColor = const Color.fromARGB(67, 255, 255, 255);
    widget.backgroundEndColor = const Color.fromARGB(38, 255, 255, 255);

    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Stack(
          children: [
            //blur effect
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: widget.blurValue,
                sigmaY: widget.blurValue,
              ),
              child: Container(),
            ),

            //gradient effect
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: widget.borderColor,
                  width: widget.borderWidth,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      widget.backgroundBeginColor,
                      widget.backgroundEndColor,
                    ]),
              ),
            ),

            //child
            Container(
              padding: widget.padding,
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
}
