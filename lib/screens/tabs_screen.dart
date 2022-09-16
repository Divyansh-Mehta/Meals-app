import "package:flutter/material.dart";

import "../widgets/main_drawer.dart";
import "./favorites_screen.dart";
import "./categories_screen.dart";
import "../models/meal.dart";

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;

  TabScreen(this.favoriteMeal);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
    {"page": CategoriesScreen(), "title": "Categories"},
    {"page": FavoritesScreen(widget.favoriteMeal), "title": "Your Favorite"},
  ];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"]),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: const Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: const Text("Favorites"),
          )
        ],
      ),
    );
  }
}
