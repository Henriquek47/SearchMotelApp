import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guia_motel/core/constants/assets.dart';
import 'package:guia_motel/core/responsive/responsive_extension.dart';
import 'package:guia_motel/core/style/colors_app.dart';
import 'package:guia_motel/core/style/text_style_app.dart';
import 'package:guia_motel/core/widgets/custom_button.dart';

class FilterListWidget extends StatefulWidget {
  const FilterListWidget({super.key});

  @override
  State<FilterListWidget> createState() => _FilterListWidgetState();
}

class _FilterListWidgetState extends State<FilterListWidget> {
  final Set<int> _selectedIndices = {};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.appHeight,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          final bool isSelected = _selectedIndices.contains(index);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.appWidth),
            child: index == 0
                ? Padding(
                    padding: EdgeInsets.only(left: 12.appWidth),
                    child: CustomButton(
                      colors: [],
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            _selectedIndices.remove(index);
                          } else {
                            _selectedIndices.add(index);
                          }
                        });
                      },
                      iconLeft: SvgPicture.asset(
                        Assets.filterIcon,
                        height: 18.appAdaptive,
                        colorFilter: ColorFilter.mode(
                            isSelected
                                ? context.colors.neutralWhite
                                : context.colors.neutralShade500,
                            BlendMode.srcIn),
                      ),
                      borderColor: Colors.black26,
                      splashColor: context.colors.primary,
                      radius: 4.appAdaptive,
                      isSelected: isSelected,
                      padding: EdgeInsets.symmetric(horizontal: 4.appWidth),
                      child: Text(
                        "com desconto",
                        style: context.textStyles.bodyText.copyWith(
                            fontSize: 10.appFont,
                            color: isSelected
                                ? context.colors.neutralWhite
                                : context.colors.neutralShade550),
                      ),
                    ),
                  )
                : CustomButton(
                    colors: [],
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          _selectedIndices.remove(index);
                        } else {
                          _selectedIndices.add(index);
                        }
                      });
                    },
                    borderColor: Colors.black26,
                    splashColor: context.colors.primary,
                    radius: 4.appAdaptive,
                    isSelected: isSelected,
                    padding: EdgeInsets.symmetric(horizontal: 4.appWidth),
                    child: Text(
                      "com desconto",
                      style: context.textStyles.bodyText.copyWith(
                          fontSize: 10.appFont,
                          color: isSelected
                              ? context.colors.neutralWhite
                              : context.colors.neutralShade550),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
