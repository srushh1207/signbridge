import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/colors.dart';

class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({super.key});

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  final List<Map<String, dynamic>> _badges = [
    {
      'title': 'First Step',
      'desc': 'Completed your very first sign language lesson.',
      'requirement': 'Start 1st lesson',
      'icon': Icons.rocket_launch_rounded,
      'color': AppColors.primaryAccent,
      'unlocked': true,
      'unlockedDate': 'June 10, 2026',
    },
    {
      'title': '7-Day Fire',
      'desc': 'Maintained a consistent learning streak for 7 days.',
      'requirement': 'Keep a 7-day streak',
      'icon': Icons.local_fire_department_rounded,
      'color': AppColors.rewardAccent,
      'unlocked': true,
      'unlockedDate': 'June 12, 2026',
    },
    {
      'title': 'Word Collector',
      'desc': 'Discovered and learned 10 different signs in the ISL Dictionary.',
      'requirement': 'View 10 dictionary items',
      'icon': Icons.collections_bookmark_rounded,
      'color': AppColors.secondaryAccent,
      'unlocked': true,
      'unlockedDate': 'June 11, 2026',
    },
    {
      'title': 'Perfect Matcher',
      'desc': 'Matched all cards perfectly on the first try in a matching quiz.',
      'requirement': 'Perfect matching score',
      'icon': Icons.bolt_rounded,
      'color': AppColors.primaryAccent,
      'unlocked': true,
      'unlockedDate': 'June 12, 2026',
    },
    {
      'title': 'Sign Master',
      'desc': 'Successfully completed all the curriculum paths of ISL.',
      'requirement': 'Finish all learning paths',
      'icon': Icons.emoji_events_rounded,
      'color': AppColors.rewardAccent,
      'unlocked': false,
    },
    {
      'title': 'XP Titan',
      'desc': 'Earned a milestone of 1000 Experience Points (XP).',
      'requirement': 'Earn 1,000 XP in total',
      'icon': Icons.military_tech_rounded,
      'color': AppColors.secondaryAccent,
      'unlocked': false,
    },
    {
      'title': 'Safety Envoy',
      'desc': 'Learned every emergency-related sign in the dictionary.',
      'requirement': 'Unlock Emergency category',
      'icon': Icons.health_and_safety_rounded,
      'color': AppColors.error,
      'unlocked': false,
    },
    {
      'title': 'Bridge Creator',
      'desc': 'Supported accessibility by practicing with friends for 10 sessions.',
      'requirement': 'Complete 10 peer sessions',
      'icon': Icons.connect_without_contact_rounded,
      'color': AppColors.primaryAccent,
      'unlocked': false,
    },
  ];

  void _showBadgeDetails(Map<String, dynamic> badge) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final Color color = badge['color'];
        final bool isUnlocked = badge['unlocked'];

        return Dialog(
          backgroundColor: AppColors.secondaryBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: const BorderSide(color: AppColors.border),
          ),
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isUnlocked ? color.withOpacity(0.12) : AppColors.cardBg,
                      border: Border.all(
                        color: isUnlocked ? color : AppColors.border,
                        width: 2,
                      ),
                      boxShadow: isUnlocked
                          ? [
                              BoxShadow(
                                color: color.withOpacity(0.25),
                                blurRadius: 16,
                              )
                            ]
                          : null,
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      badge['icon'],
                      size: 48,
                      color: isUnlocked ? color : AppColors.secondaryText,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  badge['title'],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sora(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryText,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  isUnlocked
                      ? 'UNLOCKED ON ${badge['unlockedDate']}'.toUpperCase()
                      : 'LOCKED ACHIEVEMENT',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: isUnlocked ? AppColors.primaryAccent : AppColors.secondaryText,
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  badge['desc'],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: AppColors.primaryText.withOpacity(0.9),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 12),
                if (!isUnlocked)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.cardBg,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.lock_rounded, size: 16, color: AppColors.secondaryText),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Requirement: ${badge['requirement']}',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: AppColors.secondaryText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isUnlocked ? color : AppColors.border,
                    foregroundColor: isUnlocked ? AppColors.primaryBg : AppColors.secondaryText,
                  ),
                  child: Text(
                    isUnlocked ? 'Awesome' : 'Close',
                    style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final int unlockedCount = _badges.where((b) => b['unlocked']).length;
    final double completionRate = unlockedCount / _badges.length;

    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Text(
                'Achievements',
                style: GoogleFonts.sora(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
              Text(
                'Milestones reached on your path to fluency.',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: AppColors.secondaryText,
                ),
              ),
              const SizedBox(height: 24),

              // Badges summary card
              _buildProgressCard(unlockedCount, completionRate),
              const SizedBox(height: 32),

              // Badges grid
              Text(
                'BADGES COLLECTION',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondaryText,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.95,
                ),
                itemCount: _badges.length,
                itemBuilder: (context, index) {
                  final badge = _badges[index];
                  return _buildBadgeTile(badge);
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressCard(int unlocked, double rate) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.secondaryBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 68,
                height: 68,
                child: CircularProgressIndicator(
                  value: rate,
                  strokeWidth: 6,
                  backgroundColor: AppColors.border,
                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primaryAccent),
                ),
              ),
              Text(
                '$unlocked/${_badges.length}',
                style: GoogleFonts.sora(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              )
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Milestone Progress',
                  style: GoogleFonts.sora(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Unlock more badges to climb the leaderboards and claim weekly XP boosts.',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppColors.secondaryText,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBadgeTile(Map<String, dynamic> badge) {
    final Color color = badge['color'];
    final bool isUnlocked = badge['unlocked'];

    return GestureDetector(
      onTap: () => _showBadgeDetails(badge),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondaryBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isUnlocked ? color.withOpacity(0.4) : AppColors.border,
            width: isUnlocked ? 1.5 : 1,
          ),
          boxShadow: isUnlocked
              ? [
                  BoxShadow(
                    color: color.withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  )
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isUnlocked ? color.withOpacity(0.12) : AppColors.cardBg,
              ),
              child: Icon(
                badge['icon'],
                color: isUnlocked ? color : AppColors.secondaryText.withOpacity(0.4),
                size: 28,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              badge['title'],
              style: GoogleFonts.sora(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isUnlocked ? AppColors.primaryText : AppColors.secondaryText.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              isUnlocked ? 'Unlocked' : 'Locked',
              style: GoogleFonts.inter(
                fontSize: 11,
                color: isUnlocked ? AppColors.primaryAccent : AppColors.secondaryText.withOpacity(0.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
