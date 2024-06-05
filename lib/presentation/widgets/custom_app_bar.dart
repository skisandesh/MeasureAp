import 'package:flutter/material.dart';
import 'package:measure_ap/constants/export_constants.dart';
import 'package:measure_ap/presentation/widgets/cutom_image.dart';
import 'package:measure_ap/utils/navigator_service.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool actions;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({super.key, 
    required this.title,
    this.actions = false,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: semiBoldType16,
      ),
      centerTitle: true,
      bottom: bottom,
      leading: GestureDetector(
        onTap: () => NavigatorService.goBack(),
        child: Padding(
          padding: const EdgeInsets.only(left: 28.0),
          child: CustomImageView(
            height: 24,
            width: 24,
            imagePath: AssetsConstant.leftArrowIcon,
          ),
        ),
      ),
      actions: actions
          ? [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomImageView(
                  imagePath: AssetsConstant.moreIcon,
                ),
              )
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        kToolbarHeight + (bottom?.preferredSize.height ?? 0.0),
      );
}


// AppBar(
//         backgroundColor: Colors.transparent,
//         title: Text(
//           "Assessment",
//           style: semiBoldType16,
//         ),
//         centerTitle: true,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: CustomImageView(
//               imagePath: AssetsConstant.moreIcon,
//             ),
//           )
//         ],
//       )