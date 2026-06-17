import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/colors.dart';
import 'auth_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  String _selectedGoal = '10 Min'; // Default goal

  final List<Map<String, String>> _onboardingData = [
    {
      'title': 'Learn Indian Sign Language',
      'subtitle': 'Master ISL through bite-sized, interactive lessons designed to feel like games.',
    },
    {
      'title': 'Bridge the Communication Gap',
      'subtitle': 'Develop inclusive skills and connect with the Deaf and Hard of Hearing community.',
    },
    {
      'title': 'Set Your Learning Goal',
      'subtitle': 'Pick a daily target that fits your schedule. You can adjust this anytime in settings.',
    },
  ];

  void _onNext() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    } else {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const AuthScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 600),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          // Using LayoutBuilder to handle smaller screen heights gracefully
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top Bar: Skip button and Page indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(3, (index) => _buildIndicator(index)),
                  ),
                  _currentPage < 2
                      ? TextButton(
                          onPressed: () {
                            _pageController.animateToPage(
                              2,
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.easeInOutCubic,
                            );
                          },
                          child: Text(
                            'Skip',
                            style: GoogleFonts.inter(
                              color: AppColors.secondaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : const SizedBox(height: 48),
                ],
              ),
              
              // Onboarding Content
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Illustration Placeholder (Custom Painted/Stylized shapes)
                        Expanded(
                          child: Center(
                            child: _buildIllustration(index),
                          ),
                        ),
                        
                        // Texts
                        Text(
                          _onboardingData[index]['title']!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sora(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryText,
                            height: 1.25,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _onboardingData[index]['subtitle']!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            color: AppColors.secondaryText,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        // Unique layout for goal selection in page 3
                        if (index == 2) _buildGoalSelector(),
                      ],
                    );
                  },
                ),
              ),
              
              // Bottom Action Button
              ElevatedButton(
                onPressed: _onNext,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  backgroundColor: AppColors.primaryAccent,
                  shadowColor: AppColors.primaryAccent.withOpacity(0.3),
                  elevation: 8,
                ),
                child: Text(
                  _currentPage == 2 ? 'Get Started' : 'Next',
                  style: GoogleFonts.inter(
                    color: AppColors.primaryBg,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIndicator(int index) {
    final bool isActive = index == _currentPage;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 6.0),
      height: 6.0,
      width: isActive ? 24.0 : 6.0,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryAccent : AppColors.border,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  Widget _buildIllustration(int index) {
    if (index == 0) {
      // Screen 1: Learning Cards Illustration
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.secondaryBg,
              border: Border.all(color: AppColors.border),
            ),
          ),
          // A floating card representing a card with hand gesture drawing
          Positioned(
            top: 40,
            left: 20,
            child: _buildFloatingCard(
              icon: Icons.waving_hand_rounded,
              color: AppColors.primaryAccent,
              label: 'Hello',
              angle: -0.15,
            ),
          ),
          Positioned(
            bottom: 30,
            right: 10,
            child: _buildFloatingCard(
              icon: Icons.favorite_rounded,
              color: AppColors.secondaryAccent,
              label: 'Love',
              angle: 0.1,
            ),
          ),
          Positioned(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.cardBg,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryAccent.withOpacity(0.2),
                    blurRadius: 24,
                  )
                ]
              ),
              child: const Icon(
                Icons.menu_book_rounded,
                size: 64,
                color: AppColors.primaryAccent,
              ),
            ),
          )
        ],
      );
    } else if (index == 1) {
      // Screen 2: Connection / Bridge Illustration
      return Stack(
        alignment: Alignment.center,
        children: [
          // Radial concentric waves
          ...List.generate(3, (idx) {
            final double scale = 1.0 + (idx * 0.3);
            return Opacity(
              opacity: 0.5 - (idx * 0.15),
              child: Container(
                width: 140 * scale,
                height: 140 * scale,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.secondaryAccent, width: 1.5),
                ),
              ),
            );
          }),
          // Two hands bridging connection
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: AppColors.cardBg,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.front_hand_rounded, size: 40, color: AppColors.primaryAccent),
              ),
              Container(
                width: 60,
                height: 4,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: AppColors.cardBg,
                  shape: BoxShape.circle,
                ),
                child: Transform.flip(
                  flipX: true,
                  child: const Icon(Icons.front_hand_rounded, size: 40, color: AppColors.secondaryAccent),
                ),
              ),
            ],
          )
        ],
      );
    } else {
      // Screen 3: Time / Goal Illustration
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.secondaryBg,
              border: Border.all(color: AppColors.border),
            ),
          ),
          // XP Coin Floating
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: AppColors.cardBg,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.offline_bolt_rounded, color: AppColors.rewardAccent, size: 32),
            ),
          ),
          // Clock Visual
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.border, width: 6),
              gradient: RadialGradient(
                colors: [AppColors.cardBg, AppColors.secondaryBg],
              ),
            ),
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Hands of clock
                Transform.rotate(
                  angle: 0.8,
                  child: Container(
                    width: 4,
                    height: 40,
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 4,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppColors.primaryAccent,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: 2.2,
                  child: Container(
                    width: 4,
                    height: 50,
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 4,
                      height: 32,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryText,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(color: AppColors.primaryText, shape: BoxShape.circle),
                )
              ],
            ),
          ),
        ],
      );
    }
  }

  Widget _buildFloatingCard({required IconData icon, required Color color, required String label, required double angle}) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ]
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGoalSelector() {
    final List<String> goals = ['5 Min', '10 Min', '15 Min', '20 Min'];
    final List<String> subtitles = ['Casual', 'Regular', 'Serious', 'Intense'];

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(4, (index) {
          final String goal = goals[index];
          final String sub = subtitles[index];
          final bool isSelected = _selectedGoal == goal;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedGoal = goal;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryAccent.withOpacity(0.1) : AppColors.secondaryBg,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected ? AppColors.primaryAccent : AppColors.border,
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      goal.split(' ')[0],
                      style: GoogleFonts.sora(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? AppColors.primaryAccent : AppColors.primaryText,
                      ),
                    ),
                    Text(
                      'min/day',
                      style: GoogleFonts.inter(
                        fontSize: 9,
                        color: AppColors.secondaryText,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      sub,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                        color: isSelected ? AppColors.primaryText : AppColors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
