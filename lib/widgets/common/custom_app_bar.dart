import 'package:appkwiz/configs/themes/custom_text_style.dart';
import 'package:appkwiz/configs/themes/ui_paramters.dart';
import 'package:appkwiz/widgets/app_circle_button.dart';
import 'package:flutter/material.dart';

import '../../configs/themes/app_icons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title = "",
    this.titleWidget,
    this.leading,
    this.showActionButton = false,
    this.onMenuActionTap,
  }) : super(key: key);

  final String title;
  final Widget? leading;
  final Widget? titleWidget;
  final bool showActionButton;
  final VoidCallback? onMenuActionTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: mobilescreenPadding,
          vertical: mobilescreenPadding,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: titleWidget == null
                  ? Center(
                      child: Text(
                        title,
                        style: appBarTS,
                      ),
                    )
                  : Center(child: titleWidget),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leading ??
                    Transform.translate(
                      offset: const Offset(-14, 0),
                      child: const BackButton(),
                    ),
                if (showActionButton)
                  Transform.translate(
                    offset: const Offset(10, 0),
                    child: AppCircleButton(
                      onTap: () => onMenuActionTap,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(AppIcons.menuLeft),
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(
        double.maxFinite,
        80,
      );
}
