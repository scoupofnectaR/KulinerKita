import 'package:flutter/material.dart';
import 'package:kuliner_kita/theme/app_theme.dart';
import 'package:kuliner_kita/score_manager.dart';

class TebakGambarScreen extends StatefulWidget {
  const TebakGambarScreen({super.key});

  @override
  State<TebakGambarScreen> createState() => _TebakGambarScreenState();
}

class _TebakGambarScreenState extends State<TebakGambarScreen>
    with SingleTickerProviderStateMixin {
  int _selected = -1;
  bool _answered = false;
  int _timeLeft = 15;
  late AnimationController _timerController;

  int currentQuestion = 0;
int score = 0;

final List<Map<String, dynamic>> questions = [
  {
    'question': 'Makanan apa ini?',
    'image': 'assets/images/bakso.jpg',
    'answers': [
      'Bakso',
      'Rawon',
      'Pempek',
      'Gudeg'
    ],
    'correct': 0,
  },

  {
    'question': 'Makanan apa ini?',
    'image': 'assets/images/gadogado.jpg',
    'answers': [
      'Ketoprak',
      'Gado-Gado',
      'Seblak',
      'Bakso'
    ],
    'correct': 1,
  },

  {
    'question': 'Makanan apa ini?',
    'image': 'assets/images/ketropak.jpg',
    'answers': [
      'Ketoprak',
      'Sate',
      'Gudeg',
      'Bakso'
    ],
    'correct': 0,
  },

  {
    'question': 'Makanan apa ini?',
    'image': 'assets/images/rawon.jpg',
    'answers': [
      'Bakso',
      'Rawon',
      'Soto Betawi',
      'Seblak'
    ],
    'correct': 1,
  },

  {
    'question': 'Makanan apa ini?',
    'image': 'assets/images/sotobetawi.jpg',
    'answers': [
      'Gudeg',
      'Soto Betawi',
      'Mie Ayam',
      'Pempek'
    ],
    'correct': 1,
  },

  {
    'question': 'Makanan apa ini?',
    'image': 'assets/images/nasiuduk.jpg',
    'answers': [
      'Nasi Minyak',
      'Nasi Uduk',
      'Nasi Goreng',
      'Gudeg'
    ],
    'correct': 1,
  },

  {
    'question': 'Makanan apa ini?',
    'image': 'assets/images/seblak.jpg',
    'answers': [
      'Seblak',
      'Rawon',
      'Bakso',
      'Ketoprak'
    ],
    'correct': 0,
  },

  {
    'question': 'Makanan apa ini?',
    'image': 'assets/images/ayamgeprek.jpg',
    'answers': [
      'Ayam Geprek',
      'Ayam Bakar',
      'Rendang',
      'Pempek'
    ],
    'correct': 0,
  },

  {
    'question': 'Makanan apa ini?',
    'image': 'assets/images/mieayam.jpg',
    'answers': [
      'Bakso',
      'Mie Ayam',
      'Mie Aceh',
      'Ketoprak'
    ],
    'correct': 1,
  },

  {
    'question': 'Makanan apa ini?',
    'image':
        'assets/images/martabaktelor.jpg',
    'answers': [
      'Martabak Telor',
      'Seblak',
      'Bakso',
      'Rawon'
    ],
    'correct': 0,
  },
];

  @override
  void initState() {
    super.initState();
    _timerController = AnimationController(
        vsync: this, duration: const Duration(seconds: 15))
    ..addListener(() {
  setState(() {
    _timeLeft =
        (15 - (_timerController.value * 15))
            .ceil();
  });

  if (_timeLeft <= 0 &&
      !_answered) {
    _showTimeUpDialog();
  }
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
                   Text(
                    questions[currentQuestion]['question'],
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
                    ...List.generate(
                      questions[currentQuestion]['answers'].length,
                      (i) => _answerOption(i),
                      ),
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
            Text(
              'Question ${currentQuestion + 1} of ${questions.length}',
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
      child: Image.asset(
        questions[currentQuestion]['image'],
        height: 180,
        width: double.infinity,
        fit: BoxFit.cover,
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
    if (i ==
    questions[currentQuestion]['correct']) {
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
        questions[currentQuestion]['answers'][i],
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
    ? () async {
        setState(() {
          _answered = true;
        });

        await Future.delayed(
          const Duration(milliseconds: 700),
        );

        if (_selected ==
            questions[currentQuestion]
                ['correct']) {
          score += 100;
        }

        if (currentQuestion <
            questions.length - 1) {
          setState(() {
            currentQuestion++;
            _selected = -1;
            _answered = false;
            _timeLeft = 15;

            _timerController.reset();
            _timerController.forward();
          });
        } else {
          _showResultDialog();
         
        }
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
   
  bool _scoreSaved = false;

void _showResultDialog() {
  if (!_scoreSaved) {
    ScoreManager.addScore(score);
    _scoreSaved = true;
  }

  showDialog(

    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: const Text(
        'Quiz Selesai 🎉',
      ),
      content: Text(
        'Skor kamu: ${score ~/ 100}/10\n\n'
        'Total poin: $score',
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: const Text('Keluar'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primary,
          ),
          onPressed: () {
            Navigator.pop(context);

            setState(() {
              currentQuestion = 0;
              score = 0;
              _selected = -1;
              _answered = false;
              _timeLeft = 15;
              _scoreSaved = false;
            });

            _timerController.reset();
            _timerController.forward();
          },
          child: const Text('Main Lagi'),
        ),
      ],
    ),
  );
}

void _showTimeUpDialog() {
  _timerController.stop();

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: const Text(
        'Waktu Habis 😢',
      ),
      content: const Text(
        'Kamu gagal menyelesaikan quiz.',
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: const Text('Keluar'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primary,
          ),
          onPressed: () {
            Navigator.pop(context);

            setState(() {
              currentQuestion = 0;
              score = 0;
              _selected = -1;
              _answered = false;
              _timeLeft = 15;
            });

            _timerController.reset();
            _timerController.forward();
          },
          child: const Text('Ulangi Quiz'),
        ),
      ],
    ),
  );
}
}