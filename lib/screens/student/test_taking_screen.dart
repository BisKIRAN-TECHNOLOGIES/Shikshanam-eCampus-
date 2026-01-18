import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui';
import '../../widgets/glassmorphic_card.dart';
import '../../widgets/app_background.dart';
import '../../providers/app_state.dart';

class TestTakingScreen extends StatefulWidget {
  const TestTakingScreen({super.key});

  @override
  State<TestTakingScreen> createState() => _TestTakingScreenState();
}

class _TestTakingScreenState extends State<TestTakingScreen> {
  late ScrollController _scrollController;
  int currentQuestion = 1;
  int totalQuestions = 50;
  int timeRemaining = 3600; // 60 minutes in seconds
  int selectedOption = -1;
  List<int> answeredQuestions = [];

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Which of the following is correct about Nepal\'s federal structure?',
      'options': ['Option A: Federation of states', 'Option B: Unitary state', 'Option C: Confederation', 'Option D: Monarchy'],
      'correct': 0,
    },
    {
      'question': 'What is the capital of Nepal?',
      'options': ['Pokhara', 'Kathmandu', 'Biratnagar', 'Janakpur'],
      'correct': 1,
    },
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToQuestion(int questionNumber) {
    final offset = (questionNumber - 1) * 40.0;
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              // Header with Timer
              Container(
                margin: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Test in Progress',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Question $currentQuestion of $totalQuestions',
                          style: const TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.red.withOpacity(0.9), Colors.orange.withOpacity(0.9)],
                            ),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
                          ),
                          child: Column(
                            children: [
                              const Text('Time Left', style: TextStyle(color: Colors.white, fontSize: 11)),
                              const SizedBox(height: 4),
                              Text(
                                formatTime(timeRemaining),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Progress Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: currentQuestion / totalQuestions,
                    minHeight: 8,
                    backgroundColor: Colors.white.withOpacity(0.1),
                    valueColor: const AlwaysStoppedAnimation(Color(0xFF3b82f6)),
                  ),
                ),
              ),

              // Main Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Question Card
                      GlassmorphicCard(
                        borderRadius: 20,
                        blur: 12,
                        opacity: 0.18,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Question $currentQuestion',
                                style: const TextStyle(
                                  color: Color(0xFF3b82f6),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                questions[0]['question'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Options
                      Text(
                        'Select your answer:',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.white70,
                              fontWeight: FontWeight.w600,
                            ),
                      ),

                      const SizedBox(height: 12),

                      ...List.generate(
                        questions[0]['options'].length,
                        (index) {
                          bool isSelected = selectedOption == index;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedOption = index;
                                  if (!answeredQuestions.contains(currentQuestion)) {
                                    answeredQuestions.add(currentQuestion);
                                  }
                                });
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: isSelected
                                            ? [const Color(0xFF10b981).withOpacity(0.9), const Color(0xFF22c55e).withOpacity(0.9)]
                                            : [const Color(0xFF1e40af).withOpacity(0.8), const Color(0xFF2563eb).withOpacity(0.8)],
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: isSelected ? const Color(0xFF22c55e) : Colors.white.withOpacity(0.2),
                                        width: isSelected ? 2 : 1.5,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 24,
                                          height: 24,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: isSelected ? Colors.white : Colors.white.withOpacity(0.6),
                                              width: 2,
                                            ),
                                          ),
                                          child: isSelected
                                              ? const Icon(Icons.check, size: 14, color: Colors.white)
                                              : null,
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Text(
                                            questions[0]['options'][index],
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom Navigation
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Question Navigator
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.blue.withOpacity(0.1), Colors.purple.withOpacity(0.1)],
                            ),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: currentQuestion > 1
                                    ? () {
                                        setState(() {
                                          currentQuestion--;
                                          selectedOption = -1;
                                        });
                                      }
                                    : null,
                                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 40,
                                  child: ListView.builder(
                                    controller: _scrollController,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: totalQuestions,
                                    itemBuilder: (context, index) {
                                      bool isAnswered = answeredQuestions.contains(index + 1);
                                      bool isCurrent = currentQuestion == index + 1;
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            currentQuestion = index + 1;
                                            selectedOption = -1;
                                          });
                                          _scrollToQuestion(index + 1);
                                        },
                                        child: Container(
                                          width: 36,
                                          height: 36,
                                          margin: const EdgeInsets.symmetric(horizontal: 4),
                                          decoration: BoxDecoration(
                                            color: isCurrent
                                                ? const Color(0xFF3b82f6)
                                                : isAnswered
                                                    ? const Color(0xFF10b981)
                                                    : Colors.white.withOpacity(0.2),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: isCurrent ? const Color(0xFF60a5fa) : Colors.white.withOpacity(0.3),
                                              width: isCurrent ? 2 : 1.5,
                                            ),
                                            boxShadow: isCurrent
                                                ? [
                                                    BoxShadow(
                                                      color: const Color(0xFF3b82f6).withOpacity(0.5),
                                                      blurRadius: 8,
                                                      spreadRadius: 2,
                                                    )
                                                  ]
                                                : null,
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${index + 1}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: isCurrent ? 12 : 11,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: currentQuestion < totalQuestions
                                    ? () {
                                        setState(() {
                                          currentQuestion++;
                                          selectedOption = -1;
                                        });
                                      }
                                    : null,
                                icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Action Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: currentQuestion < totalQuestions
                                ? () {
                                    setState(() {
                                      currentQuestion++;
                                      selectedOption = -1;
                                    });
                                  }
                                : null,
                            icon: const Icon(Icons.arrow_forward),
                            label: const Text('Next Question'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3b82f6),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: const Color(0xFF1a1a2e),
                                  title: const Text('Submit Test?', style: TextStyle(color: Colors.white)),
                                  content: Text(
                                    'You have answered ${answeredQuestions.length} of $totalQuestions questions.\n\nAre you sure you want to submit?',
                                    style: const TextStyle(color: Colors.white70),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Cancel', style: TextStyle(color: Color(0xFF3b82f6))),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Provider.of<AppState>(context, listen: false).navigateTo(StudentPage.testResults);
                                      },
                                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFef4444)),
                                      child: const Text('Submit'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            icon: const Icon(Icons.check_circle),
                            label: const Text('Submit Test'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFef4444),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                      ],
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
}
