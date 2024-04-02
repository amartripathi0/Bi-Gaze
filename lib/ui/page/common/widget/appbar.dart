import 'dart:ui';
import 'package:bigaze/ui/page/notifications_page.dart';
import 'package:flutter/material.dart';
import 'package:bigaze/ui/theme/color/soothingcolors.dart';
import 'dart:math';


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
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationPage()),
                    );
                  },
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

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CommonAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(2, 13, 13, 13).withAlpha(200),
      shadowColor: SoothingColors.purpleGray,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(30, 20),
          bottomRight: Radius.elliptical(30, 20),
        ),
      ),
      elevation: 3,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        ),
      ),
      centerTitle: true,
      title: GestureDetector(
        onTap: () {
          // Navigate to the home page when app bar is tapped
          Navigator.pop(context);
        },
        child: Text(
          title,
          style: const TextStyle(color: Colors.white60),
        ),
      ),
    );
  }
}

// Proctor app bar
class ProctorAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const ProctorAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(2, 13, 13, 13).withAlpha(100),
      shadowColor: SoothingColors.purpleGray,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(30, 20),
          bottomRight: Radius.elliptical(30, 20),
        ),
      ),
      elevation: 3,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        ),
      ),
      centerTitle: true,
      title: Transform.rotate(
        angle: pi,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: title.split('').map((letter) {
            return Transform.rotate(
              angle: -pi / 2, // Rotate each letter by 90 degrees clockwise
              child: Text(letter,
                  style: TextStyle(
                    color: SoothingColors.purpleGray,
                    shadows: [
                      Shadow(
                        offset: const Offset(1, 1), // Set the shadow offset
                        color: const Color.fromARGB(255, 0, 0, 0)
                            .withOpacity(1), // Set the shadow color and opacity
                        blurRadius: 8, // Set the blur radius
                      ),
                    ],
                    decorationStyle: TextDecorationStyle.double,
                  )),
            );
          }).toList(),
        ),
      ),
    );
  }
}
