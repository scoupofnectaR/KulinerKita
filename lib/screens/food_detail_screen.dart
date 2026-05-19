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
  final Map<String, dynamic> foodData = {
  'Rendang Padang': {
    'region': 'TRADISI MINANG',
    'origin': 'Sumatera Barat',
    'duration': '4-5 Jam',
    'difficulty': 'Sedang',
    'portion': '6 Porsi',

    'about':
        'Rendang merupakan makanan khas Minangkabau yang dimasak perlahan menggunakan santan dan rempah hingga bumbu meresap sempurna. Proses memasaknya melambangkan kesabaran dan ketekunan.',

    'ingredients': [
      ['🥩', 'Daging Sapi'],
      ['🥥', 'Santan'],
      ['🌿', 'Serai'],
      ['🫙', 'Bumbu Halus'],
    ],

    'philosophy':
        'Rendang memiliki filosofi penting dalam budaya Minang: daging sebagai pemimpin, kelapa sebagai kaum intelektual, cabai sebagai ulama, dan bumbu sebagai masyarakat.',

    'quizQuestion':
        'Apa nama proses memasak rendang sebelum santannya benar-benar kering?',

    'quizOptions': [
      'A. Gulai',
      'B. Kalio',
      'C. Opor',
    ],

    'correctAnswer': 1,
  },

  'Gudeg Komplit': {
    'region': 'WARISAN JAWA',
    'origin': 'Yogyakarta',
    'duration': '3-4 Jam',
    'difficulty': 'Mudah',
    'portion': '5 Porsi',

    'about':
        'Gudeg adalah makanan khas Yogyakarta berbahan dasar nangka muda yang dimasak lama bersama santan dan gula aren hingga menghasilkan rasa manis khas.',

    'ingredients': [
      ['🥬', 'Nangka Muda'],
      ['🥚', 'Telur'],
      ['🥥', 'Santan'],
      ['🍃', 'Daun Salam'],
    ],

    'philosophy':
        'Gudeg mencerminkan kesabaran masyarakat Jawa karena proses memasaknya memerlukan waktu panjang dan ketelatenan.',

    'quizQuestion':
        'Gudeg identik dengan cita rasa apa?',

    'quizOptions': [
      'A. Pedas',
      'B. Asam',
      'C. Manis',
    ],

    'correctAnswer': 2,
  },

  'Pempek Kapal Selam': {
    'region': 'KHAS PALEMBANG',
    'origin': 'Palembang',
    'duration': '1 Jam',
    'difficulty': 'Sedang',
    'portion': '4 Porsi',

    'about':
        'Pempek merupakan makanan khas Palembang berbahan ikan tenggiri dan tepung sagu yang disajikan bersama kuah cuko khas.',

    'ingredients': [
      ['🐟', 'Ikan Tenggiri'],
      ['🥚', 'Telur'],
      ['🌶️', 'Cuko'],
      ['🌾', 'Tepung Sagu'],
    ],

    'philosophy':
        'Pempek melambangkan kreativitas masyarakat Palembang dalam mengolah hasil sungai menjadi makanan khas.',

    'quizQuestion':
        'Apa nama kuah khas pempek?',

    'quizOptions': [
      'A. Kaldu',
      'B. Cuko',
      'C. Santan',
    ],

    'correctAnswer': 1,
  },
  'Mie Aceh Udang': {
  'region': 'KHAS ACEH',
  'origin': 'Aceh',
  'duration': '45 Menit',
  'difficulty': 'Sedang',
  'portion': '3 Porsi',

  'about':
      'Mie Aceh merupakan hidangan khas Aceh dengan cita rasa rempah yang kuat dan kuah kaya bumbu. Biasanya disajikan dengan seafood atau daging.',

  'ingredients': [
    ['🍜', 'Mie Kuning'],
    ['🦐', 'Udang'],
    ['🌶️', 'Cabai'],
    ['🧄', 'Rempah Aceh'],
  ],

  'philosophy':
      'Mie Aceh mencerminkan kekayaan budaya Aceh yang dipengaruhi perdagangan Timur Tengah dan India.',

  'quizQuestion':
      'Apa ciri khas utama rasa Mie Aceh?',

  'quizOptions': [
    'A. Manis',
    'B. Gurih Rempah',
    'C. Asam',
  ],

  'correctAnswer': 1,
},

'Ikan Mas Arsik': {
  'region': 'WARISAN BATAK',
  'origin': 'Sumatera Utara',
  'duration': '1.5 Jam',
  'difficulty': 'Sedang',
  'portion': '5 Porsi',

  'about':
      'Ikan Mas Arsik adalah makanan khas Batak yang dimasak dengan bumbu kuning dan andaliman khas Sumatera Utara.',

  'ingredients': [
    ['🐟', 'Ikan Mas'],
    ['🌿', 'Andaliman'],
    ['🧄', 'Bawang'],
    ['🌶️', 'Cabai'],
  ],

  'philosophy':
      'Dalam budaya Batak, Arsik sering hadir di acara adat sebagai simbol doa dan kebersamaan keluarga.',

  'quizQuestion':
      'Bumbu khas apa yang membuat Arsik unik?',

  'quizOptions': [
    'A. Andaliman',
    'B. Kunyit',
    'C. Santan',
  ],

  'correctAnswer': 0,
},

'Nasi Goreng': {
  'region': 'IKON NUSANTARA',
  'origin': 'Indonesia',
  'duration': '20 Menit',
  'difficulty': 'Mudah',
  'portion': '2 Porsi',

  'about':
      'Nasi Goreng adalah salah satu makanan paling populer di Indonesia, dibuat dari nasi yang digoreng bersama kecap dan berbagai topping.',

  'ingredients': [
    ['🍚', 'Nasi'],
    ['🥚', 'Telur'],
    ['🧄', 'Bawang'],
    ['🥄', 'Kecap'],
  ],

  'philosophy':
      'Nasi Goreng menggambarkan kreativitas masyarakat Indonesia dalam memanfaatkan nasi sisa menjadi makanan lezat.',

  'quizQuestion':
      'Bumbu yang paling identik dengan nasi goreng Indonesia adalah?',

  'quizOptions': [
    'A. Kecap Manis',
    'B. Santan',
    'C. Cuka',
  ],

  'correctAnswer': 0,
},

'Nasi Minyak': {
  'region': 'MELAYU JAMBI',
  'origin': 'Jambi',
  'duration': '1 Jam',
  'difficulty': 'Sedang',
  'portion': '5 Porsi',

  'about':
      'Nasi Minyak merupakan makanan khas Melayu yang kaya rempah dan biasanya disajikan saat acara besar.',

  'ingredients': [
    ['🍚', 'Beras'],
    ['🧈', 'Mentega'],
    ['🌿', 'Rempah'],
    ['🥩', 'Daging'],
  ],

  'philosophy':
      'Nasi Minyak melambangkan kehormatan dalam budaya Melayu karena sering disajikan kepada tamu penting.',

  'quizQuestion':
      'Nasi Minyak banyak dipengaruhi budaya?',

  'quizOptions': [
    'A. Jepang',
    'B. Timur Tengah',
    'C. Korea',
  ],

  'correctAnswer': 1,
},

'Sambal Ulek': {
  'region': 'TRADISI JAWA',
  'origin': 'Jawa Tengah',
  'duration': '15 Menit',
  'difficulty': 'Mudah',
  'portion': '1 Mangkuk',

  'about':
      'Sambal Ulek dibuat dengan cara tradisional menggunakan cobek dan ulekan untuk menghasilkan tekstur dan rasa khas.',

  'ingredients': [
    ['🌶️', 'Cabai'],
    ['🧄', 'Bawang'],
    ['🧂', 'Garam'],
    ['🍅', 'Tomat'],
  ],

  'philosophy':
      'Teknik ulekan dipercaya menjaga cita rasa asli bahan dibanding blender modern.',

  'quizQuestion':
      'Alat tradisional membuat sambal ulek adalah?',

  'quizOptions': [
    'A. Blender',
    'B. Cobek & Ulekan',
    'C. Panci',
  ],

  'correctAnswer': 1,
},

'Sate Ayam Madura': {
  'region': 'KHAS MADURA',
  'origin': 'Madura',
  'duration': '40 Menit',
  'difficulty': 'Sedang',
  'portion': '4 Porsi',

  'about':
      'Sate Ayam Madura terkenal dengan bumbu kacang khas dan aroma bakaran arang yang menggugah selera.',

  'ingredients': [
    ['🍗', 'Ayam'],
    ['🥜', 'Bumbu Kacang'],
    ['🔥', 'Arang'],
    ['🧅', 'Bawang'],
  ],

  'philosophy':
      'Sate Madura menjadi simbol kuliner jalanan Indonesia yang terkenal hingga mancanegara.',

  'quizQuestion':
      'Sate Madura identik dengan saus apa?',

  'quizOptions': [
    'A. Saus Kacang',
    'B. Saus Keju',
    'C. Saus Tomat',
  ],

  'correctAnswer': 0,
},

'Sate Padang': {
  'region': 'KHAS PADANG',
  'origin': 'Sumatera Barat',
  'duration': '1 Jam',
  'difficulty': 'Sulit',
  'portion': '5 Porsi',

  'about':
      'Sate Padang memiliki kuah kental khas berbumbu rempah yang berbeda dari sate daerah lain.',

  'ingredients': [
    ['🥩', 'Daging Sapi'],
    ['🌶️', 'Rempah Padang'],
    ['🥣', 'Kuah Kental'],
    ['🔥', 'Arang'],
  ],

  'philosophy':
      'Sate Padang mencerminkan kekayaan rempah Minangkabau yang khas dan kuat.',

  'quizQuestion':
      'Apa ciri khas utama Sate Padang?',

  'quizOptions': [
    'A. Kuah Kental',
    'B. Santan',
    'C. Keju',
  ],

  'correctAnswer': 0,
},
};
  int _tabIndex = 0;
  int _selectedQuiz = -1;
bool _quizAnswered = false;


  final tabs = ['Tentang', 'Bahan Utama', 'Filosofi Budaya'];
Map<String, dynamic> get currentFood {
  return foodData[widget.name] ??
      foodData['Rendang Padang']!;
}

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
    widget.imageUrl,
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
              child: Text(
                currentFood['region'] ?? '',
                style: const TextStyle(
                  color: Colors.white,fontSize: 11,
                  fontWeight: FontWeight.bold,
                  ),
                  ),
            ),
            const SizedBox(height: 10),
            Text(widget.name,
                style: const TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
             Row(
              children: [
                Icon(Icons.location_on, color: AppTheme.primary, size: 16),
                SizedBox(width: 4),
                Text(
                  currentFood['origin'] ?? 'Sumatera Barat',
                  style: TextStyle(
                    color: AppTheme.primary,
                    fontSize: 13,
  ),
),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _infoChip(
                  Icons.access_time,
                  currentFood['duration'],
                  ),
                const SizedBox(width: 8),
                _infoChip(
                  Icons.local_fire_department,
                  currentFood['difficulty'],
                  ),
                _infoChip(
                  Icons.people,
                  currentFood['portion'],
                  ),
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
          currentFood['about'],
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
         children: currentFood['ingredients']
         .map<Widget>((item) =>
        _bahanItem(item[0], item[1]))
        .toList(),
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
          child: Text(
            currentFood['philosophy'],
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
            Text(
                currentFood['quizQuestion'],
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 14)),
            SizedBox(height: 12),
            ...List.generate(
              currentFood['quizOptions'].length,
              (index) => _quizOption(
                currentFood['quizOptions'][index],
                index,
                )
                ),
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
    if (index ==
    currentFood['correctAnswer']) {
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