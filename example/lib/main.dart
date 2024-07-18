import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:badges/badges.dart' as badges;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _controller = SideMenuController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Row(
          children: [
            SideMenu(

              minWidth: 60,
              controller: _controller,
              backgroundColor: Colors.blueGrey,
              mode: SideMenuMode.open,
              builder: (data) {
                return SideMenuData(
                  defaultTileData: SideMenuItemTileDefaults(
                    decoration: const BoxDecoration(

                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    selectedDecoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    hoverColor: Colors.black,
                    titleStyle: const TextStyle(color: Colors.white),

                  ),
                  animItems: SideMenuItemsAnimationData(),

                  items: [
                     SideMenuItemDataTile(
                      isSelected: _currentIndex == 10,
                      subMenuItems: [
                        SideMenuItemDataTile(
                          isSelected: _currentIndex == 1,
                          onTap: ()=> setState(() => _currentIndex = 1),
                          subMenuItems: [
                            SideMenuItemDataTile(
                              isSelected: _currentIndex == 2,
                              onTap: ()=> setState(() => _currentIndex = 2),
                              title: 'Item 1',
                              icon: const Icon(Icons.search),
                              selectedIcon: const Icon(Icons.search_rounded),
                            ),
                          ],
                          title: 'Item 1',
                          icon: const Icon(Icons.home_outlined),
                          selectedIcon: const Icon(Icons.home),
                        ),
                        SideMenuItemDataTile(
                          isSelected: _currentIndex == 2,
                          onTap: ()=> setState(() => _currentIndex = 2),
                          title: 'Item 1',
                          icon: const Icon(Icons.search),
                          selectedIcon: const Icon(Icons.search_rounded),
                        ),
                      ],
                      title: 'Item 10',
                      icon: const Icon(Icons.home_outlined),
                      selectedIcon: const Icon(Icons.home),
                    ),
                    SideMenuItemDataTile(
                      isSelected: true,
                      title: 'Item 10',
                      icon: const Icon(Icons.home_outlined),
                      selectedIcon: const Icon(Icons.home),
                    ),
                  ],
                  footer: const Text('Footer'),
                );
              },
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'body',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _controller.toggle();
                      },
                      child: const Text('change side menu state'),
                    )
                  ],
                ),
              ),
            ),
            SideMenu(
              position: SideMenuPosition.right,
              builder: (data) => const SideMenuData(
                customChild: Text('custom view'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
