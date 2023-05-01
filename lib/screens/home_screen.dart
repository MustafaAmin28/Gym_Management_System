import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_graduation_app/helper/api.dart';
import 'package:gym_graduation_app/models/recipe_model.dart';
import 'package:gym_graduation_app/screens/announcements_screen.dart';
import 'package:gym_graduation_app/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/custom_list_tile.dart';
import '../constants.dart';
import 'calculators_screen.dart';
import 'classes_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'conversations_screen.dart';
import 'trainee_profile_screen.dart';
import 'recipes_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late List pages = [
    const ClassesScreen(),
    ConversationsScreen(),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                print(loggedUser!.photo);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TraineeProfileScreen(trainee: loggedUser!);
                }));
              },
              child: DrawerHeader(
                  decoration: const BoxDecoration(color: kPrimaryColor),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: kPrimaryColor,
                        child: CircleAvatar(
                          radius: 49,
                          backgroundColor: kPrimaryColor,
                          backgroundImage: (loggedUser!.photo == null
                              ? const AssetImage(kPersonAvatar)
                              : CachedNetworkImageProvider(loggedUser!.photo!, errorListener: () => const AssetImage(kFailedNetworkImage))) as ImageProvider,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 2),
                        child: Text(
                          "Welcome,\n${loggedUser!.name.split(" ").first}!",
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      )
                    ],
                  )),
            ),
            CustomListTile(
              trailing: FontAwesomeIcons.calculator,
              title: 'Body Calculators',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CalculatorsScreen();
                }));
              },
            ),
            CustomListTile(
              trailing: FontAwesomeIcons.utensils,
              title: 'Meal Recipes',
              onTap: () async {
                List<RecipeModel> recipesList = [];
                await getRecipes(recipesList: recipesList);
                // ignore: use_build_context_synchronously
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RecipesScreen(recipesList: recipesList);
                }));
              },
            ),
            CustomListTile(
              trailing: FontAwesomeIcons.rightFromBracket,
              title: 'Sign Out',
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('user');
                prefs.remove('trainer');
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext ctx) => const LoginScreen()));
              },
            ),
            const Spacer(
              flex: 1,
            ),
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                "Contact us:\n\n\nWhatsApp: +201145587563\n\nEmail: EdgeGym@gmail.com",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 10,
            )
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
          children: [const ClassesScreen(), ConversationsScreen(), AnnouncementsScreen()]),
    );
  }

  getRecipes({required List<RecipeModel> recipesList}) async {
    final recipesResponse = await Api.getRecipes();
    if (recipesResponse["status"] == "success") {
      for (int i = 0; i < recipesResponse["length"]; i++) {
        recipesList.add(RecipeModel.fromMap(recipesResponse["receipies"][i]));
      }
    } else {
      Fluttertoast.showToast(msg: recipesResponse["message"]);
    }
  }
}
