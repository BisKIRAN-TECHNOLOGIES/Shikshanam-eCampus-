import 'package:flutter/material.dart';
import '../../widgets/glassmorphic_card.dart';
import '../../widgets/app_background.dart';
import 'package:provider/provider.dart';
import '../../providers/app_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _subjects = [
    {
      'id': '1',
      'title': 'G.K. Trick Based\nVideos',
      'icon': Icons.play_circle_fill,
      'color': const Color(0xFFd946ef),
      'bgColor': const Color(0xFFf5d6ff),
    },
    {
      'id': '2',
      'title': 'GK First Paper',
      'icon': Icons.assignment,
      'color': const Color(0xFF3b82f6),
      'bgColor': const Color(0xFFdbeafe),
    },
    {
      'id': '3',
      'title': 'GK New Group',
      'icon': Icons.groups,
      'color': const Color(0xFFf59e0b),
      'bgColor': const Color(0xFFfef3c7),
    },
    {
      'id': '4',
      'title': 'IQ First Paper',
      'icon': Icons.psychology,
      'color': const Color(0xFF1d4ed8),
      'bgColor': const Color(0xFFdbeafe),
    },
    {
      'id': '5',
      'title': 'IQ Videos By\nVikram Sir',
      'icon': Icons.video_library,
      'color': const Color(0xFFdc2626),
      'bgColor': const Color(0xFFFECACA),
    },
    {
      'id': '6',
      'title': '2रिद पत्र\n(Paper II)',
      'icon': Icons.book,
      'color': const Color(0xFF0891b2),
      'bgColor': const Color(0xFFcffafe),
    },
    {
      'id': '7',
      'title': '3रिद पत्र\n(Paper III)',
      'icon': Icons.library_books,
      'color': const Color(0xFF2563eb),
      'bgColor': const Color(0xFFdbeafe),
    },
    {
      'id': '8',
      'title': 'साधारणज्ञान विषय\nइत्यादि',
      'icon': Icons.lightbulb,
      'color': const Color(0xFF7c3aed),
      'bgColor': const Color(0xFFede9fe),
    },
    {
      'id': '9',
      'title': 'Old Question\nSet',
      'icon': Icons.history,
      'color': const Color(0xFF059669),
      'bgColor': const Color(0xFFd1fae5),
    },
    {
      'id': '10',
      'title': 'Gorkhapatra',
      'icon': Icons.newspaper,
      'color': const Color(0xFFb45309),
      'bgColor': const Color(0xFFfef3c7),
    },
  ];

  final List<Map<String, dynamic>> _modules = [
    {
      'id': '1.1',
      'title': 'महाब्रह्माण्ड सम्बन्धी जानकारी (Universe)',
      'notes': 8,
      'videos': 2,
      'tests': 4,
      'icon': Icons.travel_explore,
      'color': const Color(0xFF60a5fa),
    },
    {
      'id': '1.2',
      'title': 'विश्वको भूगोल',
      'notes': 5,
      'videos': 1,
      'tests': 4,
      'icon': Icons.public,
      'color': const Color(0xFF34d399),
    },
    {
      'id': '1.3',
      'title': 'नेपालको भूगोल',
      'notes': 14,
      'videos': 1,
      'tests': 7,
      'icon': Icons.terrain,
      'color': const Color(0xFFf59e0b),
    },
    {
      'id': '1.4',
      'title': 'विश्वको इतिहास',
      'notes': 5,
      'videos': 1,
      'tests': 5,
      'icon': Icons.account_balance,
      'color': const Color(0xFFa855f7),
    },
    {
      'id': '1.5',
      'title': 'नेपालको इतिहास',
      'notes': 19,
      'videos': 1,
      'tests': 11,
      'icon': Icons.flag,
      'color': const Color(0xFFef4444),
    },
    {
      'id': '1.6',
      'title': 'नेपालको सामाजिक पूर्व सांस्कृतिक अवस्था',
      'notes': 13,
      'videos': 1,
      'tests': 9,
      'icon': Icons.groups_2,
      'color': const Color(0xFF0ea5e9),
    },
    {
      'id': '1.7',
      'title': 'नेपालको आर्थिक अवस्था (Updated)',
      'notes': 11,
      'videos': 1,
      'tests': 8,
      'icon': Icons.currency_rupee,
      'color': const Color(0xFF22c55e),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AppBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context, isDark),
                const SizedBox(height: 16),
                _buildStatsRow(context),
                const SizedBox(height: 16),
                _buildSectionTitle(context, 'Subjects'),
                const SizedBox(height: 10),
                _buildSubjectsGrid(context),
                const SizedBox(height: 16),
                _buildSectionTitle(context, 'GK First Paper'),
                const SizedBox(height: 10),
                ..._modules.map((module) => _buildModuleCard(context, module)),
                const SizedBox(height: 16),
                _buildSectionTitle(context, 'Suggested Videos'),
                const SizedBox(height: 10),
                _buildHorizontalCards(context, isDark),
                const SizedBox(height: 16),
                _buildSectionTitle(context, 'Podcasts'),
                const SizedBox(height: 10),
                _buildPodcasts(context, isDark),
                const SizedBox(height: 24),
                Center(
                  child: Text(
                    'Shikshanam eCampus • Powered by BisKIRAN',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: isDark
                              ? Colors.white.withOpacity(0.8)
                              : const Color(0xFF64748b),
                          fontWeight: FontWeight.w600,
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

  Widget _buildHeader(BuildContext context, bool isDark) {
    return GlassmorphicCard(
      borderRadius: 24,
      blur: 14,
      opacity: 0.18,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: [
              const Color(0xFF2563eb).withOpacity(0.25),
              const Color(0xFF7c3aed).withOpacity(0.18),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shikshanam eCampus',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Powered by BisKIRAN',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white.withOpacity(0.9),
                          ),
                    ),
                  ],
                ),
                const Spacer(),
                // Theme Toggle Button
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Provider.of<AppState>(context, listen: false)
                          .toggleDarkMode();
                    },
                    icon: Icon(
                      Theme.of(context).brightness == Brightness.dark
                          ? Icons.light_mode_rounded
                          : Icons.dark_mode_rounded,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? const Color(0xFFFBBF24)
                          : Colors.white,
                    ),
                    tooltip: Theme.of(context).brightness == Brightness.dark
                        ? 'Switch to Light Mode'
                        : 'Switch to Dark Mode',
                  ),
                ),
                const SizedBox(width: 8),
                // Notifications Button
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Provider.of<AppState>(context, listen: false)
                          .navigateTo(StudentPage.notifications);
                    },
                    icon: const Icon(Icons.notifications_outlined,
                        color: Colors.white),
                    tooltip: 'Notifications',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: isDark ? Colors.white.withOpacity(0.1) : Colors.white,
                boxShadow: isDark
                    ? null
                    : [
                        BoxShadow(
                          color: const Color(0xFF2563eb).withOpacity(0.1),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                border: Border.all(
                  color: isDark
                      ? Colors.white.withOpacity(0.15)
                      : const Color(0xFF2563eb).withOpacity(0.2),
                  width: 1.5,
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search subjects, notes, tests...',
                  hintStyle: TextStyle(
                    color: isDark
                        ? Colors.white.withOpacity(0.7)
                        : const Color(0xFF94a3b8),
                    fontWeight: FontWeight.w500,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: isDark ? Colors.white : const Color(0xFF2563eb),
                  ),
                  suffixIcon: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.white.withOpacity(0.1)
                          : const Color(0xFF2563eb).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.tune,
                      size: 18,
                      color: isDark ? Colors.white70 : const Color(0xFF2563eb),
                    ),
                  ),
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
                style: TextStyle(
                  color: isDark ? Colors.white : const Color(0xFF0f172a),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsRow(BuildContext context) {
    final stats = [
      {
        'label': 'Streak',
        'value': '12 days',
        'icon': Icons.local_fire_department,
        'color': const Color(0xFFfb923c)
      },
      {
        'label': 'Accuracy',
        'value': '86%',
        'icon': Icons.check_circle_outline,
        'color': const Color(0xFF22c55e)
      },
      {
        'label': 'Tests',
        'value': '48',
        'icon': Icons.assignment_turned_in,
        'color': const Color(0xFF38bdf8)
      },
    ];

    return Row(
      children: stats
          .map(
            (stat) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: GlassmorphicCard(
                  borderRadius: 18,
                  blur: 12,
                  opacity: 0.16,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 34,
                              height: 34,
                              decoration: BoxDecoration(
                                color:
                                    (stat['color'] as Color).withOpacity(0.18),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                stat['icon'] as IconData,
                                color: stat['color'] as Color,
                                size: 18,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          stat['value'] as String,
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : const Color(0xFF0f172a),
                                    fontWeight: FontWeight.w800,
                                  ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          stat['label'] as String,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white.withOpacity(0.7)
                                        : const Color(0xFF64748b),
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final actions = [
      {
        'label': 'Leaderboard',
        'icon': Icons.leaderboard,
        'onTap': () => appState.navigateTo(StudentPage.leaderboard),
      },
      {
        'label': 'Store',
        'icon': Icons.shopping_bag_outlined,
        'onTap': () => appState.navigateTo(StudentPage.store),
      },
      {
        'label': 'My Courses',
        'icon': Icons.school_outlined,
        'onTap': () => appState.navigateTo(StudentPage.myCourses),
      },
      {
        'label': 'Bookmarks',
        'icon': Icons.bookmark_border,
        'onTap': () {},
      },
    ];

    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: actions.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final action = actions[index];
          return GestureDetector(
            onTap: action['onTap'] as VoidCallback?,
            child: GlassmorphicCard(
              borderRadius: 16,
              blur: 10,
              opacity: 0.16,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(action['icon'] as IconData,
                        color: isDark ? Colors.white : const Color(0xFF2563eb)),
                    const SizedBox(width: 8),
                    Text(
                      action['label'] as String,
                      style: TextStyle(
                        color: isDark ? Colors.white : const Color(0xFF0f172a),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSubjectsGrid(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemCount: _subjects.length,
      itemBuilder: (context, index) {
        final subject = _subjects[index];
        return GestureDetector(
          onTap: () {
            if (subject['id'] == '10') {
              appState.navigateTo(StudentPage.gorkhapatra);
            } else {
              appState.navigateTo(StudentPage.subjectCategory);
            }
          },
          child: Column(
            children: [
              Expanded(
                child: GlassmorphicCard(
                  borderRadius: 16,
                  blur: 10,
                  opacity: 0.14,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [
                          (subject['color'] as Color).withOpacity(0.25),
                          (subject['color'] as Color).withOpacity(0.08),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        subject['icon'] as IconData,
                        color: subject['color'] as Color,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subject['title'] as String,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : const Color(0xFF0f172a),
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: isDark ? Colors.white : const Color(0xFF0f172a),
            fontWeight: FontWeight.w800,
          ),
    );
  }

  Widget _buildModuleCard(BuildContext context, Map<String, dynamic> module) {
    final appState = Provider.of<AppState>(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          appState.navigateTo(
            StudentPage.contentDetail,
            {'title': 'GK First Paper', 'type': 'GK'},
          );
        },
        child: GlassmorphicCard(
          borderRadius: 18,
          blur: 12,
          opacity: 0.18,
          child: Container(
            padding: const EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(14),
                    color: (module['color'] as Color).withOpacity(0.2),
                  ),
                  child: Icon(
                    module['icon'] as IconData,
                    color: module['color'] as Color,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${module['id']} ${module['title']}',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : const Color(0xFF0f172a),
                                  fontWeight: FontWeight.w800,
                                ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          _buildMetaChip(
                            Icons.book_outlined,
                            '${module['notes']}',
                            onTap: () =>
                                appState.navigateTo(StudentPage.notesViewer),
                          ),
                          _buildMetaChip(
                            Icons.ondemand_video,
                            '${module['videos']}',
                            onTap: () =>
                                appState.navigateTo(StudentPage.videoPlayer),
                          ),
                          _buildMetaChip(
                            Icons.quiz_outlined,
                            '${module['tests']}',
                            onTap: () =>
                                appState.navigateTo(StudentPage.testTaking),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios,
                    size: 16,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white70
                        : const Color(0xFF94a3b8)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMetaChip(IconData icon, String label, {VoidCallback? onTap}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: isDark
                ? Colors.white.withOpacity(0.12)
                : const Color(0xFF2563eb).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon,
                  color: isDark ? Colors.white : const Color(0xFF2563eb),
                  size: 16),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: isDark ? Colors.white : const Color(0xFF2563eb),
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalCards(BuildContext context, bool isDark) {
    final items = [
      {
        'title': 'Nasu Live Copy Checking',
        'subtitle': 'Live session replay',
        'duration': '45:30',
        'color': const Color(0xFF2563eb),
        'image': 'images/video_live_checking.png',
      },
      {
        'title': 'GS Rapid Revision',
        'subtitle': '50 mins • Teacher: Bini',
        'duration': '50:00',
        'color': const Color(0xFFf97316),
        'image': 'images/video_rapid_revision.png',
      },
    ];

    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () => Provider.of<AppState>(context, listen: false)
                .navigateTo(StudentPage.videoPlayer),
            child: SizedBox(
              width: 280,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Video Thumbnail
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: (item['color'] as Color).withOpacity(0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            // Thumbnail image
                            Image.asset(
                              item['image'] as String,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        (item['color'] as Color)
                                            .withOpacity(0.8),
                                        (item['color'] as Color)
                                            .withOpacity(0.5),
                                      ],
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.play_circle_outline,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                );
                              },
                            ),
                            // Gradient overlay
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.6),
                                  ],
                                  stops: const [0.4, 1.0],
                                ),
                              ),
                            ),
                            // Play button
                            Center(
                              child: Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.95),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 12,
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.play_arrow_rounded,
                                  color: item['color'] as Color,
                                  size: 34,
                                ),
                              ),
                            ),
                            // Duration badge
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.75),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  item['duration'] as String,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            // Live indicator for first item
                            if (index == 0)
                              Positioned(
                                top: 10,
                                left: 10,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFef4444),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 6,
                                        height: 6,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      const Text(
                                        'REPLAY',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 9,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Title
                  Text(
                    item['title'] as String,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: isDark ? Colors.white : const Color(0xFF0f172a),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  // Subtitle
                  Text(
                    item['subtitle'] as String,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: isDark
                          ? Colors.white.withOpacity(0.7)
                          : const Color(0xFF64748b),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPodcasts(BuildContext context, bool isDark) {
    final items = [
      {
        'title': 'Daily GK Bytes',
        'duration': '12 min',
        'image': 'images/podcast_gk_bytes.png'
      },
      {
        'title': 'Economy Deep Dive',
        'duration': '18 min',
        'image': 'images/podcast_economy.png'
      },
      {
        'title': 'Nepal History Flash',
        'duration': '9 min',
        'image': 'images/podcast_history.png'
      },
    ];

    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () => Provider.of<AppState>(context, listen: false)
                .navigateTo(StudentPage.notesViewer),
            child: SizedBox(
              width: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Thumbnail Image
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: isDark
                                ? Colors.black.withOpacity(0.3)
                                : Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              item['image'] as String,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        const Color(0xFF2563eb)
                                            .withOpacity(0.8),
                                        const Color(0xFF7c3aed)
                                            .withOpacity(0.8),
                                      ],
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.mic,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                );
                              },
                            ),
                            // Play overlay
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.5),
                                  ],
                                ),
                              ),
                            ),
                            // Play button
                            Center(
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.play_arrow_rounded,
                                  color: Color(0xFF7c3aed),
                                  size: 26,
                                ),
                              ),
                            ),
                            // Duration badge
                            Positioned(
                              bottom: 8,
                              right: 8,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  item['duration'] as String,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Title
                  Text(
                    item['title'] as String,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: isDark ? Colors.white : const Color(0xFF0f172a),
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
