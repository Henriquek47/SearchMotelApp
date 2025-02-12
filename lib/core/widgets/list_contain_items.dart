import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guia_motel/core/responsive/responsive_extension.dart';

class ListContainItems extends StatefulWidget {
  const ListContainItems({super.key});

  @override
  State<ListContainItems> createState() => _ListContainItemsState();
}

class _ListContainItemsState extends State<ListContainItems> {
  bool _expandido = false;

  final List<Widget> _listaItens = [
    const Text("Item 1"),
    const Text("Item 2"),
    const Text("Item 3"),
    const Text("Item 4"),
    const Text("Item 5"),
    const Text("Item 6"),
    const Text("Item 7"),
    const Text("Item 8"),
  ];

  @override
  Widget build(BuildContext context) {
    return !_expandido && _listaItens.length > 4
        ? Wrap(
            spacing: 12.appWidth,
            children: [
              ..._listaItens.take(4),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _expandido = true;
                  });
                },
                child: const Text(
                  "Ver mais",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          )
        : Wrap(
            spacing: 12,
            children: [
              ..._listaItens,
              if (_listaItens.length > 4)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _expandido = false;
                    });
                  },
                  child: const Text(
                    "Ver menos",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                    ),
                  ),
                ),
            ],
          );
  }
}
