import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guia_motel/core/constants/assets.dart';
import 'package:guia_motel/core/responsive/responsive_extension.dart';
import 'package:guia_motel/core/style/colors_app.dart';
import 'package:guia_motel/core/style/text_style_app.dart';
import 'package:guia_motel/core/widgets/custom_button.dart';
import 'package:guia_motel/core/widgets/custom_image.dart';
import 'package:guia_motel/models/response/motel_model.dart';

class TitleMotelCard extends StatelessWidget {
  final MotelModel motelModel;
  const TitleMotelCard({super.key, required this.motelModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.appWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 6.appWidth,
        children: [
          CustomImageWidget(
            url: motelModel.logo,
            height: 65.appHeight,
            width: 65.appHeight,
            shape: BoxShape.circle,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  motelModel.fantasyName,
                  style: context.textStyles.bodyTextSemiBold
                      .copyWith(fontSize: 14.appFont),
                ),
                Text(
                  motelModel.neighborhood,
                  style: context.textStyles.bodyText
                      .copyWith(fontSize: 10.appFont),
                ),
                SizedBox(height: 4.appHeight),
                Wrap(
                  spacing: 8.appWidth,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.appWidth),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.amber,
                        ),
                        color: Colors.yellow[50],
                        borderRadius: BorderRadius.circular(4.appAdaptive),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            Assets.startIcon,
                            height: 12.appHeight,
                            colorFilter:
                                ColorFilter.mode(Colors.amber, BlendMode.srcIn),
                          ),
                          Text(
                            "${motelModel.rating}",
                            style: context.textStyles.bodyTextSemiBold
                                .copyWith(fontSize: 10.appFont),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "${motelModel.reviewsCount} avaliações",
                      style: context.textStyles.bodyTextSemiBold
                          .copyWith(fontSize: 10.appFont),
                    ),
                  ],
                )
              ],
            ),
          ),
          CustomButton(
            colors: [context.colors.secondary],
            onTap: () {},
            radius: 4.appAdaptive,
            padding: EdgeInsets.symmetric(
                horizontal: 2.appWidth, vertical: 2.appHeight),
            child: Text(
              "Saiba mais",
              style: context.textStyles.bodyText.copyWith(
                  fontSize: 11.appFont, color: context.colors.neutralWhite),
            ),
          )
        ],
      ),
    );
  }
}
