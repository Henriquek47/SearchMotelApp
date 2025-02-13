import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guia_motel/core/responsive/responsive_extension.dart';
import 'package:guia_motel/core/style/colors_app.dart';
import 'package:guia_motel/core/style/text_style_app.dart';
import 'package:guia_motel/models/response/category_item_model.dart';

class ListContainItems extends StatefulWidget {
  final List<CategoryItemModel> items;
  const ListContainItems({super.key, required this.items});

  @override
  State<ListContainItems> createState() => _ListContainItemsState();
}

class _ListContainItemsState extends State<ListContainItems> {
  bool _expandido = false;

  @override
  Widget build(BuildContext context) {
    return !_expandido && widget.items.length > 4
        ? Wrap(
            spacing: 12.appWidth,
            children: [
              ...widget.items.take(4).map(
                (e) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        e.icon,
                        scale: 4.appAdaptive,
                        errorBuilder: (context, error, stackTrace) =>
                            SizedBox.shrink(),
                      ),
                      Text(
                        e.name,
                        style: context.textStyles.bodyText.copyWith(
                            color: context.colors.neutralShade500,
                            fontSize: 10.appFont),
                      )
                    ],
                  );
                },
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _expandido = true;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Ver mais",
                        style: context.textStyles.link
                            .copyWith(fontSize: 10.appFont)),
                    Icon(
                      Icons.keyboard_arrow_down_sharp,
                      size: 20.appIcon,
                      color: context.colors.primary,
                    )
                  ],
                ),
              ),
            ],
          )
        : Wrap(
            spacing: 12,
            children: [
              ...widget.items.map(
                (e) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        e.icon,
                        scale: 4.appAdaptive,
                        errorBuilder: (context, error, stackTrace) =>
                            SizedBox.shrink(),
                      ),
                      Text(
                        e.name,
                        style: context.textStyles.bodyText.copyWith(
                            color: context.colors.neutralShade500,
                            fontSize: 10.appFont),
                      )
                    ],
                  );
                },
              ),
              if (widget.items.length > 4)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _expandido = false;
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Ver menos",
                          style: context.textStyles.link
                              .copyWith(fontSize: 10.appFont)),
                      Icon(
                        Icons.keyboard_arrow_up_sharp,
                        size: 20.appIcon,
                        color: context.colors.primary,
                      )
                    ],
                  ),
                ),
            ],
          );
  }
}
