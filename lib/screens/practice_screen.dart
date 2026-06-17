import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/colors.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  final List<Map<String, dynamic>> _challenges = [
    {
      'title': 'Speed Recognition',
      'duration': '2 Min Run',
      'xp': '+30 XP',
      'icon': Icons.timer_rounded,
      'color': AppColors.primaryAccent,
    },
    {
      'title': 'Perfect Accent',
      'duration': 'Daily Review',
      'xp': '+50 XP',
      'icon': Icons.verified_user_rounded,
      'color': AppColors.secondaryAccent,
    },
  ];

  final List<Map<String, dynamic>> _weakAreas = [
    {
      'word': 'Letter "C"',
      'reason': 'Missed matching 2 days ago',
      'icon': Icons.abc_rounded,
    },
    {
      'word': 'Mother',
      'reason': 'Struggled with chin tap speed',
      'icon': Icons.female_rounded,
    },
    {
      'word': 'Help (Emergency)',
      'reason': 'Fist positioning issue',
      'icon': Icons.medical_services_rounded,
    },
  ];

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
              // Header
              Text(
                'Practice Arena',
                style: GoogleFonts.sora(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
              Text(
                'Strengthen your skills and review progress.',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: AppColors.secondaryText,
                ),
              ),
              const SizedBox(height: 28),

              // Timed Challenges
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'DAILY CHALLENGES',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryText,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const Icon(Icons.arrow_forward_rounded, color: AppColors.secondaryText, size: 16),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: _challenges.map((chal) => _buildChallengeCard(chal)).toList(),
              ),
              const SizedBox(height: 32),

              // Weak Areas Review
              Text(
                'WEAK AREAS TO IMPROVE',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondaryText,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              _buildWeakAreasCard(),
              const SizedBox(height: 32),

              // Performance Insights
              Text(
                'PERFORMANCE ANALYTICS',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondaryText,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              _buildPerformanceCard(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChallengeCard(Map<String, dynamic> chal) {
    final Color color = chal['color'];
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.secondaryBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(chal['icon'], color: color, size: 20),
            ),
            const SizedBox(height: 16),
            Text(
              chal['title'],
              style: GoogleFonts.sora(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              chal['duration'],
              style: GoogleFonts.inter(
                fontSize: 12,
                color: AppColors.secondaryText,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.cardBg,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.border),
              ),
              child: Text(
                chal['xp'],
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: AppColors.rewardAccent,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWeakAreasCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: List.generate(_weakAreas.length, (index) {
          final item = _weakAreas[index];
          final isLast = index == _weakAreas.length - 1;

          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: isLast
                  ? null
                  : const Border(bottom: BorderSide(color: AppColors.border, width: 1)),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: AppColors.cardBg,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Icon(item['icon'], color: AppColors.secondaryAccent, size: 20),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['word'],
                        style: GoogleFonts.sora(
                          fontSize: 14.5,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryText,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item['reason'],
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryAccent.withOpacity(0.15),
                    foregroundColor: AppColors.primaryAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Practice',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildPerformanceCard() {
    // Custom painted metrics & Consistency chart
    final List<double> weeklyData = [0.4, 0.65, 0.5, 0.9, 0.75, 0.82, 0.6];
    final List<String> days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.secondaryBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildMetricItem('Accuracy', '86%', Icons.verified_user_rounded, AppColors.primaryAccent),
              ),
              Container(width: 1, height: 48, color: AppColors.border),
              Expanded(
                child: _buildMetricItem('Speed Index', '2.1s', Icons.flash_on_rounded, AppColors.rewardAccent),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Divider(color: AppColors.border, height: 1),
          ),
          
          // Activity bar indicator
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Weekly Consistency',
                    style: GoogleFonts.sora(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                    ),
                  ),
                  Text(
                    'Goal: 5/7 Days',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(7, (index) {
                  final double progress = weeklyData[index];
                  final String day = days[index];
                  final bool isToday = index == 5; // Saturday mock today

                  return Column(
                    children: [
                      Container(
                        height: 60,
                        width: 12,
                        decoration: BoxDecoration(
                          color: AppColors.border,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 60 * progress,
                          decoration: BoxDecoration(
                            gradient: isToday
                                ? AppColors.goldGradient
                                : AppColors.primaryGradient,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        day,
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                          color: isToday ? AppColors.rewardAccent : AppColors.secondaryText,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMetricItem(String title, String val, IconData icon, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              val,
              style: GoogleFonts.sora(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText,
              ),
            ),
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 11,
                color: AppColors.secondaryText,
              ),
            ),
          ],
        )
      ],
    );
  }
}
