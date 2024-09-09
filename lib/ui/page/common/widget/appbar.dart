import 'dart:ui';
import 'package:bigaze/ui/page/notifications_page.dart';
import 'package:flutter/material.dart';
import 'package:bigaze/ui/theme/color/soothingcolors.dart';
import 'dart:math';

class CoolAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const CoolAppBar(String s, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
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
                "BiG∆ZE",
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
    super.key,
    required this.title,
    // required List<PopupMenuButton<String>> actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
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
          // Navigator.pop(context);
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
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(2, 13, 13, 13).withAlpha(100),
      shadowColor: const Color.fromARGB(255, 91, 74, 124),
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
                    color: const Color.fromARGB(159, 224, 217, 239),
                    shadows: [
                      Shadow(
                        offset: const Offset(1, 1), // Set the shadow offset
                        color: const Color.fromARGB(255, 0, 0, 0)
                            .withOpacity(1), // Set the shadow color and opacity
                        blurRadius: 8, // Set the blur radius
                      ),
                    ],
                    decorationStyle: TextDecorationStyle.double,
                    letterSpacing: 2.5,
                  )),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// App bar for the results page

class ResultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;

  const ResultAppBar({
    super.key,
    required this.title,
    required this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
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
          // Navigator.pop(context);
        },
        child: Text(
          title,
          style: const TextStyle(color: Colors.white60),
        ),
      ),
      actions: actions,
    );
  }
}
