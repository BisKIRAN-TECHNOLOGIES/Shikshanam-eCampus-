import 'package:flutter/material.dart';
import '../../widgets/glassmorphic_card.dart';
import '../../widgets/app_background.dart';

class TestResultsScreen extends StatelessWidget {
  const TestResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  'Test Results',
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
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Score', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                        Text('82/100', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.separated(
                    itemCount: 5,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return GlassmorphicCard(
                        borderRadius: 16,
                        blur: 12,
                        opacity: 0.18,
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          child: Row(
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: Alignment.center,
                                child: Text('${index + 1}',
                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('Question title goes here',
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
                                    SizedBox(height: 6),
                                    Text('Your answer: A • Correct answer: B',
                                        style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 12)),
                                  ],
                                ),
                              ),
                              const Icon(Icons.check_circle, color: Color(0xFF22c55e)),
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
