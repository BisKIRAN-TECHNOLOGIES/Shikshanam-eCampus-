import 'package:flutter/material.dart';
import '../../widgets/glassmorphic_card.dart';
import '../../widgets/app_background.dart';
import 'video_list_screen.dart';
import 'notes_viewer_screen.dart';

class TopicListScreen extends StatelessWidget {
  final String subjectName;
  final String subjectId;

  const TopicListScreen({
    super.key,
    required this.subjectName,
    required this.subjectId,
  });

  List<Map<String, dynamic>> _getTopics() {
    // Different topics based on subject
    switch (subjectId) {
      case 'gk_first_paper':
        return [
          {
            'id': '1.1',
            'name': 'महाब्रह्माण्ड सम्बन्धी जानकारी(Universe)',
            'icon': '🌌',
            'videos': 8,
            'notes': 2,
            'tests': 4,
            'color': const Color(0xFF3b82f6),
          },
          {
            'id': '1.2',
            'name': 'विश्वको भूगोल',
            'icon': '🌍',
            'videos': 5,
            'notes': 1,
            'tests': 4,
            'color': const Color(0xFF10b981),
          },
          {
            'id': '1.3',
            'name': 'नेपालको भूगोल',
            'icon': '🗻',
            'videos': 14,
            'notes': 1,
            'tests': 7,
            'color': const Color(0xFF06b6d4),
          },
          {
            'id': '1.4',
            'name': 'विश्वको इतिहास',
            'icon': '📜',
            'videos': 5,
            'notes': 1,
            'tests': 5,
            'color': const Color(0xFF8b5cf6),
          },
          {
            'id': '1.5',
            'name': 'नेपालको इतिहास',
            'icon': '🏛️',
            'videos': 19,
            'notes': 1,
            'tests': 11,
            'color': const Color(0xFFef4444),
          },
          {
            'id': '1.6',
            'name': 'नेपालको सामाजिक एवं सांस्कृतिक अवस्था',
            'icon': '👥',
            'videos': 5,
            'notes': 1,
            'tests': 5,
            'color': const Color(0xFFf59e0b),
          },
          {
            'id': '1.7',
            'name': 'नेपालको आर्थिक अवस्था (Updated)',
            'icon': '💰',
            'videos': 6,
            'notes': 2,
            'tests': 4,
            'color': const Color(0xFF14b8a6),
          },
          {
            'id': '1.8',
            'name': 'विज्ञान प्रविधि र स्वास्थ्य',
            'icon': '🔬',
            'videos': 6,
            'notes': 2,
            'tests': 5,
            'color': const Color(0xFF6366f1),
          },
          {
            'id': '1.9',
            'name': 'प्रारिम्भिक प्रशासन र सातवरण',
            'icon': '🏢',
            'videos': 6,
            'notes': 1,
            'tests': 7,
            'color': const Color(0xFFec4899),
          },
          {
            'id': '1.10',
            'name': 'अन्तर्राष्ट्रीय सम्बन्ध तथा अंग संस्था',
            'icon': '🌐',
            'videos': 10,
            'notes': 1,
            'tests': 8,
            'color': const Color(0xFF84cc16),
          },
          {
            'id': '1.11',
            'name': 'खेलकुद तथा अन्तर्राष्ट्रीय महत्वका नागरिकतिक घट्नाहरु',
            'icon': '⚽',
            'videos': 9,
            'notes': 9,
            'tests': 9,
            'color': const Color(0xFFf97316),
          },
        ];
      case 'iq_first_paper':
        return [
          {
            'id': 'dt',
            'name': 'Date & Calendar (मिति र पात्रो)',
            'icon': '📅',
            'videos': 9,
            'notes': 0,
            'tests': 0,
            'color': const Color(0xFF3b82f6),
          },
          {
            'id': 'hl',
            'name': 'Head & Legs (टाउको र खुट्टा)',
            'icon': '🧍',
            'videos': 2,
            'notes': 0,
            'tests': 0,
            'color': const Color(0xFF10b981),
          },
          {
            'id': 'fc',
            'name': 'Figure Counting (चित्र गणना)',
            'icon': '🔢',
            'videos': 6,
            'notes': 0,
            'tests': 0,
            'color': const Color(0xFFf59e0b),
          },
          {
            'id': 'fm',
            'name': 'Figure Matrix (चित्र म्याट्रिक्स)',
            'icon': '📊',
            'videos': 4,
            'notes': 1,
            'tests': 0,
            'color': const Color(0xFF8b5cf6),
          },
          {
            'id': 'fraction',
            'name': 'भिन्न हमानन ( Fraction)',
            'icon': '➗',
            'videos': 9,
            'notes': 1,
            'tests': 0,
            'color': const Color(0xFFef4444),
          },
          {
            'id': 'analogy',
            'name': 'Analogy',
            'icon': '🔗',
            'videos': 9,
            'notes': 1,
            'tests': 0,
            'color': const Color(0xFF06b6d4),
          },
          {
            'id': 'dd',
            'name': 'Distance and Direction',
            'icon': '🧭',
            'videos': 4,
            'notes': 4,
            'tests': 0,
            'color': const Color(0xFF14b8a6),
          },
          {
            'id': 'ranking',
            'name': 'Ranking Order',
            'icon': '🏆',
            'videos': 10,
            'notes': 2,
            'tests': 0,
            'color': const Color(0xFFf97316),
          },
          {
            'id': 'ratio',
            'name': 'Ratio & Proportion',
            'icon': '📐',
            'videos': 3,
            'notes': 1,
            'tests': 0,
            'color': const Color(0xFF6366f1),
          },
          {
            'id': 'nvr',
            'name': 'NON VERBAL REASONING TEST',
            'icon': '🎨',
            'videos': 2,
            'notes': 0,
            'tests': 0,
            'color': const Color(0xFFec4899),
          },
          {
            'id': 'time_work',
            'name': 'Time & Work (समय र काम)',
            'icon': '⏰',
            'videos': 6,
            'notes': 2,
            'tests': 0,
            'color': const Color(0xFF84cc16),
          },
          {
            'id': 'average',
            'name': 'AVERAGE',
            'icon': '📈',
            'videos': 4,
            'notes': 1,
            'tests': 0,
            'color': const Color(0xFF0ea5e9),
          },
          {
            'id': 'percentage',
            'name': 'Percentage %',
            'icon': '%',
            'videos': 4,
            'notes': 1,
            'tests': 0,
            'color': const Color(0xFFa855f7),
          },
          {
            'id': 'age',
            'name': 'Problem On Age (उमेर समम)',
            'icon': '👴',
            'videos': 4,
            'notes': 0,
            'tests': 0,
            'color': const Color(0xFFfbbf24),
          },
          {
            'id': 'series',
            'name': 'Series',
            'icon': '🔢',
            'videos': 0,
            'notes': 2,
            'tests': 0,
            'color': const Color(0xFF22c55e),
          },
          {
            'id': 'assertion',
            'name': 'Assertion and Reasoning',
            'icon': '💡',
            'videos': 0,
            'notes': 1,
            'tests': 0,
            'color': const Color(0xFF3b82f6),
          },
          {
            'id': 'coding',
            'name': 'Coding and Decoding',
            'icon': '🔐',
            'videos': 5,
            'notes': 1,
            'tests': 0,
            'color': const Color(0xFF06b6d4),
          },
        ];
      case 'gk_trick_videos':
        return [
          {
            'id': 'science',
            'name': 'विज्ञान प्रविधि',
            'icon': '🔬',
            'videos': 9,
            'notes': 0,
            'tests': 4,
            'color': const Color(0xFF3b82f6),
          },
          {
            'id': 'nepal_history',
            'name': 'नेपालको इतिहास',
            'icon': '🏛️',
            'videos': 13,
            'notes': 0,
            'tests': 0,
            'color': const Color(0xFFef4444),
          },
          {
            'id': 'nepal_geo',
            'name': 'नेपालको भूगोल',
            'icon': '🗻',
            'videos': 8,
            'notes': 0,
            'tests': 0,
            'color': const Color(0xFF10b981),
          },
          {
            'id': 'world_history',
            'name': 'विश्व इतिहास',
            'icon': '📜',
            'videos': 3,
            'notes': 0,
            'tests': 0,
            'color': const Color(0xFF8b5cf6),
          },
          {
            'id': 'world_geo',
            'name': 'विश्व भूगोल',
            'icon': '🌍',
            'videos': 8,
            'notes': 0,
            'tests': 0,
            'color': const Color(0xFF06b6d4),
          },
          {
            'id': 'dharma',
            'name': 'धर्म संस्कृति',
            'icon': '🕉️',
            'videos': 8,
            'notes': 1,
            'tests': 0,
            'color': const Color(0xFFf59e0b),
          },
          {
            'id': 'universe',
            'name': 'ब्रहमाण्ड सम्बन्धी',
            'icon': '🌌',
            'videos': 7,
            'notes': 0,
            'tests': 0,
            'color': const Color(0xFF6366f1),
          },
          {
            'id': 'special_events',
            'name': 'विशेष सम्बन्ध तथा सुबाबाह',
            'icon': '🎯',
            'videos': 11,
            'notes': 0,
            'tests': 0,
            'color': const Color(0xFFec4899),
          },
        ];
      case 'paper_2':
        return [
          {
            'id': '1',
            'name': '१. नेपालको भौगोलिक, सामाजिक र आर्थिक अवस्था',
            'icon': '1️⃣',
            'videos': 0,
            'notes': 5,
            'tests': 0,
            'color': const Color(0xFF3b82f6),
          },
          {
            'id': '2',
            'name': '२. संवैधानिक व्यवस्था र सरकार',
            'icon': '2️⃣',
            'videos': 33,
            'notes': 13,
            'tests': 0,
            'color': const Color(0xFF10b981),
          },
          {
            'id': '3',
            'name': '३.१ कार्यालय व्यवस्थापन',
            'icon': '3️⃣',
            'videos': 17,
            'notes': 6,
            'tests': 0,
            'color': const Color(0xFFf59e0b),
          },
          {
            'id': '3.2',
            'name': '३.२ लेखा प्रणाली र राजस्व प्रसासन',
            'icon': '💼',
            'videos': 28,
            'notes': 7,
            'tests': 0,
            'color': const Color(0xFF8b5cf6),
          },
        ];
      case 'paper_3':
        return [
          {
            'id': '1',
            'name': '१. कार्यालय संचालन र सगठनात्मक व्यबहार',
            'icon': '1️⃣',
            'videos': 14,
            'notes': 3,
            'tests': 0,
            'color': const Color(0xFF3b82f6),
          },
          {
            'id': '2',
            'name': '२. प्रशासन तथा व्यवस्थापन',
            'icon': '2️⃣',
            'videos': 0,
            'notes': 0,
            'tests': 0,
            'color': const Color(0xFF10b981),
          },
          {
            'id': '3',
            'name': '३. सार्बजनिक सेवा व्यवस्थापन सम्बन्धी कानुनी व्यवस्था',
            'icon': '3️⃣',
            'videos': 0,
            'notes': 0,
            'tests': 0,
            'color': const Color(0xFFf59e0b),
          },
        ];
      case 'gk_new_group':
        return [
          {
            'id': 'int_org',
            'name': 'अन्तर्राष्ट्रिय संगसंस्था',
            'icon': '🌐',
            'videos': 14,
            'notes': 1,
            'tests': 4,
            'color': const Color(0xFF3b82f6),
          },
          {
            'id': 'world_history',
            'name': 'विश्वको इतिहास',
            'icon': '📜',
            'videos': 8,
            'notes': 1,
            'tests': 2,
            'color': const Color(0xFF8b5cf6),
          },
          {
            'id': 'int_relations',
            'name': 'दिगो विकास पारिस्थितिक पद्धति र सातावरण',
            'icon': '🌱',
            'videos': 10,
            'notes': 1,
            'tests': 5,
            'color': const Color(0xFF10b981),
          },
          {
            'id': 'nepal_science',
            'name': 'नेपालको संबिधान विकासक्रम',
            'icon': '📖',
            'videos': 20,
            'notes': 1,
            'tests': 1,
            'color': const Color(0xFFef4444),
          },
          {
            'id': 'social_cultural',
            'name': 'नेपालको सामाजिक एवं सांस्कृतिक अवस्था',
            'icon': '👥',
            'videos': 10,
            'notes': 0,
            'tests': 8,
            'color': const Color(0xFFf59e0b),
          },
        ];
      default:
        return [
          {
            'id': 'os',
            'name': 'Old Question Sets',
            'icon': '📝',
            'videos': 0,
            'notes': 2,
            'tests': 12,
            'color': const Color(0xFF64748b),
          },
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final topics = _getTopics();

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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            subjectName,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Topics List
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: topics.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final topic = topics[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to video list or notes based on content
                        if ((topic['videos'] as int) > 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoListScreen(
                                topicName: topic['name'] as String,
                                topicId: topic['id'] as String,
                              ),
                            ),
                          );
                        } else if ((topic['notes'] as int) > 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NotesViewerScreen(),
                            ),
                          );
                        }
                      },
                      child: GlassmorphicCard(
                        borderRadius: 16,
                        blur: 12,
                        opacity: 0.18,
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          child: Row(
                            children: [
                              Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: (topic['color'] as Color)
                                      .withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  topic['icon'] as String,
                                  style: const TextStyle(fontSize: 28),
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (topic.containsKey('id'))
                                      Text(
                                        topic['id'] as String,
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11,
                                        ),
                                      ),
                                    const SizedBox(height: 4),
                                    Text(
                                      topic['name'] as String,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        if ((topic['videos'] as int) > 0) ...[
                                          Icon(
                                            Icons.play_circle_outline,
                                            size: 14,
                                            color:
                                                Colors.white.withOpacity(0.7),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            '${topic['videos']}',
                                            style: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(0.7),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                        ],
                                        if ((topic['notes'] as int) > 0) ...[
                                          Icon(
                                            Icons.description_outlined,
                                            size: 14,
                                            color:
                                                Colors.white.withOpacity(0.7),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            '${topic['notes']}',
                                            style: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(0.7),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                        ],
                                        if ((topic['tests'] as int) > 0) ...[
                                          Icon(
                                            Icons.quiz_outlined,
                                            size: 14,
                                            color:
                                                Colors.white.withOpacity(0.7),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            '${topic['tests']}',
                                            style: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(0.7),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
