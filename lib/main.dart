import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:measure_ap/firebase_options.dart';
import 'package:measure_ap/routes/app_routes.dart';
import 'package:measure_ap/utils/navigator_service.dart';
import 'package:measure_ap/utils/size.config.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        navigatorKey: NavigatorService.navigatorKey,
        scaffoldMessengerKey: globalMessengerKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: AppRoutes.homeContainerScreen,
        routes: AppRoutes.routes,
      );
    });
  }
}
