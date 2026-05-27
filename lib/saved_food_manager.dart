class SavedFoodManager {
  static List<Map<String, dynamic>>
      savedFoods = [];

  static void saveFood(
      Map<String, dynamic> food) {
    final alreadySaved =
        savedFoods.any(
      (item) =>
          item['name'] == food['name'],
    );

    if (!alreadySaved) {
      savedFoods.add(food);
    }
  }

  static void removeFood(
      String foodName) {
    savedFoods.removeWhere(
      (food) =>
          food['name'] == foodName,
    );
  }

  static bool isSaved(
      String foodName) {
    return savedFoods.any(
      (food) =>
          food['name'] == foodName,
    );
  }
}