import 'package:flutter/widgets.dart';
import 'package:guia_motel/core/responsive/responsive_extension.dart';
import 'package:guia_motel/core/style/colors_app.dart';
import 'package:guia_motel/core/widgets/skeleton_widget.dart';

class PopularMotelCardSkeleton extends StatelessWidget {
  const PopularMotelCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.appHeight,
      margin: EdgeInsetsDirectional.symmetric(horizontal: 12.appWidth),
      padding: EdgeInsets.only(
        top: 12.appHeight,
      ),
      decoration: BoxDecoration(
          color: context.colors.neutralWhite,
          borderRadius: BorderRadius.circular(12.appAdaptive)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8.appHeight,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.appWidth),
            child: SkeletonWidget(
                radius: 4, height: 35.appHeight, width: 150.appWidth),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding:
                    EdgeInsets.only(left: 16.appWidth, bottom: 20.appHeight),
                child: SkeletonWidget(
                  radius: 12.appAdaptive,
                  height: 110.appHeight,
                  width: 135.appWidth,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
