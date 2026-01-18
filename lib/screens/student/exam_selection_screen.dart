import 'package:flutter/material.dart';
import '../../widgets/glassmorphic_card.dart';
import '../../widgets/app_background.dart';
import 'test_list_screen.dart';

class ExamSelectionScreen extends StatelessWidget {
  const ExamSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final exams = [
      {
        'name': 'Banking',
        'icon': '🏦',
        'color': const Color(0xFF2563eb),
      },
      {
        'name': 'Kharidar',
        'icon': '👔',
        'color': const Color(0xFF10b981),
      },
      {
        'name': 'Meditation (ध्यान)',
        'icon': '🧘',
        'color': const Color(0xFFa855f7),
      },
      {
        'name': 'Nasu',
        'icon': '👨‍💼',
        'color': const Color(0xFF3b82f6),
      },
      {
        'name': 'Nepal Telecom',
        'icon': '📞',
        'color': const Color(0xFFef4444),
      },
      {
        'name': 'Preliminary/\nPre-Qualifying exa\nmination (सगालित\nसंस्था)',
        'icon': '📋',
        'color': const Color(0xFFf59e0b),
      },
      {
        'name': 'TSC',
        'icon': '👨‍🏫',
        'color': const Color(0xFF06b6d4),
      },
      {
        'name': 'Teaching License',
        'icon': '📜',
        'color': const Color(0xFF8b5cf6),
      },
      {
        'name': 'test',
        'icon': '📝',
        'color': const Color(0xFF64748b),
      },
      {
        'name': 'कर्मचारी सज्चय कोष\n[चौथी तह]',
        'icon': '💰',
        'color': const Color(0xFF14b8a6),
      },
      {
        'name': 'कर्मचारी सज्चय कोष\n[तेश्रो तह]',
        'icon': '💵',
        'color': const Color(0xFF0ea5e9),
      },
      {
        'name': 'खाद्य व्यवस्था तथा\nव्यापार कम्पनी',
        'icon': '🍚',
        'color': const Color(0xFF84cc16),
      },
      {
        'name': 'नेपाल पत्री जबाब /\nASI / Inspector',
        'icon': '🚔',
        'color': const Color(0xFFfbbf24),
      },
      {
        'name': 'नेपाल नियुक्त प्रशिक्षण\n[नागरी तह]',
        'icon': '📚',
        'color': const Color(0xFFec4899),
      },
      {
        'name': 'प्राविधिक तर्फ\n[Technical line]',
        'icon': '⚙️',
        'color': const Color(0xFF6366f1),
      },
      {
        'name': 'प्राविधिक सहायक\n[प्र.स.]',
        'icon': '🔧',
        'color': const Color(0xFFf97316),
      },
      {
        'name': 'लोकसेवा आयोग प्रथम\nपत्र',
        'icon': '📄',
        'color': const Color(0xFF22c55e),
      },
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    Expanded(
                      child: Text(
                        'Test',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                  ],
                ),
              ),

              // Exams Grid
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.85,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: exams.length,
                    itemBuilder: (context, index) {
                      final exam = exams[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TestListScreen(
                                examName: exam['name'] as String,
                              ),
                            ),
                          );
                        },
                        child: GlassmorphicCard(
                          borderRadius: 16,
                          blur: 12,
                          opacity: 0.18,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: (exam['color'] as Color).withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    exam['icon'] as String,
                                    style: const TextStyle(fontSize: 26),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Expanded(
                                  child: Text(
                                    exam['name'] as String,
                                    textAlign: TextAlign.center,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 11,
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
