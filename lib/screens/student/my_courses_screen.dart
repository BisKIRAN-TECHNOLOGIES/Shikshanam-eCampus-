import 'package:flutter/material.dart';
import '../../widgets/glassmorphic_card.dart';
import '../../widgets/app_background.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  final Map<int, bool> _expandedItems = {};

  @override
  Widget build(BuildContext context) {
    final courses = [
      {
        'title': 'नायब सुख (Life Time)',
        'type': 'Content Type: All Content',
        'image': 'Course Image',
        'topics': [
          {'name': 'G.K. Trick Based Videos', 'modules': 12},
          {'name': 'GK First Paper', 'modules': 18},
          {'name': 'GK New Group', 'modules': 5},
          {'name': 'IQ First Paper', 'modules': 8},
          {'name': 'IQ Videos By Ishwori Sir', 'modules': 6},
          {'name': 'Paper II (Class II)', 'modules': 4},
          {'name': 'Paper III (Class III)', 'modules': 3},
        ],
      },
      {
        'title': 'खालिर (Life Time)',
        'type': 'Content Type: All Content',
        'image': 'Kharidar',
        'topics': [
          {'name': 'Banking सम्बन्धित', 'modules': 15},
          {'name': 'Insurance सम्बन्धित', 'modules': 10},
          {'name': 'को Exam Prep', 'modules': 12},
        ],
      },
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AppBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Courses',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(height: 16),
                
                Expanded(
                  child: ListView.separated(
                    itemCount: courses.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, courseIndex) {
                      final course = courses[courseIndex];
                      final isExpanded = _expandedItems[courseIndex] ?? false;
                      
                      return GlassmorphicCard(
                        borderRadius: 18,
                        blur: 12,
                        opacity: 0.18,
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _expandedItems[courseIndex] = !isExpanded;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        gradient: const LinearGradient(
                                          colors: [Color(0xFF2563eb), Color(0xFF7c3aed)],
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: const Icon(
                                        Icons.school_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            course['title'].toString(),
                                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            course['type'].toString(),
                                            style: TextStyle(
                                              color: Colors.white.withOpacity(0.75),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      isExpanded ? Icons.expand_less : Icons.expand_more,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              
                              if (isExpanded) ...[
                                const SizedBox(height: 12),
                                Divider(color: Colors.white.withOpacity(0.2)),
                                const SizedBox(height: 12),
                                ...(course['topics'] as List<Map<String, dynamic>>).map(
                                  (topic) => Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 4,
                                          height: 4,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white.withOpacity(0.6),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                topic['name'].toString(),
                                                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                              ),
                                              const SizedBox(height: 2),
                                              Text(
                                                '${topic['modules']} modules',
                                                style: TextStyle(
                                                  color: Colors.white.withOpacity(0.65),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 11,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
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
        ),
      ),
    );
  }
}
