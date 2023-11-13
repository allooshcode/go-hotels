import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_hotels/container_injection.dart';
import 'package:go_hotels/global/app_theme/app_theme_light.dart';
import 'package:go_hotels/nationality_select_feature/domain/usecases/fetech_nationalitiy_usecase.dart';
import 'package:go_hotels/nationality_select_feature/presentation/bloc/nationality__bloc.dart';

import 'hotel_search_mian_page_freature/presentation/pages/hotel_search.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSl();
  runApp(const HotelsGOApp());
}

class HotelsGOApp extends StatelessWidget {
  const HotelsGOApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NationalityBloc(sl<FetchNationalityUseCase>()),
        )
      ],
      child: MaterialApp(
          title: 'Go Hotels',
          theme: getAppThemeDataLight(context),
          scrollBehavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch}),
          // home: const MyApp())
          home: const HotelSearchPage()),
    );
  }
}
