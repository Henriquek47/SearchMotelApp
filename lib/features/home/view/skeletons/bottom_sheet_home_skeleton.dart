import 'package:flutter/widgets.dart';
import 'package:guia_motel/core/responsive/responsive_extension.dart';
import 'package:guia_motel/core/style/colors_app.dart';
import 'package:guia_motel/core/widgets/skeleton_widget.dart';

class BottomSheetHomeSkeleton extends StatelessWidget {
  const BottomSheetHomeSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.appHeight),
      padding: EdgeInsets.symmetric(horizontal: 12.appWidth),
      decoration: BoxDecoration(
        color: context.colors.neutralWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.appAdaptive),
          topRight: Radius.circular(16.appAdaptive),
        ),
      ),
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 24.appHeight),
          child: Column(
            spacing: 12.appHeight,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkeletonWidget(
                  radius: 8.appAdaptive,
                  height: 45.appHeight,
                  width: 200.appWidth),
              SkeletonWidget(
                  radius: 8.appAdaptive,
                  height: 180.appHeight,
                  width: MediaQuery.of(context).size.width * 1),
              SkeletonWidget(
                  radius: 8.appAdaptive,
                  height: 45.appHeight,
                  width: MediaQuery.of(context).size.width * 1),
            ],
          ),
        ),
      ),
    );
  }
}
