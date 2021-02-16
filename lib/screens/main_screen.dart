import 'package:covid_status/common/page_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid_status/common/bottom_navigation_bar.dart';

class MainScreen extends StatelessWidget {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        children: [
          Scaffold(
            bottomNavigationBar: CustomBottomNavigation(),
            appBar: AppBar(
              title: Text('Covid Status'),
              centerTitle: true,
              actions: [],
            ),
          ),
        ],
      ),
    );
  }
}
