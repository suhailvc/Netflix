import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

ValueNotifier<int> indexnotifier = ValueNotifier(0);

class BottomNavBarwidget extends StatelessWidget {
  const BottomNavBarwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexnotifier,
      builder: (context, int newIndex, _) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: BottomNavigationBar(
              onTap: (index) {
                indexnotifier.value = index;
              },
              currentIndex: newIndex,
              backgroundColor: backgorundcolor,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              selectedIconTheme: const IconThemeData(color: Colors.white),
              unselectedIconTheme: const IconThemeData(color: Colors.grey),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: 'home'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.collections,
                    ),
                    label: 'New&Hot'),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.emoji_emotions,
                  ),
                  label: 'Fast Laughs',
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                    ),
                    label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.download,
                    ),
                    label: 'Downloads'),
              ]),
        );
      },
    );
  }
}
