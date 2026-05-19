import 'package:flutter/material.dart';
import 'package:kuliner_kita/theme/app_theme.dart';
import 'package:kuliner_kita/screens/food_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, String>> _recommendations = const [
  {
    'name': 'Rendang Daging',
    'time': '4 Jam',
    'rating': '4.9',
    'reviews': '2.1k',
    'tag': 'Pedas',
    'img': 'https://www.themealdb.com/images/media/meals/bc3z651695747515.jpg',
  },
  {
    'name': 'Gudeg Komplit',
    'time': '3 Jam',
    'rating': '4.8',
    'reviews': '1.5k',
    'tag': 'Manis',
    'img': 'https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg',
  },
  {
    'name': 'Sate Ayam Madura',
    'time': '45 Menit',
    'rating': '4.7',
    'reviews': '34k',
    'tag': 'Pedas',
    'img': 'https://www.themealdb.com/images/media/meals/sytuqu1511882485.jpg',
  },
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildHeader(),
              const SizedBox(height: 20),
              _buildSearchBar(),
              const SizedBox(height: 24),
              _buildFeatureCards(context),
              const SizedBox(height: 24),
              _buildRekomendasi(context),
              const SizedBox(height: 24),
              _buildWarisanKuliner(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textDark),
              children: [
                TextSpan(text: 'Halo, Penjelajah\n'),
                TextSpan(
                    text: 'Rasa!',
                    style: TextStyle(color: AppTheme.primary)),
              ],
            ),
          ),
          Container(
            width: 44, height: 44,
            decoration: BoxDecoration(
                color: AppTheme.primary,
                borderRadius: BorderRadius.circular(12)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Rendang_daging.jpg/100px-Rendang_daging.jpg',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.restaurant_menu, color: Colors.white),
              ),
            ),
          ),
        ],
      );

  Widget _buildSearchBar() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppTheme.primary.withOpacity(0.4)),
        ),
        child: const Row(
          children: [
            Icon(Icons.search, color: AppTheme.primary),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari resep tradisional...',
                  border: InputBorder.none,
                  hintStyle:
                      TextStyle(color: AppTheme.textGrey, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildFeatureCards(BuildContext context) => Row(
        children: [
          _featureCard(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Peta_Indonesia.svg/320px-Peta_Indonesia.svg.png',
            Icons.explore_rounded,
            'Explore',
            'Jelajahi peta kuliner nusantara',
          ),
          const SizedBox(width: 12),
          _featureCard(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/forty/Gudeg.jpg/100px-Gudeg.jpg',
            Icons.quiz_rounded,
            'Quiz',
            'Uji ilmu masakmu',
          ),
          const SizedBox(width: 12),
          _featureCard(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/sixty/Sate_ayam_Madura.jpg/100px-Sate_ayam_Madura.jpg',
            Icons.casino_rounded,
            'Wheel',
            'Bingung pilih menu?',
          ),
        ],
      );

  Widget _featureCard(
          String imgUrl, IconData fallback, String title, String subtitle) =>
      Expanded(
        child: Container(
          padding: const EdgeInsets.all(14),
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
                width: 36, height: 36,
                decoration: BoxDecoration(
                  color: AppTheme.primaryLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(fallback, color: AppTheme.primary, size: 20),
              ),
              const SizedBox(height: 8),
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 13)),
              const SizedBox(height: 4),
              Text(subtitle,
                  style: const TextStyle(
                      color: AppTheme.textGrey, fontSize: 10),
                  maxLines: 2),
            ],
          ),
        ),
      );

  Widget _buildRekomendasi(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('Rekomendasi Hari Ini',
                style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextButton(
                onPressed: () {},
                child: const Text('Lihat Semua',
                    style:
                        TextStyle(color: AppTheme.primary, fontSize: 13))),
          ]),
          const SizedBox(height: 12),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _recommendations.length,
              itemBuilder: (context, i) {
                final item = _recommendations[i];
                return _foodCard(context, item);
              },
            ),
          ),
        ],
      );

  Widget _foodCard(BuildContext context, Map<String, String> item) =>
      GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => FoodDetailScreen(
                      name: item['name']!,
                      imageUrl: item['img']!,
                    ))),
        child: Container(
          width: 150,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[200],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  item['img']!,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.orange[200],
                    child: const Icon(Icons.restaurant,
                        color: Colors.white, size: 48),
                  ),
                ),
                // gradient overlay
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 8, left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                        color: Colors.red[700],
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(item['tag']!,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 10)),
                  ),
                ),
                Positioned(
                  bottom: 0, left: 0, right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['name']!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13)),
                        const SizedBox(height: 4),
                        Text(
                            '${item['time']} • ⭐ ${item['rating']} (${item['reviews']})',
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 11)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildWarisanKuliner() => Container(
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
              const Text('Warisan Kuliner',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 12),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://www.themealdb.com/images/media/meals/g046bb1663960946.jpg',
                      width: 80, height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 80, height: 80,
                        color: AppTheme.primaryLight,
                        child: const Icon(Icons.soup_kitchen,
                            color: AppTheme.primary, size: 40),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Teknik Ulekan Sempurna',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                        SizedBox(height: 6),
                        Text(
                            'Pelajari rahasia sambal autentik dengan teknik ulekan tradisional dari Master Sambal Jawa Tengah.',
                            style: TextStyle(
                                color: AppTheme.textGrey, fontSize: 12),
                            maxLines: 3),
                        SizedBox(height: 8),
                        Text('Mulai Belajar →',
                            style: TextStyle(
                                color: AppTheme.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
      );
}