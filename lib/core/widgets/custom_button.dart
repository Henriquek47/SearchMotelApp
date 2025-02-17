import 'package:flutter/material.dart';
import 'package:guia_motel/core/responsive/responsive_extension.dart';

class CustomButton extends StatelessWidget {
  final List<Color> colors;
  final Color? splashColor;
  final Color? borderColor;
  final bool isSelected;
   final EdgeInsets? padding;
  final void Function()? onTap;
  final double? radius;
  final Widget? iconRigth;
  final Widget? iconLeft;
  final Widget child;
  const CustomButton({
    super.key,
    required this.colors,
    required this.child,
    this.onTap,
    this.radius,
    this.splashColor,
    this.padding,
    this.borderColor,
    this.iconRigth, this.iconLeft, this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        splashColor: splashColor,
        borderRadius: BorderRadius.circular(radius?.appAdaptive ?? 0),
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            color: !isSelected ? colors.length == 1 ? colors.first : null : splashColor,
            border: Border.all(color: borderColor ?? Colors.transparent),
            borderRadius: BorderRadius.circular(radius?.appAdaptive ?? 0),
            gradient: colors.length > 1
                ? LinearGradient(
                    colors: colors,
                  )
                : null,
          ),
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                iconLeft ?? SizedBox.shrink(),
                child,
                iconRigth ?? SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
