import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guia_motel/core/constants/assets.dart';
import 'package:guia_motel/core/responsive/responsive_extension.dart';
import 'package:guia_motel/core/style/colors_app.dart';
import 'package:guia_motel/core/widgets/skeleton_widget.dart';

class CustomImageWidget extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final BoxShape? shape;
  const CustomImageWidget(
      {super.key, required this.url, this.height, this.width, this.shape});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      height: height,
      width: width,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress != null) {
          return SkeletonWidget(
            height: height ?? double.maxFinite,
            width: width ?? double.maxFinite,
            radius: 12.appAdaptive,
            shape: shape,
          );
        } else {
          return child;
        }
      },
      errorBuilder: (context, error, stackTrace) {
        return Center(
          child: Container(
            height: height,
            width: width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: context.colors.neutralShade150,
                shape: shape ?? BoxShape.rectangle,
                borderRadius: shape != null
                    ? null : BorderRadius.circular(12.appAdaptive)
                     ),
            child: SvgPicture.asset(Assets.photoOff),
          ),
        );
      },
    );
  }
}
