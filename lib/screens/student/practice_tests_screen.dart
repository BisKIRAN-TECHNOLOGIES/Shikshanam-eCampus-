import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/glassmorphic_card.dart';
import '../../widgets/app_background.dart';
import '../../providers/app_state.dart';

class PracticeTestsScreen extends StatelessWidget {
  const PracticeTestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tests = [
      {
        'title': 'GK Full Mock 01',
        'questions': 100,
        'time': '90 min',
        'status': 'Ready',
        'color': const Color(0xFF2563eb),
      },
      {
        'title': 'Economy Mini Test',
        'questions': 40,
        'time': '35 min',
        'status': 'In Progress',
        'color': const Color(0xFFf59e0b),
      },
      {
        'title': 'History Sectional 02',
        'questions': 60,
        'time': '50 min',
        'status': 'Attempted',
        'color': const Color(0xFF22c55e),
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
                  'Practice Tests',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(height: 12),
                GlassmorphicCard(
                  borderRadius: 16,
                  blur: 12,
                  opacity: 0.18,
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        _statTile('Attempts', '12', Icons.check_circle_outline, const Color(0xFF22c55e)),
                        _statTile('Accuracy', '86%', Icons.trending_up, const Color(0xFF38bdf8)),
                        _statTile('Average', '48/100', Icons.star_border, const Color(0xFFf59e0b)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.separated(
                    itemCount: tests.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final test = tests[index];
                      return GestureDetector(
                        onTap: () => Provider.of<AppState>(context, listen: false)
                            .navigateTo(StudentPage.testTaking),
                        child: GlassmorphicCard(
                        borderRadius: 16,
                        blur: 12,
                        opacity: 0.18,
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: (test['color'] as Color).withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      test['status'] as String,
                                      style: TextStyle(
                                        color: test['color'] as Color,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () => Provider.of<AppState>(context, listen: false)
                                        .navigateTo(StudentPage.testTaking),
                                    icon: const Icon(Icons.play_circle_outline, color: Colors.white),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                test['title'] as String,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  _detailChip(Icons.help_outline, '${test['questions']} qs'),
                                  _detailChip(Icons.timer_outlined, test['time'] as String),
                                ],
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
      ),
    );
  }

  Widget _statTile(String label, String value, IconData icon, Color color) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.75),
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _detailChip(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.12),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 16),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
