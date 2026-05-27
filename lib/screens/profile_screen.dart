import 'package:flutter/material.dart';
import 'package:kuliner_kita/theme/app_theme.dart';
import 'package:kuliner_kita/saved_food_manager.dart';
import 'package:kuliner_kita/screens/setting_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() =>
      _ProfileScreenState();
}

class _ProfileScreenState
    extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final achievements = [
      {
        'icon': '🌶️',
        'label': 'Master Rempah'
      },
      {
        'icon': '🔥',
        'label': '7 Day Streak'
      },
      {
        'icon': '👅',
        'label': 'Lidah Api'
      },
      {
        'icon': '👨‍🍳',
        'label': 'Chef Istana'
      },
    ];

    return Scaffold(
      backgroundColor:
          AppTheme.background,
      body: SafeArea(
        child:
            SingleChildScrollView(
          child: Column(
            children: [
              // HEADER
              Container(
                padding:
                    const EdgeInsets
                        .all(20),
                decoration:
                    const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(
                    bottomLeft:
                        Radius.circular(
                            24),
                    bottomRight:
                        Radius.circular(
                            24),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                      children: [
                        const Text(
                          'KulinerKita',
                          style:
                              TextStyle(
                            fontSize:
                                20,
                            fontWeight:
                                FontWeight
                                    .bold,
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration:
                              BoxDecoration(
                            color: AppTheme
                                .primary,
                            borderRadius:
                                BorderRadius.circular(
                                    10),
                          ),
                          child:
                              const Icon(
                            Icons
                                .restaurant_menu,
                            color: Colors
                                .white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                        height: 20),

                    CircleAvatar(
                      radius: 44,
                      backgroundColor:
                          AppTheme
                              .primaryLight,
                      child:
                          const Text(
                        'RG',
                        style:
                            TextStyle(
                          fontSize: 28,
                          fontWeight:
                              FontWeight
                                  .bold,
                          color: AppTheme
                              .primary,
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 12),

                    const Text(
                      'Ryland Grace',
                      style:
                          TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight
                                .bold,
                      ),
                    ),

                    const SizedBox(
                        height: 4),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .center,
                      children: [
                        const Icon(
                          Icons
                              .restaurant_menu,
                          color: AppTheme
                              .primary,
                          size: 14,
                        ),
                        const SizedBox(
                            width: 4),
                        Text(
                          'Pakar Rendang Level 5',
                          style:
                              TextStyle(
                            color: Colors
                                .grey[600],
                            fontSize:
                                13,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                        height: 20),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceAround,
                      children: [
                        _statItem(
                          'Total Skor',
                          '12,840',
                          Icons
                              .star_rounded,
                        ),
                        _divider(),
                        _statItem(
                          'Kuis Selesai',
                          '42',
                          Icons
                              .quiz_rounded,
                        ),
                        _divider(),
                        _statItem(
                          'Wilayah',
                          '18',
                          Icons
                              .map_rounded,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(
                  height: 20),

              Padding(
                padding:
                    const EdgeInsets
                        .symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children: [
                    // WARISAN TERSIMPAN
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                      children: [
                        const Text(
                          'Warisan Tersimpan',
                          style:
                              TextStyle(
                            fontSize:
                                16,
                            fontWeight:
                                FontWeight
                                    .bold,
                          ),
                        ),
                        TextButton(
                          onPressed:
                              () {},
                          child:
                              const Text(
                            'Lihat Semua',
                            style:
                                TextStyle(
                              color: AppTheme
                                  .primary,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                        height: 12),

                    SizedBox(
                      height: 150,
                      child:
                          SavedFoodManager
                                  .savedFoods
                                  .isEmpty
                              ? Container(
                                  alignment:
                                      Alignment.center,
                                  decoration:
                                      BoxDecoration(
                                    color:
                                        Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(
                                            14),
                                  ),
                                  child:
                                      const Text(
                                    'Belum ada makanan tersimpan ❤️',
                                    style:
                                        TextStyle(
                                      color:
                                          AppTheme.textGrey,
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  scrollDirection:
                                      Axis.horizontal,
                                  itemCount:
                                      SavedFoodManager
                                          .savedFoods
                                          .length,
                                  itemBuilder:
                                      (_, i) {
                                    final food =
                                        SavedFoodManager
                                                .savedFoods[
                                            i];

                                    return Container(
                                      width:
                                          120,
                                      margin:
                                          const EdgeInsets.only(
                                        right:
                                            12,
                                      ),
                                      decoration:
                                          BoxDecoration(
                                        color:
                                            Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(
                                          14,
                                        ),
                                      ),
                                      child:
                                          Column(
                                        children: [
                                          Expanded(
                                            child:
                                                ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.vertical(
                                                top:
                                                    Radius.circular(
                                                  14,
                                                ),
                                              ),
                                              child:
                                                  Image.asset(
                                                food['image'],
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.all(
                                                    8),
                                            child:
                                                Column(
                                              children: [
                                                Text(
                                                  food[
                                                      'name'],
                                                  style:
                                                      const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    fontSize:
                                                        11,
                                                  ),
                                                  textAlign:
                                                      TextAlign.center,
                                                  maxLines:
                                                      1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  food[
                                                      'location'],
                                                  style:
                                                      const TextStyle(
                                                    color:
                                                        AppTheme.textGrey,
                                                    fontSize:
                                                        10,
                                                  ),
                                                  textAlign:
                                                      TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                    ),

                    const SizedBox(
                        height: 24),

                    // ACHIEVEMENTS
                    const Text(
                      'Capaian & Milestones',
                      style:
                          TextStyle(
                        fontSize: 16,
                        fontWeight:
                            FontWeight
                                .bold,
                      ),
                    ),

                    const SizedBox(
                        height: 12),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                      children:
                          achievements
                              .map(
                                (a) =>
                                    _achievementBadge(
                                  a['icon']!,
                                  a['label']!,
                                ),
                              )
                              .toList(),
                    ),

                    const SizedBox(
                        height: 24),

                    _settingTile(
                     Icons.settings_outlined,
                      'Pengaturan Akun',
                          onTap: () {
                            Navigator.push(
                             context,
                                MaterialPageRoute(
                                  builder: (_) =>
                               const SettingsScreen(),
      ),
    );
  },
),

GestureDetector(
  child: Container(
    padding:
        const EdgeInsets.all(16),
    decoration:
        BoxDecoration(
      color: Colors.red[50],
      borderRadius:
          BorderRadius.circular(
              12),
    ),
    child: const Row(
      children: [
        Icon(
          Icons.logout,
          color: Colors.red,
        ),
        SizedBox(width: 12),
        Text(
          'Keluar Aplikasi',
          style: TextStyle(
            color: Colors.red,
            fontWeight:
                FontWeight.w600,
          ),
        ),
      ],
    ),
  ),
), 

                    const SizedBox(
                        height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statItem(
    String label,
    String value,
    IconData icon,
  ) =>
      Column(
        children: [
          Icon(icon,
              color:
                  AppTheme.primary,
              size: 20),
          const SizedBox(
              height: 4),
          Text(
            value,
            style:
                const TextStyle(
              fontWeight:
                  FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            label,
            style:
                const TextStyle(
              color: AppTheme
                  .textGrey,
              fontSize: 11,
            ),
          ),
        ],
      );

  Widget _divider() =>
      Container(
        height: 40,
        width: 1,
        color:
            const Color(0xFFE0E0E0),
      );

  Widget _achievementBadge(
    String emoji,
    String label,
  ) =>
      Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration:
                BoxDecoration(
              color: AppTheme
                  .primaryLight,
              borderRadius:
                  BorderRadius.circular(
                      14),
            ),
            child: Center(
              child: Text(
                emoji,
                style:
                    const TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
          ),
          const SizedBox(
              height: 6),
          Text(
            label,
            style:
                const TextStyle(
              fontSize: 11,
            ),
            textAlign:
                TextAlign.center,
          ),
        ],
      );

  Widget _settingTile(
  IconData icon,
  String label, {
  VoidCallback? onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.all(16),
        decoration:
            BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(
                  12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color:
                  AppTheme.textDark,
            ),
            const SizedBox(
                width: 12),
            Text(
              label,
              style:
                  const TextStyle(
                fontWeight:
                    FontWeight.w500,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color:
                  AppTheme.textGrey,
            ),
          ],
        ),
      ),
    );
    }