import 'package:flutter/material.dart';
import 'package:guia_motel/core/constants/enums.dart';
import 'package:guia_motel/core/responsive/responsive_extension.dart';
import 'package:guia_motel/core/style/colors_app.dart';
import 'package:guia_motel/core/style/text_style_app.dart';
import 'package:guia_motel/core/widgets/custom_button.dart';

class FilterBottomSheet extends StatefulWidget {
  final Set<FiltersItems> filters;
  final double maxPrice;
  const FilterBottomSheet(
      {super.key, required this.filters, required this.maxPrice});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  RangeValues _currentRangeValues = const RangeValues(0, 100);
  final Set<FiltersHours> _selectedIndicesHours = {};
  Set<FiltersItems> _selectedIndicesItems = {};

  @override
  void initState() {
    _currentRangeValues = RangeValues(0, widget.maxPrice);
    _selectedIndicesItems = widget.filters;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: double.maxFinite,
      padding: EdgeInsets.only(top: 16.appHeight),
      decoration: BoxDecoration(
        color: context.colors.neutralShade100,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.appAdaptive),
          topRight: Radius.circular(24.appAdaptive),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          spacing: 8.appHeight,
          children: [
            Text(
              "Filtros",
              style: context.textStyles.bodyTextSemiBold
                  .copyWith(fontSize: 14.appFont),
            ),
            SizedBox(
              height: 4.appHeight,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 12.appHeight),
              child: Column(
                children: [
                  Text(
                    "Faixa de preço",
                    style: context.textStyles.bodyTextSemiBold
                        .copyWith(fontSize: 14.appFont),
                  ),
                  SizedBox(
                    height: 4.appHeight,
                  ),
                  RangeSlider(
                    inactiveColor: context.colors.neutralShade200,
                    activeColor: context.colors.primary,
                    values: _currentRangeValues,
                    min: 0,
                    max: widget.maxPrice,
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentRangeValues = values;
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.appWidth),
                    child: Row(
                      spacing: 4.appWidth,
                      children: [
                        Text(
                          'R\$',
                          style: context.textStyles.bodyTextSemiBold.copyWith(
                            fontSize: 12.appFont,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.appWidth, vertical: 4.appHeight),
                          decoration: BoxDecoration(
                            color: context.colors.neutralShade100,
                            border: Border.all(
                                color: context.colors.neutralShade200),
                            borderRadius: BorderRadius.circular(4.appAdaptive),
                          ),
                          child: Text(
                            _currentRangeValues.start.toStringAsFixed(0),
                            style: context.textStyles.bodyTextSemiBold.copyWith(
                              fontSize: 12.appFont,
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          'R\$',
                          style: context.textStyles.bodyTextSemiBold.copyWith(
                            fontSize: 12.appFont,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.appWidth, vertical: 4.appHeight),
                          decoration: BoxDecoration(
                            color: context.colors.neutralShade100,
                            border: Border.all(
                                color: context.colors.neutralShade200),
                            borderRadius: BorderRadius.circular(4.appAdaptive),
                          ),
                          child: Text(
                            _currentRangeValues.end.toStringAsFixed(0),
                            style: context.textStyles.bodyTextSemiBold.copyWith(
                              fontSize: 12.appFont,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                  vertical: 12.appHeight, horizontal: 16.appWidth),
              child: Column(
                spacing: 12.appHeight,
                children: [
                  Text(
                    "Periodos",
                    style: context.textStyles.bodyTextSemiBold.copyWith(
                      fontSize: 14.appFont,
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 16.appWidth,
                    runSpacing: 12.appHeight,
                    children: [
                      ...FiltersHours.values.map((e) {
                        final bool isSelected =
                            _selectedIndicesHours.contains(e);
                        return CustomButton(
                          colors: [context.colors.neutralShade100],
                          radius: 4.appAdaptive,
                          borderColor: context.colors.neutralShade200,
                          isSelected: isSelected,
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                _selectedIndicesHours.remove(e);
                              } else {
                                _selectedIndicesHours.add(e);
                              }
                            });
                          },
                          splashColor: context.colors.primary,
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.appWidth, vertical: 4.appHeight),
                          child: Text(
                            e.label,
                            style: context.textStyles.bodyText.copyWith(
                                color: isSelected
                                    ? Colors.white
                                    : context.colors.neutralShade550,
                                fontSize: 12.appFont),
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                  vertical: 12.appHeight, horizontal: 16.appWidth),
              child: GridView.builder(
                itemCount: FiltersItems.values.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                    mainAxisSpacing: 12.appHeight,
                    crossAxisSpacing: 8.appWidth),
                itemBuilder: (context, index) {
                  final bool isSelected = _selectedIndicesItems
                      .contains(FiltersItems.values[index]);
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: CustomButton(
                      colors: [context.colors.neutralShade100],
                      radius: 8.appAdaptive,
                      borderColor: context.colors.neutralShade200,
                      isSelected: isSelected,
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            _selectedIndicesItems
                                .remove(FiltersItems.values[index]);
                          } else {
                            _selectedIndicesItems
                                .add(FiltersItems.values[index]);
                          }
                        });
                      },
                      splashColor: context.colors.primary,
                      padding: EdgeInsets.symmetric(vertical: 4.appHeight),
                      child: Text(
                        FiltersItems.values[index].label,
                        style: context.textStyles.bodyText.copyWith(
                          color: isSelected
                              ? Colors.white
                              : context.colors.neutralShade550,
                          fontSize: 12.appFont,
                        ),
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
