import 'package:flutter/material.dart';
import 'package:guia_motel/core/style/colors_app.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonWidget extends StatelessWidget {
  final double radius;
  final double height;
  final double width;
  const SkeletonWidget(
      {super.key,
      required this.radius,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: context.colors.neutralShade150,
        highlightColor: context.colors.neutralWhite,
        child: Container(
          decoration: BoxDecoration(
            color: context.colors.neutralShade300,
            borderRadius: BorderRadius.circular(radius)
          ),
        ),
      ),
    );
  }
}
