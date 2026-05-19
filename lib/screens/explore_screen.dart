import 'package:flutter/material.dart';
import 'package:kuliner_kita/theme/app_theme.dart';
import 'package:kuliner_kita/screens/food_detail_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String searchQuery = '';

  final List<Map<String, String>> foods = const [
    {
      'name': 'Rendang Padang',
      'origin': 'Sumatera Barat',
      'img': 'assets/images/rendang.jpg',
    },
    {
      'name': 'Pempek Kapal Selam',
      'origin': 'Palembang',
      'img': 'assets/images/pempek.jpg',
    },
    {
      'name': 'Mie Aceh Udang',
      'origin': 'Aceh',
      'img': 'assets/images/mieaceh.jpg',
    },
    {
      'name': 'Sate Padang',
      'origin': 'Padang',
      'img': 'assets/images/satepadang.jpg',
    },
    {
      'name': 'Ikan Mas Arsik',
      'origin': 'Sumatera Utara',
      'img': 'assets/images/arsikikanmas.jpg',
    },
    {
      'name': 'Nasi Minyak',
      'origin': 'Jambi',
      'img': 'assets/images/nasiminyak.jpg',
    },
    {
      'name': 'Nasi Goreng',
      'origin': 'Indonesia',
      'img': 'assets/images/nasigoreng.jpg',
    },
    {
      'name': 'Sambal Ulek',
      'origin': 'Jawa Tengah',
      'img': 'assets/images/sambalulek.jpg',
    },
  ];

  List<Map<String, String>> get filteredFoods {
    if (searchQuery.isEmpty) {
      return foods;
    }

    return foods.where((food) {
      return food['name']!
          .toLowerCase()
          .contains(searchQuery.toLowerCase());
    }).toList();
  }

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
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'KulinerKita',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppTheme.primary,
                          borderRadius:
                              BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.restaurant_menu,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // SEARCH BAR
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(30),
                      border: Border.all(
                        color: const Color(0xFFE0E0E0),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.search,
                          color: AppTheme.textGrey,
                        ),
                        const SizedBox(width: 10),

                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                searchQuery = value;
                              });
                            },
                            decoration:
                                const InputDecoration(
                              hintText:
                                  'Cari rasa Nusantara...',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color:
                                    AppTheme.textGrey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // TAG TERPOPULER
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  borderRadius:
                      BorderRadius.circular(8),
                ),
                child: const Text(
                  'TERPOPULER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: GridView.builder(
                padding:
                    const EdgeInsets.symmetric(
                        horizontal: 20),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.85,
                ),
                itemCount: filteredFoods.length,
                itemBuilder: (context, i) =>
                    GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          FoodDetailScreen(
                        name:
                            filteredFoods[i]['name']!,
                        imageUrl:
                            filteredFoods[i]['img']!,
                      ),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.05),
                          blurRadius: 8,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius
                                    .vertical(
                              top: Radius.circular(16),
                            ),
                            child: Image.asset(
                              filteredFoods[i]['img']!,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                            children: [
                              Text(
                                filteredFoods[i]
                                    ['name']!,
                                style:
                                    const TextStyle(
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                  fontSize: 13,
                                ),
                                maxLines: 1,
                                overflow:
                                    TextOverflow
                                        .ellipsis,
                              ),

                              const SizedBox(
                                  height: 2),

                              Row(
                                children: [
                                  const Icon(
                                    Icons
                                        .location_on,
                                    color: AppTheme
                                        .primary,
                                    size: 12,
                                  ),
                                  const SizedBox(
                                      width: 2),
                                  Text(
                                    filteredFoods[i]
                                        ['origin']!,
                                    style:
                                        const TextStyle(
                                      color:
                                          AppTheme
                                              .textGrey,
                                      fontSize:
                                          11,
                                    ),
                                  ),
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