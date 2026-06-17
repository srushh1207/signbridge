import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/colors.dart';
import '../providers/language_provider.dart';
import 'onboarding_screen.dart';

class LanguageSelectScreen extends StatefulWidget {
  final LanguageProvider languageProvider;

  const LanguageSelectScreen({super.key, required this.languageProvider});

  @override
  State<LanguageSelectScreen> createState() => _LanguageSelectScreenState();
}

class _LanguageSelectScreenState extends State<LanguageSelectScreen>
    with SingleTickerProviderStateMixin {
  String _selected = 'en';
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(parent: _fadeController, curve: Curves.easeOut);
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  void _onContinue() {
    widget.languageProvider.setLanguage(_selected);
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => OnboardingScreen(
          languageProvider: widget.languageProvider,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 24.0),
            child: Column(
              children: [
                const Spacer(flex: 2),

                // Globe/Language Icon
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.primaryAccent.withAlpha(40),
                        AppColors.secondaryAccent.withAlpha(20),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.cardBg,
                      border: Border.all(color: AppColors.border, width: 2),
                    ),
                    child: const Icon(
                      Icons.translate_rounded,
                      size: 36,
                      color: AppColors.primaryAccent,
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Title
                Text(
                  'Choose Your Language',
                  style: GoogleFonts.sora(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryText,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Text(
                  'अपनी भाषा चुनें',
                  style: GoogleFonts.notoSansDevanagari(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryText,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  'Learn ISL in the language you\'re most comfortable with.',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: AppColors.secondaryText,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),

                const Spacer(flex: 1),

                // Language options
                _buildLanguageOption(
                  code: 'en',
                  title: 'English',
                  subtitle: 'Learn ISL with English instructions',
                  flag: '🇬🇧',
                ),
                const SizedBox(height: 16),
                _buildLanguageOption(
                  code: 'hi',
                  title: 'हिन्दी',
                  subtitle: 'हिन्दी निर्देशों के साथ ISL सीखें',
                  flag: '🇮🇳',
                ),

                const Spacer(flex: 2),

                // Continue Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _onContinue,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      backgroundColor: AppColors.primaryAccent,
                      shadowColor: AppColors.primaryAccent.withAlpha(80),
                      elevation: 8,
                    ),
                    child: Text(
                      _selected == 'en' ? 'Continue' : 'जारी रखें',
                      style: GoogleFonts.inter(
                        color: AppColors.primaryBg,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageOption({
    required String code,
    required String title,
    required String subtitle,
    required String flag,
  }) {
    final bool isSelected = _selected == code;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = code;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryAccent.withAlpha(25)
              : AppColors.secondaryBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primaryAccent : AppColors.border,
            width: isSelected ? 2.5 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primaryAccent.withAlpha(30),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  )
                ]
              : null,
        ),
        child: Row(
          children: [
            Text(flag, style: const TextStyle(fontSize: 32)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: (code == 'hi'
                            ? GoogleFonts.notoSansDevanagari(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )
                            : GoogleFonts.sora(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ))
                        .copyWith(
                      color: isSelected
                          ? AppColors.primaryAccent
                          : AppColors.primaryText,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.primaryAccent : Colors.transparent,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primaryAccent
                      : AppColors.secondaryText,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check_rounded, size: 16, color: AppColors.primaryBg)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
