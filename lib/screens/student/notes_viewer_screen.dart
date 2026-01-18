import 'package:flutter/material.dart';
import '../../widgets/glassmorphic_card.dart';
import '../../widgets/app_background.dart';

class NotesViewerScreen extends StatelessWidget {
  const NotesViewerScreen({super.key});

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
                  'Notes Viewer',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: GlassmorphicCard(
                    borderRadius: 16,
                    blur: 12,
                    opacity: 0.18,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Chapter 1: Introduction',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'This is a placeholder for notes content. The PDF or rich text viewer will be integrated here.',
                              style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
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
