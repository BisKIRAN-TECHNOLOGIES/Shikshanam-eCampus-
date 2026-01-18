import 'package:flutter/material.dart';
import '../../widgets/glassmorphic_card.dart';
import '../../widgets/app_background.dart';

class ContentDetailScreen extends StatelessWidget {
  final String title;
  final String type;
  
  const ContentDetailScreen({
    super.key,
    this.title = 'GK First Paper',
    this.type = 'GK',
  });

  @override
  Widget build(BuildContext context) {
    final subtopics = [
      {
        'id': '1.1',
        'name': 'महाब्रह्माण्ड सम्बन्धी जानकारी',
        'notes': 8,
        'videos': 2,
        'tests': 4,
      },
      {
        'id': '1.2',
        'name': 'विश्वको भूगोल',
        'notes': 5,
        'videos': 1,
        'tests': 4,
      },
      {
        'id': '1.3',
        'name': 'नेपालको भूगोल',
        'notes': 14,
        'videos': 1,
        'tests': 7,
      },
      {
        'id': '1.4',
        'name': 'विश्वको इतिहास',
        'notes': 5,
        'videos': 1,
        'tests': 5,
      },
      {
        'id': '1.5',
        'name': 'नेपालको इतिहास',
        'notes': 19,
        'videos': 1,
        'tests': 11,
      },
      {
        'id': '1.6',
        'name': 'सामाजिक विषय',
        'notes': 13,
        'videos': 1,
        'tests': 9,
      },
      {
        'id': '1.7',
        'name': 'आर्थिक अवस्था',
        'notes': 11,
        'videos': 1,
        'tests': 8,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                          Text(
                            'Exam: $type',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.75),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              // Content List
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.separated(
                    itemCount: subtopics.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final item = subtopics[index];
                      return GlassmorphicCard(
                        borderRadius: 16,
                        blur: 12,
                        opacity: 0.18,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.12),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          item['id'].toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          item['name'].toString(),
                                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800,
                                              ),
                                        ),
                                      ),
                                      const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white70),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      _buildMetaTag(Icons.book_outlined, '${item['notes']} notes'),
                                      const SizedBox(width: 8),
                                      _buildMetaTag(Icons.videocam_outlined, '${item['videos']} videos'),
                                      const SizedBox(width: 8),
                                      _buildMetaTag(Icons.quiz_outlined, '${item['tests']} tests'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetaTag(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 14),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
