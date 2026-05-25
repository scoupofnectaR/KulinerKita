import 'package:flutter/material.dart';
import 'package:kuliner_kita/theme/app_theme.dart';

class FilosofiScreen extends StatelessWidget {
  const FilosofiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final filosofiFoods = [
      {
        'title': 'Rendang',
        'desc':
            'Rendang melambangkan kesabaran, kebijaksanaan, dan musyawarah. Proses memasaknya yang lama mencerminkan ketekunan dalam mencapai hasil terbaik.',
        'image': 'assets/images/rendang.jpg',
      },
      {
        'title': 'Gudeg',
        'desc':
            'Gudeg identik dengan filosofi kesabaran dan kelembutan masyarakat Jawa. Rasanya yang manis menggambarkan sikap ramah dan tenang.',
        'image': 'assets/images/gudeg.jpg',
      },
      {
        'title': 'Pempek',
        'desc':
            'Pempek mencerminkan akulturasi budaya Palembang dengan pengaruh Tionghoa. Menjadi simbol keberagaman yang menyatu.',
        'image': 'assets/images/pempek.jpg',
      },
      {
        'title': 'Sate',
        'desc':
            'Tusukan sate melambangkan kebersamaan. Banyak potongan daging disatukan menjadi satu hidangan yang lezat.',
        'image': 'assets/images/sateayam.jpg',
      },
      {
        'title': 'Nasi Uduk',
        'desc':
            'Nasi Uduk melambangkan rasa syukur dan kebersamaan. Biasanya hadir dalam acara keluarga atau perayaan.',
        'image': 'assets/images/nasiuduk.jpg',
      },
    ];

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: AppTheme.background,
        elevation: 0,
        title: const Text(
          'Filosofi Makanan',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: filosofiFoods.length,
        itemBuilder: (context, index) {
          final food = filosofiFoods[index];

          return Container(
            margin:
                const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withOpacity(0.05),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  child: Image.asset(
                    food['image']!,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                    children: [
                      Text(
                        food['title']!,
                        style:
                            const TextStyle(
                          fontSize: 20,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                          height: 8),
                      Text(
                        food['desc']!,
                        style:
                            const TextStyle(
                          color: AppTheme
                              .textGrey,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}