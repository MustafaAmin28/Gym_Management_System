import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_graduation_app/screens/login_screen.dart';
import '../components/custom_list_tile.dart';
import '../constants.dart';
import 'calculators_screen.dart';
import 'classes_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'conversations_screen.dart';
import 'profile_screen.dart';
import 'recipes_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late List pages = [
    const ClassesScreen(),
    ConversationsScreen(),
    const RecipesScreen(),
  ];
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          color: kPrimaryColor,
          index: _currentIndex,
          height: 55,
          animationCurve: Curves.easeOut,
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              pageController.animateToPage(_currentIndex, duration: const Duration(milliseconds: 300), curve: Curves.ease);
            });
          },
          items: const [
            Icon(
              FontAwesomeIcons.house,
              color: Colors.white,
            ),
            Icon(
              FontAwesomeIcons.solidMessage,
              color: Colors.white,
            ),
            Icon(
              FontAwesomeIcons.solidBell,
              color: Colors.white,
            )
          ]),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          kGymName,
          style: TextStyle(
            fontFamily: kFontFamily,
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: kBackgroundColor,
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfileScreen(person: loginedUser);
                }));
              },
              child: DrawerHeader(
                  decoration: const BoxDecoration(color: kPrimaryColor),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(radius: 59, backgroundImage: AssetImage(loginedUser.image)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, top: 10),
                        child: Text(
                          "Welcome,\n ${loginedUser.name}!",
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      )
                    ],
                  )),
            ),
            CustomListTile(
              leading: const Icon(FontAwesomeIcons.calculator),
              title: 'Body Calculators',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CalculatorsScreen();
                }));
              },
            ),
            CustomListTile(
              leading: const Icon(FontAwesomeIcons.utensils),
              title: 'Meal Recipes',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const RecipesScreen();
                }));
              },
            ),
          ],
        ),
      ),
      body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          scrollDirection: Axis.horizontal,
          children: [
            const ClassesScreen(),
            ConversationsScreen(),
          ]),
    );
  }
}
