import 'package:flutter/material.dart';
import 'package:guia_motel/core/responsive/responsive_extension.dart';
import 'package:guia_motel/core/style/colors_app.dart';
import 'package:guia_motel/core/style/text_style_app.dart';
import 'package:guia_motel/core/widgets/custom_image.dart';
import 'package:guia_motel/features/home/view/skeletons/popular_motel_card_skeleton.dart';
import 'package:guia_motel/features/home/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class PopularMotelCard extends StatelessWidget {
  const PopularMotelCard({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.watch<HomeViewModel>();
    return homeViewModel.loadingPopular
        ? PopularMotelCardSkeleton()
        : Center(
            child: Container(
              height: 220.appHeight,
              width: double.maxFinite,
              margin: EdgeInsetsDirectional.symmetric(horizontal: 12.appWidth),
               padding: EdgeInsets.only(
                top: 12.appHeight,
              ),
              decoration: BoxDecoration(
                  color: context.colors.neutralWhite,
                  borderRadius: BorderRadius.circular(12.appAdaptive)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.appWidth),
                    child: Text(
                      'Populares',
                      style: context.textStyles.bodyTextBold.copyWith(
                          fontSize: 16.appFont,
                          color: context.colors.neutralShade500),
                    ),
                  ),
                  SizedBox(
                    height: 12.appHeight,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: homeViewModel.popularMotelList.length,
                      itemBuilder: (context, index) {
                        final motel = homeViewModel.popularMotelList[index];
                        return Padding(
                          padding: EdgeInsets.only(left: 16.appWidth),
                          child: SizedBox(
                            width: 135.appWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 110.appHeight,
                                  width: 135.appWidth,
                                  decoration: BoxDecoration(
                                    color: context.colors.neutralShade100,
                                    borderRadius:
                                        BorderRadius.circular(8.appAdaptive),
                                  ),
                                  child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(8.appAdaptive),
                                      child: CustomImageWidget(
                                        url: motel.suites.first.photos.first,
                                        height: 30.appHeight,
                                      )),
                                ),
                                SizedBox(
                                  height: 12.appHeight,
                                ),
                                Text(
                                  motel.suites.first.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textStyles.bodyText.copyWith(
                                      color: context.colors.neutralShade600,
                                      fontSize: 13.appFont,
                                      height: 0.9),
                                ),
                                Text(
                                  "${motel.suites.first.periods.first.time} horas R\$ ${motel.suites.first.periods.first.totalValue.toStringAsFixed(2)}",
                                  style: context.textStyles.bodyTextSemiBold
                                      .copyWith(
                                    color: context.colors.neutralShade600,
                                    fontSize: 11.appFont,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
