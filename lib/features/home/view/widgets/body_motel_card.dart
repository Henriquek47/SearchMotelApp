import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guia_motel/core/constants/assets.dart';
import 'package:guia_motel/core/responsive/responsive_extension.dart';
import 'package:guia_motel/core/style/colors_app.dart';
import 'package:guia_motel/core/style/text_style_app.dart';
import 'package:guia_motel/core/widgets/list_contain_items.dart';
import 'package:guia_motel/models/response/motel_model.dart';

class BodyMotelCard extends StatelessWidget {
  final MotelModel motelModel;
  const BodyMotelCard({super.key, required this.motelModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.appWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "src",
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Container(
                  height: 180.appHeight,
                  width: MediaQuery.of(context).size.width * 1,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: context.colors.neutralShade150,
                      borderRadius: BorderRadius.circular(12.appAdaptive)),
                  child: SvgPicture.asset(Assets.photoOff),
                ),
              );
            },
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
                  "Suíte Nantes s/ garagem privativa",
                  maxLines: 2,
                  style: context.textStyles.bodyText
                      .copyWith(fontSize: 14.appFont),
                ),
              ),
              Text(
                "R\$ 80/h",
                style: context.textStyles.bodyTextSemiBold.copyWith(
                    fontSize: 14.appFont,
                    color: const Color.fromARGB(255, 46, 141, 49)),
              ),
            ],
          ),
          SizedBox(
            height: 8.appHeight,
          ),
          ListContainItems(),
          Divider(
            color: context.colors.neutralShade300,
            height: 25,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "2 horas",
                    style: context.textStyles.bodyTextSemiBold.copyWith(
                        fontSize: 14.appFont,
                        color: context.colors.neutralShade500),
                  ),
                  Text(
                    "R\$ 130,00",
                    style: context.textStyles.bodyTextSemiBold.copyWith(
                        fontSize: 14.appFont,
                        color: context.colors.neutralShade500),
                  ),
                ],
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: context.colors.neutralShade500,
              )
            ],
          ),
          Divider(color: context.colors.neutralShade300, height: 25),
        ],
      ),
    );
  }
}
