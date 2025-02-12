import 'package:flutter/material.dart';
import 'package:guia_motel/core/responsive/responsive_extension.dart';
import 'package:guia_motel/core/style/colors_app.dart';
import 'package:guia_motel/core/widgets/filter_list_widget.dart';
import 'package:guia_motel/features/home/view/widgets/body_motel_card.dart';
import 'package:guia_motel/features/home/view/widgets/title_motel_card.dart';
import 'package:guia_motel/features/home/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class BottomSheetHomeWidget extends StatelessWidget {
  const BottomSheetHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.watch<HomeViewModel>();
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
        minHeight: 100,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.neutralWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.appAdaptive),
            topRight: Radius.circular(16.appAdaptive),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.appHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilterListWidget(),
            Divider(
              color: Colors.grey[300],
              height: 25.appHeight,
            ),
            Expanded(
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.only(top: 8.appHeight),
                itemCount: 1, //homeViewModel.motelList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final motel = homeViewModel.motelList[index];
                  return Column(
                    children: [
                      TitleMotelCard(),
                      SizedBox(
                        height: 24.appHeight,
                      ),
                      BodyMotelCard(motelModel: motel,),
                    ],
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
