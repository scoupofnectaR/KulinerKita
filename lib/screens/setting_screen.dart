import 'package:flutter/material.dart';
import 'package:kuliner_kita/theme/app_theme.dart';
import 'package:kuliner_kita/saved_food_manager.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() =>
      _SettingsScreenState();
}

class _SettingsScreenState
    extends State<SettingsScreen> {
  bool darkMode = false;
  bool notification = true;

  String profileName = 'Ryland Grace';

  void _editName() {
    TextEditingController controller =
        TextEditingController(
      text: profileName,
    );

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20),
        ),
        title: const Text(
          'Edit Nama Profil',
        ),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Masukkan nama',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(
              backgroundColor:
                  AppTheme.primary,
            ),
            onPressed: () {
              setState(() {
                profileName =
                    controller.text;
              });

              Navigator.pop(context);

              ScaffoldMessenger.of(
                      context)
                  .showSnackBar(
                const SnackBar(
                  content: Text(
                    'Nama berhasil diubah ✨',
                  ),
                ),
              );
            },
            child: const Text(
              'Simpan',
            ),
          ),
        ],
      ),
    );
  }

  void _showAbout() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20),
        ),
        title: const Text(
          'Tentang Aplikasi',
        ),
        content: const Text(
          'KulinerKita adalah aplikasi edukasi kuliner Nusantara yang membantu pengguna mengenal makanan khas Indonesia melalui quiz, challenge, dan eksplorasi budaya makanan.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  void _resetFavorites() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20),
        ),
        title: const Text(
          'Reset Warisan?',
        ),
        content: const Text(
          'Semua makanan favorit akan dihapus.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Batal',
            ),
          ),
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(
              backgroundColor:
                  Colors.red,
            ),
            onPressed: () {
              SavedFoodManager
                  .savedFoods
                  .clear();

              Navigator.pop(context);

              ScaffoldMessenger.of(
                      context)
                  .showSnackBar(
                const SnackBar(
                  content: Text(
                    'Warisan berhasil direset 🗑️',
                  ),
                ),
              );
            },
            child: const Text(
              'Reset',
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 6,
        bottom: 12,
        top: 20,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight:
              FontWeight.bold,
        ),
      ),
    );
  }

  Widget settingTile({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
    Color? iconColor,
  }) {
    return Container(
      margin:
          const EdgeInsets.only(
        bottom: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(
                18),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color:
                AppTheme.primaryLight,
            borderRadius:
                BorderRadius
                    .circular(12),
          ),
          child: Icon(
            icon,
            color: iconColor ??
                AppTheme.primary,
          ),
        ),
        title: Text(title),
        subtitle: subtitle != null
            ? Text(subtitle)
            : null,
        trailing: trailing ??
            const Icon(
              Icons
                  .keyboard_arrow_right,
            ),
      ),
    );
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: AppTheme.background,
    appBar: AppBar(
      elevation: 0,
      backgroundColor: AppTheme.background,
      title: const Text(
        'Pengaturan Akun',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            // AKUN
            sectionTitle('Akun'),

            settingTile(
              icon: Icons.person,
              title: 'Edit Nama Profil',
              subtitle: profileName,
              onTap: _editName,
            ),

            // PREFERENSI
            sectionTitle('Preferensi'),

            settingTile(
              icon: Icons.notifications,
              title: 'Notifikasi Harian',
              trailing: Switch(
                value: notification,
                activeColor:
                    AppTheme.primary,
                onChanged: (v) {
                  setState(() {
                    notification = v;
                  });
                },
              ),
            ),

            // TENTANG
            sectionTitle('Tentang'),

            settingTile(
              icon: Icons.info,
              title:
                  'Tentang Aplikasi',
              onTap: _showAbout,
            ),

            settingTile(
              icon:
                  Icons.system_update,
              title:
                  'Versi Aplikasi',
              subtitle: 'v1.0',
            ),
          ],
        ),
      ),
    ),
  );
}
    }