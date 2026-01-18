import 'package:flutter/material.dart';
import '../../widgets/glassmorphic_card.dart';
import '../../widgets/app_background.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final leaders = [
      {'rank': 1, 'name': 'Bindra Bhatt', 'score': 8620, 'tests': 20, 'badge': '🥇'},
      {'rank': 2, 'name': 'Bishnu pargemi', 'score': 8540, 'tests': 20, 'badge': '🥈'},
      {'rank': 3, 'name': 'Ashok Kumar Sah', 'score': 8320, 'tests': 20, 'badge': '🥉'},
      {'rank': 4, 'name': 'Sushma', 'score': 8120, 'tests': 20, 'badge': '4'},
      {'rank': 5, 'name': 'Ram Bharos Mandal', 'score': 7960, 'tests': 20, 'badge': '5'},
      {'rank': 6, 'name': 'Sarmila Bishwkarma', 'score': 7840, 'tests': 20, 'badge': '6'},
      {'rank': 7, 'name': 'Laxmi bham', 'score': 7620, 'tests': 20, 'badge': '7'},
      {'rank': 8, 'name': 'aajana Bhattarai', 'score': 7480, 'tests': 20, 'badge': '8'},
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
                Row(
                  children: [
                    Text(
                      'Test Leaderboard',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.filter_alt_outlined, color: Colors.white, size: 16),
                          SizedBox(width: 6),
                          Text(
                            'Filter',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Your Position
                GlassmorphicCard(
                  borderRadius: 16,
                  blur: 12,
                  opacity: 0.18,
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFF2563eb).withOpacity(0.3),
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [Color(0xFF2563eb), Color(0xFF7c3aed)],
                            ),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            '🥇',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your Rank',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                '#247 • 6840 points',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.trending_up, color: Color(0xFF22c55e)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                
                // Top 3
                Text(
                  'Top Performers',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(height: 10),
                
                Expanded(
                  child: ListView.separated(
                    itemCount: leaders.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final leader = leaders[index];
                      final isTopThree = index < 3;
                      
                      return GlassmorphicCard(
                        borderRadius: 16,
                        blur: 12,
                        opacity: 0.18,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: isTopThree
                                ? LinearGradient(
                                    colors: [
                                      const Color(0xFF2563eb).withOpacity(0.15),
                                      const Color(0xFF7c3aed).withOpacity(0.1),
                                    ],
                                  )
                                : null,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(0.12),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  leader['badge'].toString(),
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      leader['name'].toString(),
                                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${leader['tests']} Questions • Rank #${leader['rank']}',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.7),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  '${leader['score']}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
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
        ),
      ),
    );
  }
}
