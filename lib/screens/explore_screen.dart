import 'package:flutter/material.dart';
import 'package:kuliner_kita/theme/app_theme.dart';
import 'package:kuliner_kita/screens/food_detail_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _selectedRegion = 0;
  final regions = [
    'Sumatera', 'Jawa', 'Kalimantan',
    'Sulawesi', 'Papua', 'Bali', 'Nusa Tenggara'
  ];

 final List<Map<String, String>> foods = const [
  {
    'name': 'Rendang Padang',
    'origin': 'Sumatera Barat',
    'img': 'https://www.themealdb.com/images/media/meals/bc3z651695747515.jpg',
  },
  {
    'name': 'Pempek Kapal Selam',
    'origin': 'Palembang',
    'img': 'https://www.themealdb.com/images/media/meals/ryppsv1511815505.jpg',
  },
  {
    'name': 'Mie Aceh Udang',
    'origin': 'Aceh',
    'img': 'https://www.themealdb.com/images/media/meals/g046bb1663960946.jpg',
  },
  {
    'name': 'Sate Padang',
    'origin': 'Padang',
    'img': 'https://www.themealdb.com/images/media/meals/sytuqu1511882485.jpg',
  },
  {
    'name': 'Ikan Mas Arsik',
    'origin': 'Sumatera Utara',
    'img': 'https://www.themealdb.com/images/media/meals/wruvqv1511880994.jpg',
  },
  {
    'name': 'Nasi Minyak',
    'origin': 'Jambi',
    'img': 'https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg',
  },
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('KulinerKita',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
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
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: const Color(0xFFE0E0E0)),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search, color: AppTheme.textGrey),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Cari rasa Nusantara...',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: AppTheme.textGrey, fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('Pilih Wilayah',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14)),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 36,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: regions.length,
                      itemBuilder: (_, i) => GestureDetector(
                        onTap: () =>
                            setState(() => _selectedRegion = i),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: _selectedRegion == i
                                ? AppTheme.primary
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: _selectedRegion == i
                                    ? AppTheme.primary
                                    : const Color(0xFFE0E0E0)),
                          ),
                          child: Center(
                            child: Text(regions[i],
                                style: TextStyle(
                                    color: _selectedRegion == i
                                        ? Colors.white
                                        : AppTheme.textDark,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                    color: AppTheme.primary,
                    borderRadius: BorderRadius.circular(8)),
                child: const Text('TERPOPULER',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.85,
                ),
                itemCount: foods.length,
                itemBuilder: (context, i) => GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => FoodDetailScreen(
                                name: foods[i]['name']!,
                                imageUrl: foods[i]['img']!,
                              ))),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8)
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16)),
                            child: Image.network(
                              foods[i]['img']!,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                color: Colors.orange[100],
                                child: const Center(
                                  child: Icon(Icons.restaurant,
                                      color: AppTheme.primary, size: 48),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(foods[i]['name']!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  const Icon(Icons.location_on,
                                      color: AppTheme.primary, size: 12),
                                  const SizedBox(width: 2),
                                  Text(foods[i]['origin']!,
                                      style: const TextStyle(
                                          color: AppTheme.textGrey,
                                          fontSize: 11)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}