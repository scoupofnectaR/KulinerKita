import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kuliner_kita/theme/app_theme.dart';

class WheelScreen extends StatefulWidget {
  const WheelScreen({super.key});

  @override
  State<WheelScreen> createState() => _WheelScreenState();
}

class _WheelScreenState extends State<WheelScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _currentAngle = 0;
  bool _isSpinning = false;
  int _selectedCategory = 0;

  final menus = ['Nasi Goreng', 'Bakso', 'Gado-gado', 'Sate', 'Rendang', 'Mie Goreng'];
  final categories = ['Pedas', 'Vegetarian', 'Dessert'];

  final history = [
    {'name': 'Sate Ayam Madura', 'time': '2 jam yang lalu'},
    {'name': 'Nasi Goreng Spesial', 'time': 'Kemarin'},
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  void _spin() {
    if (_isSpinning) return;
    setState(() => _isSpinning = true);
    final random = Random();
    final extraSpins = (random.nextDouble() * 5 + 5) * 2 * pi;
    final target = _currentAngle + extraSpins;

    _animation = Tween<double>(begin: _currentAngle, end: target).animate(
      CurvedAnimation(parent: _controller, curve: Curves.decelerate),
    )..addListener(() {
        setState(() {});
      })
      ..addStatusListener((s) {
        if (s == AnimationStatus.completed) {
          setState(() {
            _isSpinning = false;
            _currentAngle = _animation.value % (2 * pi);
          });
        }
      });

    _controller.duration =
        Duration(milliseconds: 3000 + random.nextInt(1000));
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('KulinerKita',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Container(
                    width: 40, height: 40,
                    decoration: BoxDecoration(
                        color: AppTheme.primary,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.restaurant_menu,
                        color: Colors.white, size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text('Bingung Pilih Menu?',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              const Text('Putar rodanya dan temukan kejutan rasa hari ini!',
                  style: TextStyle(color: AppTheme.textGrey, fontSize: 14)),
              const SizedBox(height: 32),

              // Wheel
              Center(
                child: SizedBox(
                  width: 280, height: 280,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (_, __) => Transform.rotate(
                          angle: _isSpinning ? _animation.value : _currentAngle,
                          child: CustomPaint(
                            size: const Size(280, 280),
                            painter: _WheelPainter(menus),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _spin,
                        child: Container(
                          width: 72, height: 72,
                          decoration: BoxDecoration(
                            color: AppTheme.primary,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: AppTheme.primary.withOpacity(0.4),
                                  blurRadius: 12,
                                  spreadRadius: 2)
                            ],
                          ),
                          child: const Center(
                            child: Text('SPIN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                          ),
                        ),
                      ),
                      // Pointer
                      Positioned(
                        top: 0,
                        child: Icon(Icons.arrow_drop_down,
                            color: AppTheme.primary, size: 36),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Categories
              const Text('Pilih Kategori Keberuntungan',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: List.generate(
                  categories.length,
                  (i) => GestureDetector(
                    onTap: () => setState(() => _selectedCategory = i),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: _selectedCategory == i
                            ? AppTheme.primary
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: _selectedCategory == i
                                ? AppTheme.primary
                                : const Color(0xFFE0E0E0)),
                      ),
                      child: Text(categories[i],
                          style: TextStyle(
                              color: _selectedCategory == i
                                  ? Colors.white
                                  : AppTheme.textDark,
                              fontSize: 13)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // History
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Riwayat Putaran',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  TextButton(
                      onPressed: () {},
                      child: const Text('Lihat Semua',
                          style: TextStyle(color: AppTheme.primary))),
                ],
              ),
              const SizedBox(height: 12),
              ...history.map((h) => Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 50, height: 50,
                          decoration: BoxDecoration(
                              color: AppTheme.primaryLight,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(Icons.restaurant,
                              color: AppTheme.primary),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(h['name']!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                            Text(h['time']!,
                                style: const TextStyle(
                                    color: AppTheme.textGrey, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class _WheelPainter extends CustomPainter {
  final List<String> items;
  _WheelPainter(this.items);

  final colors = const [
    Color(0xFFE8510A), Color(0xFFF97316), Color(0xFFFBBF24),
    Color(0xFF34D399), Color(0xFF60A5FA), Color(0xFFA78BFA),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final sliceAngle = 2 * pi / items.length;

    for (int i = 0; i < items.length; i++) {
      final paint = Paint()..color = colors[i % colors.length];
      canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius),
          i * sliceAngle - pi / 2,
          sliceAngle,
          true,
          paint);

      // Text
      final textAngle = i * sliceAngle + sliceAngle / 2 - pi / 2;
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(textAngle);
      final tp = TextPainter(
        text: TextSpan(
          text: items[i],
          style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(radius * 0.5 - tp.width / 2, -tp.height / 2));
      canvas.restore();
    }

    // Center circle
    canvas.drawCircle(center, 36,
        Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(_) => true;
}