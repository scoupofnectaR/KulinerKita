class ScoreManager {
  static int totalScore = 0;

  static void addScore(int score) {
    totalScore += score;
  }

  static String getLevel() {
    if (totalScore >= 700) {
      return 'Ahli Kuliner';
    } else if (totalScore >= 300) {
      return 'Menengah';
    } else {
      return 'Pemula';
    }
  }

  static double getProgress() {
    return (totalScore / 1000)
        .clamp(0.0, 1.0);
  }
}