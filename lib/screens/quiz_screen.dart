import 'package:flutter/material.dart';
import 'package:kuliner_kita/theme/app_theme.dart';
import 'package:kuliner_kita/screens/quiz_question_screen.dart';
import 'package:kuliner_kita/screens/tebak_gambar_screen.dart';
import 'package:kuliner_kita/screens/filosofi_screen.dart';
import 'package:kuliner_kita/score_manager.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() =>
      _QuizScreenState();
}

class _QuizScreenState
    extends State<QuizScreen> {

  @override
  Widget build(BuildContext context) {
    final challenges = [
  {
    'title': 'Tebak Gambar',
    'desc': 'Kenali hidangan dari bentuknya.',
    'badge': null,
  },
  {
    'title': 'Filosofi Makanan',
    'desc': 'Cerita dibalik resep kuno.',
    'badge': 'LVL 5',
  },
];

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'KulinerKita',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color:
                          AppTheme.primary,
                      borderRadius:
                          BorderRadius.circular(
                              10),
                    ),
                    child: const Icon(
                      Icons.restaurant_menu,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Hero card
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  borderRadius:
                      BorderRadius.circular(
                          20),
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children: [
                    const Text(
                      'Asah Lidah Digital!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Buktikan pengetahuanmu tentang warisan rasa Nusantara.',
                      style: TextStyle(
                        color:
                            Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width:
                          double.infinity,
                      height: 48,
                     child: ElevatedButton(
                     onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                          const QuizQuestionScreen(),
                          ),
                          );

                          setState(() {});

                          },

                        style:
                            ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.white,
                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(
                                    12),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .center,
                          children: [
                            Text(
                              'Start Quiz',
                              style:
                                  TextStyle(
                                color:
                                    AppTheme
                                        .primary,
                                fontWeight:
                                    FontWeight
                                        .bold,
                                fontSize:
                                    16,
                              ),
                            ),
                            SizedBox(
                                width: 8),
                            Icon(
                              Icons
                                  .arrow_forward,
                              color:
                                  AppTheme
                                      .primary,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Score info
              Row(
                children: [
                 _scoreCard(
                  'Level: ${ScoreManager.getLevel()}',
                  null),
                  const SizedBox(
                      width: 12),
                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsets
                              .all(16),
                      decoration:
                          BoxDecoration(
                        color:
                            Colors.white,
                        borderRadius:
                            BorderRadius
                                .circular(
                                    12),
                      ),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        children: [
                          Text(
                            '${ScoreManager.totalScore} / 1000 Poin',
                            style:
                                TextStyle(
                              fontSize:
                                  12,
                              color:
                                  AppTheme
                                      .textGrey,
                            ),
                          ),
                          const SizedBox(
                              height:
                                  6),
                          ClipRRect(
                            borderRadius:
                                BorderRadius
                                    .circular(
                                        4),
                            child:
                                LinearProgressIndicator(
                             value: ScoreManager.getProgress(),
                              backgroundColor:
                                  const Color(
                                      0xFFE0E0E0),
                              valueColor:
                                  const AlwaysStoppedAnimation(
                                      AppTheme.primary),
                              minHeight:
                                  8,
                            ),
                          ),
                          const SizedBox(
                              height:
                                  6),
                          Text(
                            'TOTAL SKOR ${ScoreManager.totalScore}',
                            style:
                                TextStyle(
                              fontWeight:
                                  FontWeight
                                      .bold,
                              fontSize:
                                  14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Challenges
              Row(
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,
                children: [
                  const Text(
                    'Pilih Tantangan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Lihat Semua',
                      style: TextStyle(
                        color:
                            AppTheme
                                .primary,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              ...challenges.map(
                (c) => _challengeCard(
                    context, c),
              ),

              const SizedBox(height: 20),

              // Quote
              Container(
                padding:
                    const EdgeInsets.all(
                        20),
                decoration:
                    BoxDecoration(
                  color: const Color(
                      0xFF2D2D2D),
                  borderRadius:
                      BorderRadius.circular(
                          16),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.auto_awesome,
                      color:
                          Colors.amber,
                      size: 24,
                    ),
                    const SizedBox(
                        width: 12),
                    const Expanded(
                      child: Text(
                        '"Rasa adalah bahasa universal yang tak butuh kata."',
                        style:
                            TextStyle(
                          color: Colors
                              .white,
                          fontSize: 13,
                          fontStyle:
                              FontStyle
                                  .italic,
                        ),
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

  Widget _scoreCard(
    String label,
    String? value,
  ) =>
      Container(
        padding:
            const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(
                  12),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontWeight:
                FontWeight.w600,
            fontSize: 13,
          ),
        ),
      );

  Widget _challengeCard(
    BuildContext context,
    Map<String, String?> c,
  ) =>
      GestureDetector(
        onTap: () async {
  if (c['title'] == 'Tebak Gambar') {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const TebakGambarScreen(),
      ),
    );

    setState(() {});
  } else if (c['title'] ==
      'Filosofi Makanan') {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const FilosofiScreen(),
      ),
    );

    setState(() {});
  } else {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const QuizQuestionScreen(),
      ),
    );

    setState(() {});
  }
},

        child: Container(
          margin:
              const EdgeInsets.only(
                  bottom: 10),
          padding:
              const EdgeInsets.all(
                  16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(
                    14),
            boxShadow: [
              BoxShadow(
                color: Colors.black
                    .withOpacity(
                        0.04),
                blurRadius: 6,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration:
                    BoxDecoration(
                  color: AppTheme
                      .primaryLight,
                  borderRadius:
                      BorderRadius
                          .circular(
                              12),
                ),
                child: const Icon(
                  Icons.quiz_rounded,
                  color:
                      AppTheme.primary,
                  size: 24,
                ),
              ),
              const SizedBox(
                  width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children: [
                    Text(
                      c['title']!,
                      style:
                          const TextStyle(
                        fontWeight:
                            FontWeight
                                .bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                        height: 4),
                    Text(
                      c['desc']!,
                      style:
                          const TextStyle(
                        color: AppTheme
                            .textGrey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              if (c['badge'] !=
                  null)
                Container(
                  padding:
                      const EdgeInsets
                          .symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration:
                      BoxDecoration(
                    color: AppTheme
                        .primary,
                    borderRadius:
                        BorderRadius
                            .circular(
                                8),
                  ),
                  child: Text(
                    c['badge']!,
                    style:
                        const TextStyle(
                      color: Colors
                          .white,
                      fontSize: 11,
                      fontWeight:
                          FontWeight
                              .bold,
                    ),
                  ),
                ),
              const SizedBox(
                  width: 8),
              const Icon(
                Icons
                    .arrow_forward_ios,
                size: 14,
                color: AppTheme
                    .textGrey,
              ),
            ],
          ),
        ),
      );
}