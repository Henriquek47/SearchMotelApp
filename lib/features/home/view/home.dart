import 'package:flutter/material.dart';
import 'package:guia_motel/core/responsive/responsive_extension.dart';
import 'package:guia_motel/core/style/colors_app.dart';
import 'package:guia_motel/features/home/view/widgets/bottom_sheet_home_widget.dart';
import 'package:guia_motel/features/home/view/widgets/popular_motel_card.dart';
import 'package:guia_motel/features/home/view/widgets/switch_mode_widget.dart';
import 'package:guia_motel/features/home/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool goNow = true;
  late HomeViewModel homeViewModel;
  late ScrollController _scrollController;
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    homeViewModel = context.read();

    _scrollController = ScrollController();
    _scrollController.addListener(_updateOpacity);
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        Future.wait([
          homeViewModel.getAllMotels(),
          homeViewModel.getPopularMotels(),
        ]);
      },
    );
  }

  void _updateOpacity() {
    final double offset = _scrollController.offset;
    setState(() {
      _opacity = (1.0 - (offset / 200)).clamp(0.0, 1.0);
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateOpacity);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    homeViewModel = context.watch();

    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        leadingWidth: 0,
        backgroundColor: context.colors.primary,
        forceMaterialTransparency: true,
        elevation: 0,
        centerTitle: true,
        title: SwitchModeWidget(
          isLeft: (isLeft) {
            setState(() {
              goNow = isLeft;
            });
          },
        ),
      ),
      backgroundColor: context.colors.primary,
      body: !goNow
          ? SizedBox.shrink()
          : Padding(
              padding: EdgeInsets.only(top: 8.appHeight),
              child: NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return [
                      SliverToBoxAdapter(
                        child: Opacity(
                          opacity: _opacity,
                          child: PopularMotelCard(),
                        ),
                      ),
                    ];
                  },
                  body: BottomSheetHomeWidget()),
            ),
    );
  }
}
