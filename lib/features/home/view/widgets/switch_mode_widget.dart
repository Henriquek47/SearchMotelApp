import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guia_motel/core/constants/assets.dart';
import 'package:guia_motel/core/responsive/responsive_extension.dart';
import 'package:guia_motel/core/style/text_style_app.dart';

class SwitchModeWidget extends StatefulWidget {
  final Function(bool isLeft) isLeft;
  const SwitchModeWidget({super.key, required this.isLeft});

  @override
  State<SwitchModeWidget> createState() => _SwitchModeWidgetState();
}

class _SwitchModeWidgetState extends State<SwitchModeWidget> {
  bool _isLeft = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.appHeight,
      width: MediaQuery.of(context).size.width * 0.75,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isLeft = !_isLeft;
                widget.isLeft(_isLeft);
              });
            },
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 35.appHeight,
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: _isLeft ? 0 : MediaQuery.of(context).size.width * 0.35,
            child: Container(
              alignment: Alignment.center,
              width: _isLeft
                  ? MediaQuery.of(context).size.width * 0.38
                  : MediaQuery.of(context).size.width * 0.4,
              height: 35.appHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          IgnorePointer(
            child: Center(
              child: Row(
                spacing: 6.appWidth,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.flashIcon,
                    colorFilter: ColorFilter.mode(
                        _isLeft ? Colors.red : Colors.white, BlendMode.srcIn),
                  ),
                  Text(
                    "Ir agora",
                    style: context.textStyles.bodyTextMedium.copyWith(
                        fontSize: 12.appFont,
                        color: _isLeft ? Colors.black : Colors.white),
                  ),
                  SizedBox(
                    width: 28.appWidth,
                  ),
                  SvgPicture.asset(
                    Assets.calendarIcon,
                    colorFilter: ColorFilter.mode(
                        _isLeft ? Colors.white : Colors.red, BlendMode.srcIn),
                  ),
                  Text(
                    "Ir outro dia",
                    style: context.textStyles.bodyTextMedium.copyWith(
                        fontSize: 12.appFont,
                        color: _isLeft ? Colors.white : Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
