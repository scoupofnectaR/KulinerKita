import 'package:flutter/material.dart';
import 'package:kuliner_kita/theme/app_theme.dart';
import 'package:kuliner_kita/screens/register_screen.dart';
import 'package:kuliner_kita/widgets/bottom_nav_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top orange section
              Container(
                width: double.infinity,
                color: AppTheme.primary,
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                child: Column(
                  children: [
                    Container(
                      width: 64, height: 64,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(Icons.restaurant_menu,
                          color: AppTheme.primary, size: 36),
                    ),
                    const SizedBox(height: 16),
                    const Text('KulinerKita',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text('Masuk ke Meja Makan Digital Anda',
                        style: TextStyle(color: Colors.white70, fontSize: 14)),
                  ],
                ),
              ),

              // Form section
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _label('Alamat Email'),
                    _textField(hint: 'nama@email.com', icon: Icons.email_outlined),
                    const SizedBox(height: 16),
                    _label('Kata Sandi'),
                    _passwordField(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Lupa kata sandi?',
                            style: TextStyle(color: AppTheme.primary)),
                      ),
                    ),
                    const SizedBox(height: 8),
                    _primaryButton('Masuk', () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => const MainScaffold()));
                    }),
                    const SizedBox(height: 16),
                    _orDivider(),
                    const SizedBox(height: 16),
                    _googleButton('Google'),
                    const SizedBox(height: 24),
                    Center(
                      child: GestureDetector(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const RegisterScreen())),
                        child: RichText(
                          text: const TextSpan(
                            text: 'Belum punya akun? ',
                            style: TextStyle(color: AppTheme.textGrey),
                            children: [
                              TextSpan(
                                text: 'Daftar sekarang',
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
                    // Bottom promo card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryLight,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.menu_book_rounded,
                              color: AppTheme.primary, size: 32),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Belajar Masak Autentik\nAkses 1000+ resep warisan Nusantara yang teruji.',
                              style: TextStyle(fontSize: 12, color: AppTheme.textDark),
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

  Widget _label(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(text,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
      );

  Widget _textField({required String hint, required IconData icon}) =>
      TextField(
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: AppTheme.textGrey),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0))),
        ),
      );

  Widget _passwordField() => TextField(
        obscureText: _obscure,
        decoration: InputDecoration(
          hintText: '••••••••',
          prefixIcon: const Icon(Icons.lock_outline, color: AppTheme.textGrey),
          suffixIcon: IconButton(
            icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility,
                color: AppTheme.textGrey),
            onPressed: () => setState(() => _obscure = !_obscure),
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0))),
        ),
      );

  Widget _primaryButton(String label, VoidCallback onTap) => SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Text(label,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ),
      );

  Widget _orDivider() => Row(children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text('atau masuk dengan',
              style: TextStyle(color: Colors.grey[500], fontSize: 13)),
        ),
        const Expanded(child: Divider()),
      ]);

  Widget _googleButton(String label) => SizedBox(
        width: double.infinity,
        height: 52,
        child: OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.g_mobiledata, color: Colors.red, size: 28),
          label: Text(label,
              style: const TextStyle(
                  color: AppTheme.textDark, fontWeight: FontWeight.w500)),
          style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            side: const BorderSide(color: Color(0xFFE0E0E0)),
          ),
        ),
      );
}