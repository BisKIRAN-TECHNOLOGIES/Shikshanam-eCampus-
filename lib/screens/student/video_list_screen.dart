import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/glassmorphic_card.dart';
import '../../widgets/app_background.dart';
import '../../providers/app_state.dart';

class VideoListScreen extends StatelessWidget {
  final String topicName;
  final String topicId;

  const VideoListScreen({
    super.key,
    required this.topicName,
    required this.topicId,
  });

  List<Map<String, dynamic>> _getVideos() {
    // Sample video list based on the screenshots
    return [
      {
        'title': 'विज्ञान प्रविधि PART-9',
        'subtitle': 'PART-9',
        'duration': '00:10:29',
        'isPaid': true,
        'icon': Icons.lock,
      },
      {
        'title': 'विज्ञान प्रविधि PART-8',
        'subtitle': 'PART-8',
        'duration': '00:31:46',
        'isPaid': true,
        'icon': Icons.lock,
      },
      {
        'title': 'विज्ञान प्रविधि PART-7',
        'subtitle': 'PART-7',
        'duration': '00:21:15',
        'isPaid': true,
        'icon': Icons.lock,
      },
      {
        'title': 'विज्ञान प्रविधि PART-6',
        'subtitle': 'PART-6',
        'duration': '00:16:45',
        'isPaid': true,
        'icon': Icons.lock,
      },
      {
        'title': 'विज्ञान प्रविधि PART-5',
        'subtitle': 'PART-5',
        'duration': '00:20:22',
        'isPaid': true,
        'icon': Icons.lock,
      },
      {
        'title': 'विज्ञान प्रविधि PART-4',
        'subtitle': 'PART-4',
        'duration': '00:26:54',
        'isPaid': true,
        'icon': Icons.lock,
      },
      {
        'title': 'विज्ञान प्रविधि PART-3',
        'subtitle': 'PART-3',
        'duration': '00:25:40',
        'isPaid': false,
        'icon': Icons.play_circle,
      },
      {
        'title': 'विज्ञान प्रविधि PART-2',
        'subtitle': 'PART-2',
        'duration': '00:13:39',
        'isPaid': false,
        'icon': Icons.play_circle,
      },
      {
        'title': 'विज्ञान प्रविधि PART-1',
        'subtitle': 'PART-1',
        'duration': '00:19:08',
        'isPaid': false,
        'icon': Icons.play_circle,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final videos = _getVideos();

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
                        topicName,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                  ],
                ),
              ),

              // Video List
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: videos.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final video = videos[index];
                    final isPaid = video['isPaid'] as bool;

                    return GestureDetector(
                      onTap: () {
                        if (!isPaid) {
                          // Navigate to video player for free videos
                          Provider.of<AppState>(context, listen: false)
                              .navigateTo(StudentPage.videoPlayer);
                        } else {
                          // Show upgrade dialog for paid videos
                          _showUpgradeDialog(context);
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
                              // Play/Lock Icon
                              Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: isPaid
                                      ? const Color(0xFFef4444).withOpacity(0.2)
                                      : const Color(0xFF22c55e).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                alignment: Alignment.center,
                                child: Icon(
                                  video['icon'] as IconData,
                                  color: isPaid
                                      ? const Color(0xFFef4444)
                                      : const Color(0xFF22c55e),
                                  size: 28,
                                ),
                              ),
                              const SizedBox(width: 14),

                              // Video Info
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      video['title'] as String,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      video['subtitle'] as String,
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        // Status Badge
                                        if (isPaid)
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFef4444),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: const Text(
                                              'Paid',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 10,
                                              ),
                                            ),
                                          )
                                        else
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF22c55e),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: const Text(
                                              'Free',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        const SizedBox(width: 8),

                                        // Duration
                                        Icon(
                                          Icons.access_time,
                                          size: 14,
                                          color: Colors.white.withOpacity(0.7),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          video['duration'] as String,
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.7),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              // Arrow Icon
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 18,
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

  void _showUpgradeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1e293b),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          'Upgrade Required',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        content: const Text(
          'This video is available only for premium members. Please upgrade your plan to access this content.',
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Provider.of<AppState>(context, listen: false)
                  .navigateTo(StudentPage.store);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2563eb),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Upgrade Now',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
