import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/glassmorphic_card.dart';
import '../../widgets/app_background.dart';
import '../../providers/app_state.dart';

class StudyLibraryScreen extends StatelessWidget {
  const StudyLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'title': 'Daily GK Notes (Nepali)',
        'type': 'Notes',
        'size': '1.4 MB • Updated today',
        'color': const Color(0xFF38bdf8),
      },
      {
        'title': 'Economy One-Pager (2026)',
        'type': 'PDF',
        'size': '2.1 MB • Ver 2.0',
        'color': const Color(0xFF22c55e),
      },
      {
        'title': 'World Geography Flashcards',
        'type': 'Cards',
        'size': '620 KB • 42 terms',
        'color': const Color(0xFFf59e0b),
      },
      {
        'title': 'History Audio Capsules',
        'type': 'Audio',
        'size': '18 min • 6 clips',
        'color': const Color(0xFFa855f7),
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
                Row(
                  children: [
                    Text(
                      'Study Library',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_alt_outlined, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                GlassmorphicCard(
                  borderRadius: 16,
                  blur: 12,
                  opacity: 0.24,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search notes, PDFs, flashcards...',
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.w600,
                      ),
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return GestureDetector(
                        onTap: () {
                          final type = item['type'] as String;
                          final appState = Provider.of<AppState>(context, listen: false);
                          if (type == 'Notes' || type == 'PDF' || type == 'Cards') {
                            appState.navigateTo(StudentPage.notesViewer);
                          } else {
                            appState.navigateTo(StudentPage.videoPlayer);
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
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: (item['color'] as Color).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.description_outlined,
                                  color: item['color'] as Color,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['title'] as String,
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      item['size'] as String,
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.75),
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
                                  item['type'] as String,
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
