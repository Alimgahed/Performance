import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search_Controller extends GetxController {
  var searchText = ''.obs;
  var isSearching = false.obs;
  var searchQuery = ''.obs;
  TextEditingController? search;
  // Method to update the search query
  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  // Function to toggle search mode
  void toggleSearch() {
    isSearching.value = !isSearching.value;
    if (!isSearching.value) {
      searchText.value = ''; // Clear search text when exiting search mode
    }
  }

  // Update search text
  void updateSearchText(String text) {
    search?.text = text;
  }
}
