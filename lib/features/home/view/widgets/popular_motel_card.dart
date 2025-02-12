import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guia_motel/core/constants/assets.dart';
import 'package:guia_motel/core/responsive/responsive_extension.dart';
import 'package:guia_motel/core/style/colors_app.dart';
import 'package:guia_motel/core/style/text_style_app.dart';

class PopularMotelCard extends StatelessWidget {
  const PopularMotelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 235.appHeight,
        width: MediaQuery.of(context).size.width * 0.9,
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
                  fontSize: 18.appFont,
                  color: context.colors.neutralShade500
                ),
              ),
            ),
            SizedBox(
              height: 12.appHeight,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 16.appWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 125.appHeight,
                          width: 135.appWidth,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(12.appAdaptive),
                          ),
                          child: Image.network(
                            "src",
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: SvgPicture.asset(
                                  Assets.photoOff,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black54,
                                    BlendMode.srcIn,
                                  ),
                                  height: 40.appHeight,
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 12.appHeight,
                        ),
                        Text(
                          "Nexos Motel",
                          style: context.textStyles.bodyText.copyWith(
                              color: context.colors.neutralShade600,
                              fontSize: 14.appFont,
                              height: 0.9),
                        ),
                        Text(
                          "4 horas 123,00",
                          style: context.textStyles.bodyTextSemiBold.copyWith(
                            color: context.colors.neutralShade600,
                            fontSize: 12.appFont,
                          ),
                        )
                      ],
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
