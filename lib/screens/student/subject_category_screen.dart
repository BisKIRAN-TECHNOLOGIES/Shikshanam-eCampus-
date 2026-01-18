import 'package:flutter/material.dart';
import '../../widgets/glassmorphic_card.dart';
import '../../widgets/app_background.dart';
import 'topic_list_screen.dart';

class SubjectCategoryScreen extends StatefulWidget {
  final String examName;
  
  const SubjectCategoryScreen({
    super.key,
    this.examName = 'Nasu',
  });

  @override
  State<SubjectCategoryScreen> createState() => _SubjectCategoryScreenState();
}

class _SubjectCategoryScreenState extends State<SubjectCategoryScreen> {
  final subjects = [
    {
      'id': 'gk_trick_videos',
      'name': 'G.K. Trick Based Videos',
      'icon': '👨‍🏫',
      'color': const Color(0xFF2563eb),
      'type': 'videos',
    },
    {
      'id': 'gk_first_paper',
      'name': 'GK First Paper',
      'icon': '📘',
      'color': const Color(0xFF38bdf8),
      'type': 'topics',
    },
    {
      'id': 'gk_new_group',
      'name': 'GK New Group',
      'icon': '✅',
      'color': const Color(0xFFef4444),
      'type': 'topics',
    },
    {
      'id': 'iq_first_paper',
      'name': 'IQ First Paper',
      'icon': '🧠',
      'color': const Color(0xFF3b82f6),
      'type': 'topics',
    },
    {
      'id': 'iq_videos',
      'name': 'IQ Videos By Ishwori Sir.',
      'icon': '🎓',
      'color': const Color(0xFFf59e0b),
      'type': 'videos',
    },
    {
      'id': 'paper_2',
      'name': 'द्वितीय पत्र (Paper II)',
      'icon': '📄',
      'color': const Color(0xFF8b5cf6),
      'type': 'topics',
    },
    {
      'id': 'paper_3',
      'name': 'तृतीय पत्र (Paper III)',
      'icon': '📋',
      'color': const Color(0xFF10b981),
      'type': 'topics',
    },
    {
      'id': 'current_affairs',
      'name': 'समसामयिक विषय वस्तुहरु',
      'icon': '📰',
      'color': const Color(0xFF06b6d4),
      'type': 'topics',
    },
    {
      'id': 'old_questions',
      'name': 'Old Question Set',
      'icon': '📝',
      'color': const Color(0xFF64748b),
      'type': 'questions',
    },
    {
      'id': 'gorkhapatra',
      'name': 'Gorkhapatra',
      'icon': '📰',
      'color': const Color(0xFF14b8a6),
      'type': 'news',
    },
  ];

  @override
  Widget build(BuildContext context) {
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
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFef4444),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Text(
                                'Exam: Nasu',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Exam: Nasu',
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
                          const SizedBox(height: 4),
                          Text(
                            'Exam: ${widget.examName}',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.75),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.notifications_outlined,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2563eb),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'गोरखापत्र',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Subjects Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Subjects',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Grid of Subjects
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: subjects.length,
                    itemBuilder: (context, index) {
                      final subject = subjects[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TopicListScreen(
                                subjectName: subject['name'] as String,
                                subjectId: subject['id'] as String,
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
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: (subject['color'] as Color)
                                        .withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    subject['icon'] as String,
                                    style: const TextStyle(fontSize: 32),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  subject['name'] as String,
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13,
                                    height: 1.3,
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
              
              // Suggested Videos & Podcasts Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Suggested Videos',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 140,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          return GlassmorphicCard(
                            borderRadius: 16,
                            blur: 12,
                            opacity: 0.18,
                            child: Container(
                              width: 200,
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    alignment: Alignment.center,
                                    child: const Icon(
                                      Icons.play_circle_outline,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Nasu Live Copy Checking',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Podcasts',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 100,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          return GlassmorphicCard(
                            borderRadius: 16,
                            blur: 12,
                            opacity: 0.18,
                            child: Container(
                              width: 160,
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    alignment: Alignment.center,
                                    child: const Icon(
                                      Icons.play_circle_outline,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      'Episode ${index + 1}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
