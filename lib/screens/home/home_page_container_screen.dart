// ignore_for_file: must_be_immutable
import 'package:al_hadith/core/ui_constants.dart';
import 'package:al_hadith/core/ui_utils.dart';
import 'package:al_hadith/screens/chapters/chapter_screen.dart';
import 'package:al_hadith/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePageContainerScreen extends StatefulWidget {
  const HomePageContainerScreen({super.key});

  @override
  State<HomePageContainerScreen> createState() =>
      _HomePageContainerScreenState();
}

class _HomePageContainerScreenState extends State<HomePageContainerScreen> {
  late PersistentTabController controller;

  @override
  void initState() {
    super.initState();
    controller = PersistentTabController(initialIndex: 0);
  }

  late PageController _pageController;
  var currentSelected = 0.obs;

  _getItemBottomBarItem(title, assetSvg, index) => InkWell(
        onTap: () {
          currentSelected.value = index;
          _pageController.jumpToPage(index);
        },
        child: Obx(() => Container(
              margin: margin4,
              decoration: BoxDecoration(
                color: (currentSelected.value == index)
                    ? hexToColor("#F7F7F7")
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
              ),
              padding: marginH16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "$assetSvg",
                    height: 18,
                  ),
                  gap4,
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Metropolis',
                      color: (currentSelected.value == index)
                          ? Colors.black
                          : hexToColor("#263238").withAlpha(150),
                    ),
                    // style: caption2RegularTextStyle.copyWith(

                    // ),
                  ),
                ],
              ),
            )),
      );

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: hexToColor("#30588c"),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.book),
        title: ("Chapters"),
        activeColorPrimary: hexToColor("#30588c"),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.calendar),
        title: ("Hadith"),
        activeColorPrimary: hexToColor("#30588c"),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  List<Widget> _buildScreens(context) {
    return [
      const HomeScreen(),
      const ChapterScreen(),
      Scaffold(
        body: const Column(
          children: [
            Text('fjksajfkldjasf'),
          ],
        ),
        appBar: AppBar(
          title: const Text('Page2'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _pageController = PageController(initialPage: 0, keepPage: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: _buildScreens(context),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.white,
          height: kBottomNavigationBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _getItemBottomBarItem("Home", "assets/icons/home.png", 0),
              _getItemBottomBarItem("Chapters", "assets/icons/quran.png", 1),
              _getItemBottomBarItem("Hadith", "assets/icons/save.png", 2),
            ],
          ),
        ),
      ),
    );
  }
}
