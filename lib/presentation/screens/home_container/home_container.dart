
import 'package:flutter/material.dart';
import 'package:measure_ap/presentation/screens/home_screen/home_screen.dart';
import 'package:measure_ap/presentation/widgets/custom_botton_bar.dart';
import 'package:measure_ap/routes/app_routes.dart';

// ignore_for_file: must_be_immutable
class HomeContainerScreen extends StatefulWidget {
  const HomeContainerScreen({super.key});

  static Widget builder(BuildContext context) {
    return const HomeContainerScreen();
  }

  @override
  State<HomeContainerScreen> createState() => _HomeContainerScreenState();
}

class _HomeContainerScreenState extends State<HomeContainerScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            
            body: Navigator(
                    key: navigatorKey,
                    initialRoute: AppRoutes.homeScreen,
                    onGenerateRoute: (routeSetting) => PageRouteBuilder(
                        pageBuilder: (ctx, ani, ani1) =>
                            getCurrentPage(context, routeSetting.name!),
                        transitionDuration: const Duration(seconds: 0))),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.home:
        return AppRoutes.homeScreen;
      
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.homeScreen:
        return HomeScreen.builder(context);
      // case AppRoutes.practiceScreen:
      //   return PracticeScreen.builder(context);
      // case AppRoutes.flashcardScreen:
      //   return FlashcardScreen.builder(context);
      // case AppRoutes.translationScreen:
      //   return TranslationScreen.builder(context);
      // case AppRoutes.profileScreen:
      //   return ProfileScreen.builder(context);
      default:
        return const DefaultWidget();
    }
  }
}
