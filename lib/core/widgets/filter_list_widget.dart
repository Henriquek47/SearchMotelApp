import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guia_motel/core/constants/assets.dart';
import 'package:guia_motel/core/constants/enums.dart';
import 'package:guia_motel/core/responsive/responsive_extension.dart';
import 'package:guia_motel/core/style/colors_app.dart';
import 'package:guia_motel/core/style/text_style_app.dart';
import 'package:guia_motel/core/widgets/custom_button.dart';

class FilterListWidget extends StatefulWidget {
  final  Function(List<Filters>) filters;
  const FilterListWidget({super.key, required this.filters});

  @override
  State<FilterListWidget> createState() => _FilterListWidgetState();
}

class _FilterListWidgetState extends State<FilterListWidget> {
  final Set<Filters> _selectedIndices = {};

  List<String> getFiltersInPortuguese() {
  return Filters.values.map((filter) {
    switch (filter) {
      case Filters.withDiscount:
        return "Com Desconto";
      case Filters.available:
        return "Disponível";
      case Filters.hydromassage:
        return "Hidromassagem";
      case Filters.sauna:
        return "Sauna";
      case Filters.eroticDecoration:
        return "Decoração Erótica";
      case Filters.themedDecoration:
        return "Decoração Temática";
      case Filters.wifi:
        return "Wi-Fi";
      case Filters.minibar:
        return "Minibar";
      case Filters.garage:
        return "Garagem";
    }
  }).toList();
}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.appHeight,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: Filters.values.length,
        itemBuilder: (context, index) {
          final bool isSelected =
              _selectedIndices.contains(Filters.values[index]);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.appWidth),
            child: index == 0
                ? Padding(
                    padding: EdgeInsets.only(left: 12.appWidth),
                    child: CustomButton(
                      colors: [],
                      onTap: () {
                        
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
                      padding: EdgeInsets.symmetric(horizontal: 6.appWidth),
                      child: Text(
                        "Filtros",
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
                          _selectedIndices.remove(Filters.values[index]);
                        } else {
                          _selectedIndices.add(Filters.values[index]);
                        }
                        widget.filters.call(_selectedIndices.toList());
                      });
                    },
                    borderColor: Colors.black26,
                    splashColor: context.colors.primary,
                    radius: 4.appAdaptive,
                    isSelected: isSelected,
                    padding: EdgeInsets.symmetric(horizontal: 4.appWidth),
                    child: Text(
                      getFiltersInPortuguese()[index],
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
