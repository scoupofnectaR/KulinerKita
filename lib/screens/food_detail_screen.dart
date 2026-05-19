import 'package:flutter/material.dart';
import 'package:kuliner_kita/theme/app_theme.dart';

class FoodDetailScreen extends StatefulWidget {
  final String name;
  final String imageUrl;

 const FoodDetailScreen({
  super.key,
  this.name = 'Rendang',
  this.imageUrl = 'https://www.themealdb.com/images/media/meals/bc3z651695747515.jpg',
});

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  int _tabIndex = 0;
  int _selectedQuiz = -1;
bool _quizAnswered = false;

final int _correctQuiz = 1; // B. Kalio

  final tabs = ['Tentang', 'Bahan Utama', 'Filosofi Budaya'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHero(context),
            _buildInfo(),
            _buildTabs(),
            _buildTabContent(),
            _buildCobaTebak(),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomButton(),
    );
  }

  Widget _buildHero(BuildContext context) => Stack(
        children: [
          SizedBox(
  height: 280,
  width: double.infinity,
  child: Image.asset(
    'assets/images/rendang.jpg',
    fit: BoxFit.cover,
  ),
),

          Positioned(
            top: 50, left: 16,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 40, height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(Icons.arrow_back, size: 20),
              ),
            ),
          ),
          Positioned(
            top: 50, right: 16,
            child: Container(
              width: 40, height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(Icons.favorite_border,
                  color: AppTheme.primary, size: 20),
            ),
          ),
        ],
      );

  Widget _buildInfo() => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                  color: AppTheme.primary,
                  borderRadius: BorderRadius.circular(8)),
              child: const Text('TRADISI MINANG',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            Text(widget.name,
                style: const TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            const Row(
              children: [
                Icon(Icons.location_on, color: AppTheme.primary, size: 16),
                SizedBox(width: 4),
                Text('Sumatera Barat',
                    style:
                        TextStyle(color: AppTheme.primary, fontSize: 13)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _infoChip(Icons.access_time, '4-5 Jam'),
                const SizedBox(width: 8),
                _infoChip(Icons.local_fire_department, 'Sedang'),
                const SizedBox(width: 8),
                _infoChip(Icons.people, '6 Porsi'),
              ],
            ),
          ],
        ),
      );

  Widget _infoChip(IconData icon, String label) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppTheme.primaryLight,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppTheme.primary, size: 16),
            const SizedBox(width: 6),
            Text(label,
                style: const TextStyle(
                    color: AppTheme.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      );

  Widget _buildTabs() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              tabs.length,
              (i) => GestureDetector(
                onTap: () => setState(() => _tabIndex = i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: _tabIndex == i
                        ? AppTheme.primary
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: _tabIndex == i
                            ? AppTheme.primary
                            : const Color(0xFFE0E0E0)),
                  ),
                  child: Text(tabs[i],
                      style: TextStyle(
                          color: _tabIndex == i
                              ? Colors.white
                              : AppTheme.textDark,
                          fontSize: 13,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            ),
          ),
        ),
      );

  Widget _buildTabContent() {
    if (_tabIndex == 0) return _aboutTab();
    if (_tabIndex == 1) return _bahanTab();
    return _filosofiTab();
  }

  Widget _aboutTab() => Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          'Rendang bukan sekadar masakan, melainkan simbol budaya masyarakat Minangkabau. Proses memasaknya yang membutuhkan waktu lama melambangkan kesabaran dan ketekunan. Potongan daging sapi dimasak perlahan dalam santan dan rempah-rempah hingga bumbunya meresap sempurna dan santannya mengering menjadi dedak.',
          style: TextStyle(
              color: Colors.grey[700], fontSize: 14, height: 1.6),
        ),
      );

  Widget _bahanTab() => Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          children: [
            _bahanItem('🥩', 'Daging Sapi'),
            _bahanItem('🥥', 'Santan Kental'),
            _bahanItem('🌿', 'Serai & Daun'),
            _bahanItem('🫙', 'Bumbu Halus'),
          ],
        ),
      );

  Widget _bahanItem(String emoji, String label) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56, height: 56,
            decoration: BoxDecoration(
                color: AppTheme.primaryLight,
                borderRadius: BorderRadius.circular(14)),
            child: Center(
                child:
                    Text(emoji, style: const TextStyle(fontSize: 28))),
          ),
          const SizedBox(height: 6),
          Text(label,
              style: const TextStyle(fontSize: 11),
              textAlign: TextAlign.center),
        ],
      );

  Widget _filosofiTab() => Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.primaryLight,
            borderRadius: BorderRadius.circular(12),
            border:
                Border.all(color: AppTheme.primary.withOpacity(0.2)),
          ),
          child: const Text(
            'Rendang memiliki empat filosofi penting: Dagiang (Daging) sebagai nakhoda, Karambia (Kelapa) sebagai kaum intelektual, Lado (Cabai) sebagai pemuka agama, dan Pemasak (Bumbu) sebagai masyarakat luas.',
            style: TextStyle(
                color: AppTheme.textDark, fontSize: 14, height: 1.6),
          ),
        ),
      );

  Widget _buildCobaTebak() => Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  color: AppTheme.primary,
                  borderRadius: BorderRadius.circular(6)),
              child: const Text('Coba Tebak!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 12),
            const Text(
                'Apa nama proses memasak rendang sebelum santannya benar-benar kering?',
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 14)),
            const SizedBox(height: 12),
            _quizOption('A. Gulai', 0),
            _quizOption('B. Kalio', 1),
            _quizOption('C. Opor', 2),
          ],
        ),
      );

  Widget _quizOption(String text, int index) {
  Color bgColor = AppTheme.background;
  Color borderColor = const Color(0xFFE0E0E0);
  Color textColor = AppTheme.textDark;

  if (!_quizAnswered && _selectedQuiz == index) {
    bgColor = Colors.orange[50]!;
    borderColor = AppTheme.primary;
    textColor = AppTheme.primary;
  }

  if (_quizAnswered) {
    if (index == _correctQuiz) {
      bgColor = Colors.green[50]!;
      borderColor = Colors.green;
      textColor = Colors.green[800]!;
    } else if (index == _selectedQuiz) {
      bgColor = Colors.red[50]!;
      borderColor = Colors.red;
      textColor = Colors.red[800]!;
    }
  }

  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          print('clicked');

          setState(() {
            _selectedQuiz = index;
            _quizAnswered = true;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: borderColor),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ),
  );
}

  Widget _buildBottomButton() => Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: SizedBox(
          width: double.infinity, height: 52,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.play_arrow, color: Colors.white),
            label: const Text('Mulai Belajar Memasak',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
      );
}