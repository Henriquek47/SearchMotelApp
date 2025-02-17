import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:guia_motel/core/responsive/responsive_extension.dart';
import 'package:guia_motel/core/style/colors_app.dart';
import 'package:guia_motel/core/style/text_style_app.dart';
import 'package:guia_motel/core/widgets/custom_image.dart';
import 'package:guia_motel/core/widgets/list_contain_items.dart';
import 'package:guia_motel/models/response/motel_model.dart';

class BodyMotelCard extends StatelessWidget {
  final MotelModel motelModel;
  const BodyMotelCard({super.key, required this.motelModel});

  @override
  Widget build(BuildContext context) {
    return ExpandablePageView.builder(
        itemCount: motelModel.suites.length,
        itemBuilder: (context, index) {
          final suite = motelModel.suites[index];
          return Container(
            margin: EdgeInsets.only(
                left: 16.appWidth, right: 16.appWidth, bottom: 28.appHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.appAdaptive),
                  child: CustomImageWidget(
                    url: suite.photos.first,
                    height: 180.appHeight,
                    width: MediaQuery.of(context).size.width * 1,
                  ),
                ),
                SizedBox(
                  height: 12.appHeight,
                ),
                Row(
                  spacing: 12.appWidth,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        suite.name,
                        maxLines: 2,
                        style: context.textStyles.bodyTextMedium
                            .copyWith(fontSize: 14.appFont),
                      ),
                    ),
                    Text(
                      "R\$ ${suite.periods.first.totalValue}/${suite.periods.first.time}h",
                      style: context.textStyles.bodyTextSemiBold.copyWith(
                          fontSize: 14.appFont,
                          color: const Color.fromARGB(255, 46, 141, 49)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.appHeight,
                ),
                ListContainItems(
                  items: suite.categoryItems,
                ),
                ...motelModel.suites[index].periods.map(
                  (e) => Column(
                    children: [
                      Divider(
                        color: context.colors.neutralShade300,
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.formattedTime,
                                style: context.textStyles.bodyText.copyWith(
                                    fontSize: 14.appFont,
                                    color: context.colors.neutralShade500),
                              ),
                              Text(
                                "R\$ ${e.totalValue}",
                                style: context.textStyles.bodyText.copyWith(
                                    fontSize: 14.appFont,
                                    color: context.colors.neutralShade500),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: context.colors.neutralShade500,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
