import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fmdakgg/home_screen/home_screen_model.dart';

class HomeScreenViewModel extends StateNotifier<HomeScreenModel> {
  HomeScreenViewModel() : super(HomeScreenModel());

  void filterCharacters(String query) {
    if (query.isEmpty) {
      state = HomeScreenModel();
    } else {
      final filteredList = state.characterList.where((character) {
        return character.toLowerCase().contains(query.toLowerCase());
      }).toList();
      state = state.copyWith(characterList: filteredList);
    }
  }
}
