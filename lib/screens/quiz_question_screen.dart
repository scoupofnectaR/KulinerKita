import 'package:flutter/material.dart';
import 'package:kuliner_kita/theme/app_theme.dart';

class QuizQuestionScreen extends StatefulWidget {
  const QuizQuestionScreen({super.key});

  @override
  State<QuizQuestionScreen> createState() => _QuizQuestionScreenState();
}

class _QuizQuestionScreenState extends State<QuizQuestionScreen>
    with SingleTickerProviderStateMixin {
  int _selected = -1;
  bool _answered = false;
  int _timeLeft = 15;
  late AnimationController _timerController;

  final answers = ['Rendang', 'Sate Ayam', 'Gado Gado', 'Soto Betawi'];
  final correctIndex = 3;

  @override
  void initState() {
    super.initState();
    _timerController = AnimationController(
        vsync: this, duration: const Duration(seconds: 15))
      ..addListener(() {
        setState(() {
          _timeLeft = (15 - (_timerController.value * 15)).ceil();
        });
      })
      ..forward();
  }

  @override
  void dispose() {
    _timerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    _buildQuestionImage(),
                    const SizedBox(height: 20),
                    const Text(
                      'Apa nama hidangan khas dari Jawa Tengah ini?',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Pilih jawaban yang paling tepat!',
                      style: TextStyle(
                          color: AppTheme.textGrey, fontSize: 13),
                    ),
                    const SizedBox(height: 20),
                    ...List.generate(answers.length, (i) => _answerOption(i)),
                    const SizedBox(height: 20),
                    _nextButton(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.close),
            ),
            const SizedBox(width: 12),
            const Text('Question 4 of 10',
                style: TextStyle(fontWeight: FontWeight.w600)),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                  color: _timeLeft <= 5 ? Colors.red : Colors.red[50],
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Icon(Icons.timer,
                      color: _timeLeft <= 5 ? Colors.white : Colors.red,
                      size: 16),
                  const SizedBox(width: 4),
                  Text('${_timeLeft}s remaining',
                      style: TextStyle(
                          color: _timeLeft <= 5 ? Colors.white : Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildQuestionImage() => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          'https://www.themealdb.com/images/media/meals/sytuqu1511882485.jpg',
          height: 180,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            height: 180,
            decoration: BoxDecoration(
              color: Colors.brown[300],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                const Center(
                  child: Icon(Icons.restaurant,
                      color: Colors.white54, size: 60),
                ),
                Positioned(
                  top: 10, left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Text('Medium Heat',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
          loadingBuilder: (_, child, progress) {
            if (progress == null) return child;
            return Container(
              height: 180,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16)),
              child: const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      );

  Widget _answerOption(int i) {
  Color bgColor = Colors.white;
  Color borderColor = const Color(0xFFE0E0E0);
  Color textColor = AppTheme.textDark;

  // BELUM submit jawaban
  if (!_answered && _selected == i) {
    bgColor = Colors.orange[50]!;
    borderColor = AppTheme.primary;
    textColor = AppTheme.primary;
  }

  // SETELAH submit jawaban
  if (_answered) {
    if (i == correctIndex) {
      bgColor = Colors.green[50]!;
      borderColor = Colors.green;
      textColor = Colors.green[800]!;
    } else if (i == _selected) {
      bgColor = Colors.red[50]!;
      borderColor = Colors.red;
      textColor = Colors.red[800]!;
    }
  }

  return GestureDetector(
    onTap: () {
      if (!_answered) {
        setState(() {
          _selected = i;
        });
      }
    },
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: borderColor,
          width: 1.5,
        ),
      ),
      child: Text(
        answers[i],
        style: TextStyle(
          color: textColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

  Widget _nextButton() => SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          onPressed: _selected != -1
    ? () {
        setState(() {
          _answered = true;
        });
      }
    : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primary,
            disabledBackgroundColor: Colors.grey[300],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text('Continue to Next Question',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ),
      );
}