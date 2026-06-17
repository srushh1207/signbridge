import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/colors.dart';
import 'lesson_screen.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  int _streak = 7;
  int _xp = 420;
  double _dailyGoalProgress = 0.75; // 15 out of 20 mins

  final List<Map<String, dynamic>> _lessons = [
    {
      'title': 'ISL Basics & Hands',
      'description': 'Understand how hand gestures form letters and shapes in ISL.',
      'type': 'completed',
      'icon': Icons.back_hand_rounded,
      'offset': 0.0, // center
    },
    {
      'title': 'Alphabets A - J',
      'description': 'Learn your first set of ISL alphabets through visual matching.',
      'type': 'completed',
      'icon': Icons.abc_rounded,
      'offset': -0.4, // left
    },
    {
      'title': 'Alphabets K - T',
      'description': 'Continue building your spelling foundation in sign language.',
      'type': 'active',
      'icon': Icons.font_download_rounded,
      'offset': -0.2, // mid-left
    },
    {
      'title': 'Greetings & Phrases',
      'description': 'Learn how to sign Hello, Thank You, and Nice to meet you.',
      'type': 'locked',
      'icon': Icons.waving_hand_rounded,
      'offset': 0.2, // mid-right
    },
    {
      'title': 'Numbers & Dates',
      'description': 'Express numbers, time, and basic mathematical values.',
      'type': 'locked',
      'icon': Icons.pin_rounded,
      'offset': 0.4, // right
    },
    {
      'title': 'Family & Relatives',
      'description': 'Sign about mothers, fathers, siblings, and friends.',
      'type': 'locked',
      'icon': Icons.people_rounded,
      'offset': 0.0, // center
    },
    {
      'title': 'Emergency Signs',
      'description': 'Learn critical life-saving signs for emergency assistance.',
      'type': 'locked',
      'icon': Icons.emergency_rounded,
      'offset': -0.3, // left
    },
  ];

  void _startLesson(Map<String, dynamic> lesson) {
    if (lesson['type'] == 'locked') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Complete preceding lessons to unlock "${lesson['title']}"',
            style: GoogleFonts.inter(color: Colors.white),
          ),
          backgroundColor: AppColors.secondaryAccent,
          duration: const Duration(seconds: 2),
        ),
      );
      return;
    }
    
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => LessonScreen(
          lessonTitle: lesson['title'],
          lessonDesc: lesson['description'],
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic),
            ),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      body: SafeArea(
        child: Column(
          children: [
            // Top Stats Bar
            _buildStatsBar(),
            const Divider(color: AppColors.border, height: 1),
            
            // Main Content Area
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Daily Goal Card
                    _buildDailyGoalCard(),
                    const SizedBox(height: 24),
                    
                    // Motivational Banner
                    _buildMotivationalBanner(),
                    const SizedBox(height: 36),
                    
                    // Lesson Tree Title
                    Text(
                      'YOUR LEARNING PATH',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryText,
                        letterSpacing: 2.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    
                    // Interactive Curved Lesson Tree
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _lessons.length,
                      itemBuilder: (context, index) {
                        final lesson = _lessons[index];
                        return _buildLessonNode(lesson, index);
                      },
                    ),
                    const SizedBox(height: 48),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // User Level & Avatar info
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '2',
                  style: GoogleFonts.sora(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBg,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Level 2',
                    style: GoogleFonts.sora(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                    ),
                  ),
                  Text(
                    'Conversationalist',
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              )
            ],
          ),
          
          // Streak and XP badges
          Row(
            children: [
              // Streak
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.secondaryBg,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.local_fire_department_rounded, color: AppColors.rewardAccent, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '$_streak Days',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryText,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // XP
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.secondaryBg,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.offline_bolt_rounded, color: AppColors.primaryAccent, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '$_xp XP',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDailyGoalCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.secondaryBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Daily Learning Goal',
                style: GoogleFonts.sora(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
              Text(
                '15 / 20 Min',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryAccent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: _dailyGoalProgress,
              minHeight: 8,
              backgroundColor: AppColors.border,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primaryAccent),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              const Icon(Icons.star_rounded, color: AppColors.rewardAccent, size: 16),
              const SizedBox(width: 6),
              Text(
                'Complete 5 more minutes to keep streak alive!',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: AppColors.secondaryText,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMotivationalBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.secondaryAccent.withOpacity(0.12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.secondaryAccent.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.lightbulb_outline_rounded, color: AppColors.secondaryAccent, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              '"Every sign builds a bridge to a more connected and inclusive world."',
              style: GoogleFonts.inter(
                fontSize: 12.5,
                fontStyle: FontStyle.italic,
                color: AppColors.primaryText.withOpacity(0.9),
                height: 1.4,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLessonNode(Map<String, dynamic> lesson, int index) {
    final double offset = lesson['offset'];
    final String type = lesson['type'];
    final bool isActive = type == 'active';
    final bool isCompleted = type == 'completed';
    final bool isLocked = type == 'locked';

    // Color coordination based on status
    Color nodeColor;
    Color iconColor;
    Color borderGlow;
    if (isCompleted) {
      nodeColor = AppColors.primaryAccent;
      iconColor = AppColors.primaryBg;
      borderGlow = AppColors.primaryAccent.withOpacity(0.3);
    } else if (isActive) {
      nodeColor = AppColors.secondaryAccent;
      iconColor = Colors.white;
      borderGlow = AppColors.secondaryAccent.withOpacity(0.6);
    } else {
      nodeColor = AppColors.cardBg;
      iconColor = AppColors.secondaryText;
      borderGlow = Colors.transparent;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Align(
        alignment: Alignment(offset, 0.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => _startLesson(lesson),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Outer Glow for active node
                  if (isActive)
                    Container(
                      width: 86,
                      height: 86,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: borderGlow,
                            blurRadius: 18,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                    ),
                  
                  // Active/Completed node border
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: nodeColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isActive ? Colors.white : AppColors.border,
                        width: isActive ? 3.0 : 1.5,
                      ),
                      boxShadow: [
                        if (isCompleted)
                          BoxShadow(
                            color: borderGlow,
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          )
                      ]
                    ),
                    child: Icon(
                      isLocked ? Icons.lock_rounded : lesson['icon'],
                      color: iconColor,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Title
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: isLocked ? Colors.transparent : AppColors.cardBg,
                borderRadius: BorderRadius.circular(8),
                border: isLocked ? null : Border.all(color: AppColors.border),
              ),
              child: Text(
                lesson['title'],
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isLocked ? AppColors.secondaryText.withOpacity(0.6) : AppColors.primaryText,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
