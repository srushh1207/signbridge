import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../theme/colors.dart';
import 'auth_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isHighContrast = false;
  bool _soundEnabled = true;
  bool _hapticsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Profile Header
              _buildProfileHeader(),
              const SizedBox(height: 32),

              // Stats Grid
              Text(
                'YOUR STATISTICS',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondaryText,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              _buildStatsGrid(),
              const SizedBox(height: 32),

              // Settings Sections
              Text(
                'APPLICATION SETTINGS',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondaryText,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              _buildSettingsCard(),
              const SizedBox(height: 32),
              
              // Logout Action Button
              OutlinedButton(
                onPressed: () async {
                  final navigator = Navigator.of(context, rootNavigator: true);
                  await FirebaseAuth.instance.signOut();
                  navigator.pushReplacement(
                    MaterialPageRoute(builder: (context) => const AuthScreen()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: AppColors.error),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Log Out Account',
                  style: GoogleFonts.inter(
                    color: AppColors.error,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    final user = FirebaseAuth.instance.currentUser;
    final String displayName = (user != null && user.displayName != null && user.displayName!.trim().isNotEmpty)
        ? user.displayName!
        : (user != null && user.isAnonymous ? 'Guest Learner' : 'Rohan Sharma');

    // Get initials
    String initials = 'RS';
    if (displayName.trim().isNotEmpty) {
      final parts = displayName.trim().split(RegExp(r'\s+'));
      if (parts.length > 1) {
        initials = (parts[0][0] + parts[1][0]).toUpperCase();
      } else if (parts[0].isNotEmpty) {
        initials = parts[0][0].toUpperCase();
      }
    }

    String memberSince = 'Member since June 2026';
    if (user != null && user.metadata.creationTime != null) {
      final date = user.metadata.creationTime!;
      final months = [
        'January', 'February', 'March', 'April', 'May', 'June',
        'July', 'August', 'September', 'October', 'November', 'December'
      ];
      memberSince = 'Member since ${months[date.month - 1]} ${date.year}';
    }

    return Column(
      children: [
        // Avatar with gradient border
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppColors.primaryGradient,
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryAccent.withOpacity(0.2),
                blurRadius: 16,
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 48,
            backgroundColor: AppColors.secondaryBg,
            child: Text(
              initials,
              style: GoogleFonts.sora(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        
        // Name & level details
        Text(
          displayName,
          style: GoogleFonts.sora(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          memberSince,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: AppColors.secondaryText,
          ),
        ),
        const SizedBox(height: 12),
        
        // Progress level pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.secondaryBg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.stars_rounded, color: AppColors.primaryAccent, size: 16),
              const SizedBox(width: 6),
              Text(
                'Conversationalist',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildStatsGrid() {
    final List<Map<String, dynamic>> stats = [
      {
        'title': 'Total XP',
        'value': '420 XP',
        'icon': Icons.offline_bolt_rounded,
        'color': AppColors.primaryAccent,
      },
      {
        'title': 'Active Streak',
        'value': '7 Days',
        'icon': Icons.local_fire_department_rounded,
        'color': AppColors.rewardAccent,
      },
      {
        'title': 'Longest Streak',
        'value': '15 Days',
        'icon': Icons.emoji_events_rounded,
        'color': AppColors.secondaryAccent,
      },
      {
        'title': 'Lessons Completed',
        'value': '12 Lessons',
        'icon': Icons.menu_book_rounded,
        'color': AppColors.primaryAccent,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.4,
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        final stat = stats[index];
        final Color color = stat['color'];

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.secondaryBg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(stat['icon'], color: color, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    stat['title'],
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      color: AppColors.secondaryText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                stat['value'],
                style: GoogleFonts.sora(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSettingsCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          // Accessibility Dark Mode Toggle
          _buildSwitchRow(
            title: 'AMOLED High Contrast Mode',
            subtitle: 'Darker pure black backgrounds for optimization.',
            value: _isHighContrast,
            onChanged: (val) {
              setState(() {
                _isHighContrast = val;
              });
            },
          ),
          const Divider(color: AppColors.border, height: 1),
          // Sound Effects
          _buildSwitchRow(
            title: 'Sound Effects & Audio Feedback',
            subtitle: 'Play sounds during correct answer submissions.',
            value: _soundEnabled,
            onChanged: (val) {
              setState(() {
                _soundEnabled = val;
              });
            },
          ),
          const Divider(color: AppColors.border, height: 1),
          // Haptic Toggles
          _buildSwitchRow(
            title: 'Haptic Feedback',
            subtitle: 'Subtle device vibrations for interactions.',
            value: _hapticsEnabled,
            onChanged: (val) {
              setState(() {
                _hapticsEnabled = val;
              });
            },
          ),
          const Divider(color: AppColors.border, height: 1),
          // Goal Adjustment
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            title: Text(
              'Change Learning Goal',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText,
                fontSize: 14.5,
              ),
            ),
            subtitle: Text(
              'Adjust your daily minute targets.',
              style: GoogleFonts.inter(
                fontSize: 12,
                color: AppColors.secondaryText,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, color: AppColors.border, size: 16),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchRow({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      title: Text(
        title,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.bold,
          color: AppColors.primaryText,
          fontSize: 14.5,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.inter(
          fontSize: 12,
          color: AppColors.secondaryText,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.primaryAccent,
        activeTrackColor: AppColors.primaryAccent.withOpacity(0.25),
        inactiveThumbColor: AppColors.secondaryText,
        inactiveTrackColor: AppColors.cardBg,
      ),
    );
  }
}
