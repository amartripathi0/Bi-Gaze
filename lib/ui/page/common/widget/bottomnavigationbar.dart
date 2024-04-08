import 'package:bigaze/ui/theme/color/soothingcolors.dart';
import 'package:flutter/material.dart';

class CoolBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CoolBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
                color: const Color.fromARGB(
                    255, 180, 180, 180)), // Add border decoration
          ),
          child: BottomNavigationBar(
            backgroundColor: const Color.fromARGB(187, 51, 44, 65)
                .withAlpha(80), // Make background transparent
            elevation: 3,
            type: BottomNavigationBarType.fixed,
            selectedItemColor:
                SoothingColors.purpleGray, // Customize the selected item color
            unselectedItemColor:
                Colors.grey, // Customize the unselected item color
            currentIndex: currentIndex,
            onTap: onTap,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pages_outlined),
                label: 'Result',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.document_scanner_outlined),
                label: 'Scanner',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
