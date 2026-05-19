import 'package:flutter/material.dart';
import 'package:kuliner_kita/theme/app_theme.dart';
import 'package:kuliner_kita/widgets/bottom_nav_bar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscure1 = true, _obscure2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top section
              Container(
                width: double.infinity,
                color: AppTheme.primary,
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                child: Column(
                  children: [
                    Container(
                      width: 56, height: 56,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14)),
                      child: const Icon(Icons.restaurant_menu,
                          color: AppTheme.primary, size: 30),
                    ),
                    const SizedBox(height: 12),
                    const Text('KulinerKita',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Daftar Akun Baru',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 24),
                    _label('Nama Lengkap'),
                    _textField(hint: 'Budi Santoso', icon: Icons.person_outline),
                    const SizedBox(height: 16),
                    _label('Email'),
                    _textField(hint: 'contoh@email.com', icon: Icons.email_outlined),
                    const SizedBox(height: 16),
                    _label('Password'),
                    _passField(isFirst: true),
                    const SizedBox(height: 16),
                    _label('Konfirmasi Password'),
                    _passField(isFirst: false),
                    const SizedBox(height: 24),
                    _primaryButton('Daftar Sekarang →', () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => const MainScaffold()));
                    }),
                    const SizedBox(height: 16),
                    _orDivider(),
                    const SizedBox(height: 16),
                    _googleButton(),
                    const SizedBox(height: 24),
                    Center(
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: RichText(
                          text: const TextSpan(
                            text: 'Sudah punya akun? ',
                            style: TextStyle(color: AppTheme.textGrey),
                            children: [
                              TextSpan(
                                text: 'Masuk di sini',
                                style: TextStyle(
                                    color: AppTheme.primary,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryLight,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.auto_stories, color: AppTheme.primary, size: 32),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Belajar Masak Autentik\nAkses 1000+ resep warisan Nusantara yang teruji.',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _label(String t) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(t, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
      );

  Widget _textField({required String hint, required IconData icon}) =>
      TextField(
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: AppTheme.textGrey),
          filled: true, fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0))),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0))),
        ),
      );

  Widget _passField({required bool isFirst}) => TextField(
        obscureText: isFirst ? _obscure1 : _obscure2,
        decoration: InputDecoration(
          hintText: '••••••••',
          prefixIcon: const Icon(Icons.lock_outline, color: AppTheme.textGrey),
          suffixIcon: IconButton(
            icon: Icon(
                (isFirst ? _obscure1 : _obscure2)
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: AppTheme.textGrey),
            onPressed: () => setState(() =>
                isFirst ? _obscure1 = !_obscure1 : _obscure2 = !_obscure2),
          ),
          filled: true, fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0))),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0))),
        ),
      );

  Widget _primaryButton(String label, VoidCallback onTap) => SizedBox(
        width: double.infinity, height: 52,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          child: Text(label,
              style: const TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      );

  Widget _orDivider() => Row(children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text('atau daftar dengan',
              style: TextStyle(color: Colors.grey[500], fontSize: 13)),
        ),
        const Expanded(child: Divider()),
      ]);

  Widget _googleButton() => SizedBox(
        width: double.infinity, height: 52,
        child: OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.g_mobiledata, color: Colors.red, size: 28),
          label: const Text('Lanjutkan dengan Google',
              style: TextStyle(color: AppTheme.textDark, fontWeight: FontWeight.w500)),
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              side: const BorderSide(color: Color(0xFFE0E0E0))),
        ),
      );
}