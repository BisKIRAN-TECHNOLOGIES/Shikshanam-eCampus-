import 'package:flutter/material.dart';
import '../../widgets/glassmorphic_card.dart';
import '../../widgets/app_background.dart';
import 'test_instruction_screen.dart';

class TestListScreen extends StatelessWidget {
  final String examName;

  const TestListScreen({
    super.key,
    required this.examName,
  });

  @override
  Widget build(BuildContext context) {
    final tests = [
      {
        'title': 'Time And Work Weekly Test',
        'questions': 20,
        'marks': 40,
        'status': 'Complete set',
        'isFree': true,
      },
      {
        'title': 'IQ Weekly Exam set',
        'questions': 20,
        'marks': 40,
        'status': 'Available',
        'isFree': true,
      },
      {
        'title': 'IQ Weekly Exam set',
        'questions': 20,
        'marks': 40,
        'status': 'Available',
        'isFree': true,
      },
      {
        'title': 'GK Full Mock Test 01',
        'questions': 100,
        'marks': 100,
        'status': 'Premium',
        'isFree': false,
      },
      {
        'title': 'Current Affairs Weekly',
        'questions': 30,
        'marks': 30,
        'status': 'Available',
        'isFree': true,
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
                        examName,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                  ],
                ),
              ),

              // Tests List
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: tests.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final test = tests[index];
                    final isFree = test['isFree'] as bool;
                    final isCompleteSet = test['status'] == 'Complete set';

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TestInstructionScreen(
                              testTitle: test['title'] as String,
                              questions: test['questions'] as int,
                              marks: test['marks'] as int,
                            ),
                          ),
                        );
                      },
                      child: GlassmorphicCard(
                        borderRadius: 16,
                        blur: 12,
                        opacity: 0.18,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Status Badge
                              if (isCompleteSet)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFef4444),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Text(
                                    'Complete set',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              if (isCompleteSet) const SizedBox(height: 12),

                              // Test Title
                              Text(
                                test['title'] as String,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),

                              // Test Info
                              Row(
                                children: [
                                  // Questions Icon
                                  Icon(
                                    Icons.quiz_outlined,
                                    size: 16,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    '${test['questions']} Questions',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(width: 16),

                                  // Divider
                                  Container(
                                    width: 1,
                                    height: 14,
                                    color: Colors.white.withOpacity(0.3),
                                  ),
                                  const SizedBox(width: 16),

                                  // Marks Icon
                                  Icon(
                                    Icons.assignment_outlined,
                                    size: 16,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    '${test['marks']} Marks',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),

                              // Free/Premium Badge
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: isFree
                                      ? const Color(0xFF22c55e).withOpacity(0.2)
                                      : const Color(0xFFf59e0b).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  isFree ? 'Free' : 'Premium',
                                  style: TextStyle(
                                    color: isFree
                                        ? const Color(0xFF22c55e)
                                        : const Color(0xFFf59e0b),
                                    fontWeight: FontWeight.w800,
                                    fontSize: 12,
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
            ],
          ),
        ),
      ),
    );
  }
}
