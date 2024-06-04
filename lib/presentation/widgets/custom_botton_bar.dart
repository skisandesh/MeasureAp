import 'package:flutter/material.dart';
import 'package:measure_ap/constants/export_constants.dart';
import 'package:measure_ap/presentation/widgets/cutom_image.dart';
import 'package:measure_ap/utils/size.config.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key, this.onChanged});

  final Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: AssetsConstant.homeIcon,
      activeIcon: AssetsConstant.homeIcon,
      title: "Home",
      type: BottomBarEnum.home,
    ),
    BottomMenuModel(
      icon: AssetsConstant.patientIcon,
      activeIcon: AssetsConstant.patientIcon,
      title: "Patients",
      type: BottomBarEnum.patient,
    ),
    BottomMenuModel(
      icon: AssetsConstant.historyIcon,
      activeIcon: AssetsConstant.historyIcon,
      title: "History",
      type: BottomBarEnum.history,
    ),
    BottomMenuModel(
      icon: AssetsConstant.settingIcon,
      activeIcon: AssetsConstant.settingIcon,
      title: "Settings",
      type: BottomBarEnum.setting,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [],
      ),
      child: BottomAppBar(
        surfaceTintColor: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Container(
          decoration: const BoxDecoration(
              // color: Colors.transparent,
              ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedFontSize: 0,
            elevation: 0,
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            items: List.generate(bottomMenuList.length, (index) {
              return BottomNavigationBarItem(
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                        imagePath: bottomMenuList[index].icon,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        color: greyColor),
                    Padding(
                      padding: EdgeInsets.only(top: 3.v),
                      child: Text(
                        '${bottomMenuList[index].title}',
                        style: mediumType12,
                      ),
                    ),
                  ],
                ),
                activeIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: bottomMenuList[index].activeIcon,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      color: orange700Color,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.v),
                      child: Text('${bottomMenuList[index].title}',
                          style: mediumType12Orange),
                    ),
                  ],
                ),
                label: '',
              );
            }),
            onTap: (index) {
              selectedIndex = index;
              widget.onChanged?.call(bottomMenuList[index].type);
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}

enum BottomBarEnum { home, patient, history, setting }

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
