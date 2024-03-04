import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:bigaze/ui/theme/color/soothingcolors.dart';

class CoolAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const CoolAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(2, 13, 13, 13).withAlpha(200),
      shadowColor: SoothingColors.purpleGray,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.elliptical(30, 20),
            bottomRight: Radius.elliptical(30, 20)),
      ),
      elevation: 3,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        ),
      ),
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/AppIcons/android/mipmap-xhdpi/bigaze.png',
                width: 50,
                height: 50,
              ),
              const Text(
                "BiGaze",
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
