import 'package:flutter/material.dart';
import 'package:kuliner_kita/theme/app_theme.dart';
import 'package:kuliner_kita/screens/home_screen.dart';
import 'package:kuliner_kita/screens/explore_screen.dart';
import 'package:kuliner_kita/screens/quiz_screen.dart';
import 'package:kuliner_kita/screens/wheel_screen.dart';
import 'package:kuliner_kita/screens/profile_screen.dart';

class MainScaffold extends StatefulWidget {
  final int initialIndex;
  const MainScaffold({super.key, this.initialIndex = 0});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  late int _currentIndex;

  final List<Widget> _screens = const [
    HomeScreen(),
    ExploreScreen(),
    QuizScreen(),
    WheelScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    final items = [
      {'icon': Icons.home_rounded, 'label': 'Home'},
      {'icon': Icons.explore_rounded, 'label': 'Explore'},
      {'icon': Icons.quiz_rounded, 'label': 'Quiz'},
      {'icon': Icons.casino_rounded, 'label': 'Wheel'},
      {'icon': Icons.person_rounded, 'label': 'Profile'},
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (i) {
              final selected = _currentIndex == i;
              return GestureDetector(
                onTap: () => setState(() => _currentIndex = i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: selected ? AppTheme.primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        items[i]['icon'] as IconData,
                        color: selected ? Colors.white : AppTheme.textGrey,
                        size: 22,
                      ),
                      if (selected) ...[
                        const SizedBox(width: 6),
                        Text(
                          items[i]['label'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}