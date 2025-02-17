import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guia_motel/core/constants/assets.dart';
import 'package:guia_motel/core/constants/enums.dart';
import 'package:guia_motel/core/responsive/responsive_extension.dart';
import 'package:guia_motel/core/style/colors_app.dart';
import 'package:guia_motel/core/style/text_style_app.dart';
import 'package:guia_motel/core/widgets/custom_button.dart';
import 'package:guia_motel/core/modals/filter_bottom_sheet.dart';

class FilterListWidget extends StatefulWidget {
  final Function(List<FiltersItems>) filters;
  const FilterListWidget({super.key, required this.filters});

  @override
  State<FilterListWidget> createState() => _FilterListWidgetState();
}

class _FilterListWidgetState extends State<FilterListWidget> {
  final Set<FiltersItems> _selectedIndices = {};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.appHeight,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: FiltersItems.values.length,
        itemBuilder: (context, index) {
          final bool isSelected =
              _selectedIndices.contains(FiltersItems.values[index]);
          return Padding(
            padding: EdgeInsets.only(
                left: 4.appWidth, right: 4.appWidth, top: 12.appHeight),
            child: index == 0
                ? Padding(
                    padding: EdgeInsets.only(left: 12.appWidth),
                    child: Badge(
                      isLabelVisible:
                          _selectedIndices.isNotEmpty ? true : false,
                      backgroundColor: context.colors.primary,
                      label: Text(
                        _selectedIndices.length > 99
                            ? '99+'
                            : '${_selectedIndices.length}',
                        style: context.textStyles.bodyText.copyWith(
                            fontSize: 10.appFont,
                            color: context.colors.neutralWhite),
                      ),
                      child: SizedBox(
                        height: double.maxFinite,
                        child: CustomButton(
                          colors: [],
                          onTap: () async {
                            await showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24.appAdaptive),
                                  topRight: Radius.circular(24.appAdaptive),
                                ),
                              ),
                              builder: (context) {
                                return FilterBottomSheet(
                                  filters: _selectedIndices,
                                  maxPrice: 3000,
                                );
                              },
                            );
                            setState(() {});
                          },
                          iconLeft: SvgPicture.asset(
                            Assets.filterIcon,
                            height: 18.appAdaptive,
                            colorFilter: ColorFilter.mode(
                              isSelected
                                  ? context.colors.neutralWhite
                                  : context.colors.neutralShade500,
                              BlendMode.srcIn,
                            ),
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
                      ),
                    ),
                  )
                : CustomButton(
                    colors: [],
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          _selectedIndices.remove(FiltersItems.values[index]);
                        } else {
                          _selectedIndices.add(FiltersItems.values[index]);
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
                      FiltersItems.values[index].label,
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
