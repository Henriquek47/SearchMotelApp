import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guia_motel/core/constants/assets.dart';
import 'package:guia_motel/core/responsive/responsive_extension.dart';
import 'package:guia_motel/core/style/colors_app.dart';
import 'package:guia_motel/core/style/text_style_app.dart';
import 'package:guia_motel/core/widgets/custom_button.dart';
import 'package:shimmer/shimmer.dart';

class TitleMotelCard extends StatelessWidget {
  const TitleMotelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.appWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 6.appWidth,
        children: [
          Image.network(
            "",
            errorBuilder: (context, error, stackTrace) {
              return SizedBox(
                width: 55.appHeight,
                height: 55.appHeight,
                child: Shimmer.fromColors(
                    baseColor: context.colors.neutralShade150,
                    highlightColor: context.colors.neutralWhite,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.colors.neutralShade300),
                    )),
              );
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Text(
                "Adrenalina Motel",
                style: context.textStyles.bodyTextSemiBold
                    .copyWith(fontSize: 16.appFont),
              ),
              Text(
                "Jardim São Paulo - Recife",
                style:
                    context.textStyles.bodyText.copyWith(fontSize: 10.appFont),
              ),
              Row(
                spacing: 8.appWidth,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      children: [
                        SvgPicture.asset(
                          Assets.startIcon,
                          height: 12.appHeight,
                          colorFilter:
                              ColorFilter.mode(Colors.amber, BlendMode.srcIn),
                        ),
                        Text(
                          "3.2",
                          style: context.textStyles.bodyTextSemiBold
                              .copyWith(fontSize: 10.appFont),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "26 avaliações",
                    style: context.textStyles.bodyTextSemiBold
                        .copyWith(fontSize: 10.appFont),
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          CustomButton(
            colors: [context.colors.secondary],
            onTap: () {},
            radius: 4.appAdaptive,
            padding: EdgeInsets.symmetric(
                horizontal: 2.appWidth, vertical: 2.appHeight),
            child: Text(
              "Saiba mais",
              style: context.textStyles.bodyText.copyWith(
                  fontSize: 12.appFont, color: context.colors.neutralWhite),
            ),
          )
        ],
      ),
    );
  }
}
