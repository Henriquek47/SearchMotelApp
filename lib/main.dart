import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guia_motel/core/constants/global_context.dart';
import 'package:guia_motel/core/routes/routes_app.dart';
import 'package:guia_motel/features/home/view_model/home_view_model.dart';
import 'package:guia_motel/repositories/implementations/motel_repository.dart';
import 'package:guia_motel/services/http/api_client.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApiClient()),
        ChangeNotifierProvider(create: (context) => MotelRepository(context.read())),
        ChangeNotifierProvider(create: (context) => HomeViewModel(context.read())),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext? context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Theme.of(context),
          onGenerateRoute: generateRoute,
          initialRoute: AppRouters.home,
          navigatorKey: GlobalContext.instance.navigatorKey,
        );
      },
    );
  }
}
