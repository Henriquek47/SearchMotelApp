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
  late HomeViewModel homeViewModel;
  late ScrollController _scrollController;
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    homeViewModel = context.read();
    homeViewModel.getAllMotels();
    _scrollController = ScrollController();
    _scrollController.addListener(_updateOpacity);
    
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
      backgroundColor: context.colors.primary,
      body: NestedScrollView(
        controller: _scrollController,
        
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.black.withAlpha(0),
              leadingWidth: 0,
              leading: const SizedBox.shrink(),
              centerTitle: true,
              title: const SwitchModeWidget(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 8.appHeight),
            ),
            SliverOpacity(
              opacity: _opacity,
              sliver: const SliverToBoxAdapter(
                child: PopularMotelCard(),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 12.appHeight),
            ),
          ];
        },
        body: const BottomSheetHomeWidget(),
      ),
    );
  }
}
