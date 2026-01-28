import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/glassmorphic_card.dart';
import '../../widgets/app_background.dart';
import '../../providers/app_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock user data for now since auth service structure changed
    final mockUser = {
      'displayName': 'Student User',
      'email': 'student@example.com',
      'photoUrl': null,
    };

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AppBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ================= PROFILE HEADER =================
                GlassmorphicCard(
                  borderRadius: 24,
                  blur: 14,
                  opacity: 0.18,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // Avatar
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [Color(0xFF2563eb), Color(0xFF7c3aed)],
                            ),
                            image: mockUser['photoUrl'] != null
                                ? DecorationImage(
                                    image: NetworkImage(mockUser['photoUrl']!),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          alignment: Alignment.center,
                          child: mockUser['photoUrl'] == null
                              ? Text(
                                  (mockUser['displayName'] ?? 'U')
                                      .substring(0, 1)
                                      .toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w800,
                                  ),
                                )
                              : null,
                        ),
                        const SizedBox(height: 14),

                        // Name
                        Text(
                          mockUser['displayName'] ?? 'Guest User',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                        ),
                        const SizedBox(height: 6),

                        // Email
                        Text(
                          mockUser['email'] ?? 'Not signed in',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // ================= SETTINGS =================
                _sectionTitle(context, 'Account Settings'),
                _buildSettingItem(
                    context, Icons.edit_outlined, 'Edit Profile', () {}),
                _buildSettingItem(
                    context, Icons.school_outlined, 'Change Exam', () {}),
                _buildSettingItem(
                    context, Icons.payment_outlined, 'Transactions', () {}),

                const SizedBox(height: 16),

                // ================= SUPPORT =================
                _sectionTitle(context, 'Support & Info'),
                _buildSettingItem(context, Icons.privacy_tip_outlined,
                    'Privacy Policy', () {}),
                _buildSettingItem(context, Icons.description_outlined,
                    'Terms and Conditions', () {}),
                _buildSettingItem(
                    context, Icons.message_outlined, 'WhatsApp Support', () {}),
                _buildSettingItem(
                    context, Icons.contact_mail_outlined, 'Contact Us', () {}),

                const SizedBox(height: 16),

                // ================= LOGOUT =================
                SizedBox(
                  width: double.infinity,
                  child: GlassmorphicCard(
                    borderRadius: 16,
                    blur: 12,
                    opacity: 0.18,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () async {
                          final shouldLogout = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Logout'),
                              content: const Text(
                                  'Are you sure you want to logout?'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: const Text('Logout'),
                                ),
                              ],
                            ),
                          );

                          if (shouldLogout == true && context.mounted) {
                            // For now, just set logged out state
                            // TODO: Implement proper logout with new auth service
                            Provider.of<AppState>(context, listen: false)
                                .setLoggedIn(false);
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.logout, color: Colors.red),
                              SizedBox(width: 8),
                              Text(
                                'Log Out',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
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

  // ================= HELPERS =================

  Widget _sectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
      ),
    );
  }

  Widget _buildSettingItem(
    BuildContext context,
    IconData icon,
    String label,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GlassmorphicCard(
        borderRadius: 16,
        blur: 12,
        opacity: 0.18,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Icon(icon, color: Colors.white, size: 20),
                  const SizedBox(width: 12),
                  Text(
                    label,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios,
                      size: 16, color: Colors.white70),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
