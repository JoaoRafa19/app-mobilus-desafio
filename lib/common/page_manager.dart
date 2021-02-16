import 'package:flutter/material.dart';

class PageManager {
  final PageController pageController;

  PageManager(this.pageController); 

  int currentPage = 0;

  void setPage(int page) {
    if (page == currentPage) return;
    currentPage = page;
    pageController.jumpToPage(page);
  }
}