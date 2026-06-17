import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/colors.dart';

class QuizScreen extends StatefulWidget {
  final String lessonTitle;

  const QuizScreen({
    super.key,
    required this.lessonTitle,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with SingleTickerProviderStateMixin {
  int _currentQuestion = 0;
  final int _totalQuestions = 3;
  int? _selectedOptionIndex;
  bool _isAnswerSubmitted = false;
  bool _isAnswerCorrect = false;
  int _xpEarned = 0;

  // Matching game state
  String? _selectedMatchWord;
  String? _selectedMatchGesture;
  Map<String, String> _completedMatches = {};

  final List<String> _matchingWords = ['Hello', 'Thank You', 'Yes', 'No'];
  final List<String> _matchingGestures = ['Flat hand moving away from chin', 'Waving hand gesture', 'Thumb down / shaking fist', 'Fist moving up and down'];
  final Map<String, String> _correctMatches = {
    'Hello': 'Waving hand gesture',
    'Thank You': 'Flat hand moving away from chin',
    'Yes': 'Fist moving up and down',
    'No': 'Thumb down / shaking fist',
  };

  late AnimationController _celebrationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _celebrationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _scaleAnimation = CurvedAnimation(
      parent: _celebrationController,
      curve: Curves.elasticOut,
    );
  }

  @override
  void dispose() {
    _celebrationController.dispose();
    super.dispose();
  }

  void _checkAnswer() {
    if (_isAnswerSubmitted) return;

    setState(() {
      _isAnswerSubmitted = true;
      if (_currentQuestion == 0) {
        // Multiple choice 1
        _isAnswerCorrect = _selectedOptionIndex == 0; // "Hello" is at index 0
        if (_isAnswerCorrect) _xpEarned += 15;
      } else if (_currentQuestion == 1) {
        // Matching Game
        _isAnswerCorrect = _completedMatches.length == 4;
        if (_isAnswerCorrect) _xpEarned += 15;
      } else if (_currentQuestion == 2) {
        // Multiple choice 2
        _isAnswerCorrect = _selectedOptionIndex == 1; // "Thumb folded across fingers"
        if (_isAnswerCorrect) {
          _xpEarned += 15;
          _celebrationController.forward();
        }
      }
    });
  }

  void _nextQuestion() {
    if (_currentQuestion < _totalQuestions - 1) {
      setState(() {
        _currentQuestion++;
        _selectedOptionIndex = null;
        _isAnswerSubmitted = false;
        _isAnswerCorrect = false;
      });
    } else {
      // Completed last question, show celebration screen
      setState(() {
        _currentQuestion = 3; // Special index for results screen
      });
      _celebrationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_currentQuestion == 3) {
      return _buildCelebrationScreen();
    }

    final double progress = (_currentQuestion + 1) / _totalQuestions;

    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded, color: AppColors.primaryText),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: AppColors.border,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primaryAccent),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text(
                '⚡ $_xpEarned XP',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  color: AppColors.rewardAccent,
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 100.0), // Extra bottom padding for status bar
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                // Question text
                Text(
                  _getQuestionTitle(),
                  style: GoogleFonts.sora(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryText,
                  ),
                ),
                const SizedBox(height: 24),

                // Question contents
                Expanded(
                  child: SingleChildScrollView(
                    child: _buildQuestionContent(),
                  ),
                ),
              ],
            ),
          ),

          // Bottom feedback/action overlay sheet
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomStatusBar(),
          ),
        ],
      ),
    );
  }

  String _getQuestionTitle() {
    switch (_currentQuestion) {
      case 0:
        return 'What is the meaning of this hand gesture?';
      case 1:
        return 'Match the ISL signs to their correct meanings:';
      case 2:
        return 'How is the letter "S" represented in Indian Sign Language?';
      default:
        return '';
    }
  }

  Widget _buildQuestionContent() {
    if (_currentQuestion == 0) {
      // Q1: MCQ with Illustration
      final List<String> options = ['Hello', 'Thank You', 'Yes', 'Help'];
      return Column(
        children: [
          // Illustration of Hello sign (flat waving hand)
          Container(
            height: 160,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: AppColors.secondaryBg,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.border),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.waving_hand_rounded, size: 60, color: AppColors.primaryAccent),
                  const SizedBox(height: 12),
                  Text(
                    '[Animated Waving Motion]',
                    style: GoogleFonts.inter(fontSize: 12, color: AppColors.secondaryText),
                  ),
                ],
              ),
            ),
          ),

          // Options list
          ...List.generate(options.length, (index) {
            final option = options[index];
            final isSelected = _selectedOptionIndex == index;
            return _buildOptionTile(
              index: index,
              label: option,
              isSelected: isSelected,
              onTap: () {
                if (_isAnswerSubmitted) return;
                setState(() {
                  _selectedOptionIndex = index;
                });
              },
            );
          }),
        ],
      );
    } else if (_currentQuestion == 1) {
      // Q2: Matching game layout
      return Column(
        children: [
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column: Words
              Expanded(
                child: Column(
                  children: _matchingWords.map((word) {
                    final bool isMatched = _completedMatches.containsKey(word);
                    final bool isSelected = _selectedMatchWord == word;

                    return GestureDetector(
                      onTap: () {
                        if (_isAnswerSubmitted || isMatched) return;
                        setState(() {
                          _selectedMatchWord = word;
                          _attemptMatch();
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                        decoration: BoxDecoration(
                          color: isMatched
                              ? AppColors.primaryAccent.withOpacity(0.15)
                              : (isSelected ? AppColors.secondaryAccent.withOpacity(0.2) : AppColors.secondaryBg),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isMatched
                                ? AppColors.primaryAccent
                                : (isSelected ? AppColors.secondaryAccent : AppColors.border),
                            width: (isSelected || isMatched) ? 2 : 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            word,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              color: isMatched ? AppColors.primaryAccent : AppColors.primaryText,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(width: 16),
              // Right Column: Gestures
              Expanded(
                child: Column(
                  children: _matchingGestures.map((gesture) {
                    final bool isMatched = _completedMatches.containsValue(gesture);
                    final bool isSelected = _selectedMatchGesture == gesture;

                    return GestureDetector(
                      onTap: () {
                        if (_isAnswerSubmitted || isMatched) return;
                        setState(() {
                          _selectedMatchGesture = gesture;
                          _attemptMatch();
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isMatched
                              ? AppColors.primaryAccent.withOpacity(0.15)
                              : (isSelected ? AppColors.secondaryAccent.withOpacity(0.2) : AppColors.secondaryBg),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isMatched
                                ? AppColors.primaryAccent
                                : (isSelected ? AppColors.secondaryAccent : AppColors.border),
                            width: (isSelected || isMatched) ? 2 : 1,
                          ),
                        ),
                        child: Text(
                          gesture,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            color: isMatched ? AppColors.primaryAccent : AppColors.primaryText,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          if (_completedMatches.length < 4)
            Text(
              'Match all 4 pairs to proceed.',
              style: GoogleFonts.inter(fontSize: 13, color: AppColors.secondaryText),
              textAlign: TextAlign.center,
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.check_circle_rounded, color: AppColors.primaryAccent),
                const SizedBox(width: 8),
                Text(
                  'All pairs matched successfully!',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryAccent,
                    fontSize: 14,
                  ),
                )
              ],
            )
        ],
      );
    } else {
      // Q3: MCQ 2 (ISL 'S' Representation)
      final List<String> options = [
        'Open hand with fingers flat, wrist pulsing',
        'Fist closed with thumb wrapped across front',
        'Fingers forming a hollow circular loop',
        'Two fingers crossed in a bridge pattern'
      ];
      return Column(
        children: [
          // Visual hint
          Container(
            height: 120,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: AppColors.secondaryBg,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.border),
            ),
            child: const Center(
              child: Icon(Icons.gesture_rounded, size: 48, color: AppColors.secondaryAccent),
            ),
          ),
          
          ...List.generate(options.length, (index) {
            final option = options[index];
            final isSelected = _selectedOptionIndex == index;
            return _buildOptionTile(
              index: index,
              label: option,
              isSelected: isSelected,
              onTap: () {
                if (_isAnswerSubmitted) return;
                setState(() {
                  _selectedOptionIndex = index;
                });
              },
            );
          }),
        ],
      );
    }
  }

  void _attemptMatch() {
    if (_selectedMatchWord != null && _selectedMatchGesture != null) {
      if (_correctMatches[_selectedMatchWord] == _selectedMatchGesture) {
        setState(() {
          _completedMatches[_selectedMatchWord!] = _selectedMatchGesture!;
          _selectedMatchWord = null;
          _selectedMatchGesture = null;
        });
      } else {
        // Reset selections on mismatch
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Mismatch! Try matching another pair.'),
            duration: Duration(milliseconds: 800),
            backgroundColor: AppColors.error,
          ),
        );
        setState(() {
          _selectedMatchWord = null;
          _selectedMatchGesture = null;
        });
      }
    }
  }

  Widget _buildOptionTile({
    required int index,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    Color tileBorderColor = AppColors.border;
    Color tileBgColor = AppColors.secondaryBg;
    if (isSelected) {
      tileBorderColor = AppColors.primaryAccent;
      tileBgColor = AppColors.primaryAccent.withOpacity(0.1);
    }

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: tileBgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: tileBorderColor, width: isSelected ? 2 : 1),
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primaryAccent : AppColors.secondaryText,
                  width: 2,
                ),
                color: isSelected ? AppColors.primaryAccent : Colors.transparent,
              ),
              alignment: Alignment.center,
              child: isSelected
                  ? const Icon(Icons.check, size: 14, color: AppColors.primaryBg)
                  : Text(
                      '${index + 1}',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        color: AppColors.secondaryText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: AppColors.primaryText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomStatusBar() {
    // If not submitted yet
    if (!_isAnswerSubmitted) {
      final bool canSubmit = (_currentQuestion == 1)
          ? _completedMatches.length == 4
          : _selectedOptionIndex != null;

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        color: AppColors.secondaryBg,
        child: SafeArea(
          top: false,
          child: ElevatedButton(
            onPressed: canSubmit ? _checkAnswer : null,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 18),
              backgroundColor: AppColors.primaryAccent,
              disabledBackgroundColor: AppColors.border,
            ),
            child: Text(
              'Check Answer',
              style: GoogleFonts.inter(
                color: canSubmit ? AppColors.primaryBg : AppColors.secondaryText,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    }

    // Answer has been submitted, show feedback colors
    final Color barColor = _isAnswerCorrect ? const Color(0xFF1B3B2B) : const Color(0xFF4C1E1B);
    final Color textColor = _isAnswerCorrect ? AppColors.primaryAccent : AppColors.error;
    final IconData statusIcon = _isAnswerCorrect ? Icons.check_circle_rounded : Icons.cancel_rounded;
    final String statusText = _isAnswerCorrect ? 'Excellent! Perfect Match' : 'Incorrect Response';
    final String feedbackSub = _isAnswerCorrect ? '+15 XP Awarded' : _getFeedbackMessage();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      color: barColor,
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(statusIcon, color: textColor, size: 28),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      statusText,
                      style: GoogleFonts.sora(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      feedbackSub,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: textColor.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _nextQuestion,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: textColor,
                foregroundColor: Colors.white,
              ),
              child: Text(
                'Continue',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getFeedbackMessage() {
    if (_currentQuestion == 0) {
      return 'The correct sign was "Hello"';
    } else if (_currentQuestion == 2) {
      return 'The correct sign is "Fist closed with thumb wrapped across front"';
    }
    return '';
  }

  Widget _buildCelebrationScreen() {
    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      body: Stack(
        children: [
          // Background particles simulated
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 1.0,
                  colors: [
                    AppColors.secondaryAccent.withOpacity(0.1),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(),
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: Center(
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.rewardAccent.withOpacity(0.15),
                          border: Border.all(color: AppColors.rewardAccent, width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.rewardAccent.withOpacity(0.2),
                              blurRadius: 24,
                            )
                          ]
                        ),
                        child: const Icon(
                          Icons.emoji_events_rounded,
                          color: AppColors.rewardAccent,
                          size: 72,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),
                  Text(
                    'Lesson Completed!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'You are bridging communication barriers, one sign at a time.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: AppColors.secondaryText,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 48),
                  
                  // Score / Stats summary
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryBg,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.border),
                          ),
                          child: Column(
                            children: [
                              Text(
                                '+45',
                                style: GoogleFonts.sora(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryAccent,
                                ),
                              ),
                              Text(
                                'XP GAINED',
                                style: GoogleFonts.inter(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.secondaryText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryBg,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.border),
                          ),
                          child: Column(
                            children: [
                              Text(
                                '100%',
                                style: GoogleFonts.sora(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.rewardAccent,
                                ),
                              ),
                              Text(
                                'ACCURACY',
                                style: GoogleFonts.inter(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.secondaryText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Back to Dashboard
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      backgroundColor: AppColors.primaryAccent,
                      shadowColor: AppColors.primaryAccent.withOpacity(0.3),
                      elevation: 8,
                    ),
                    child: Text(
                      'Finish & Collect Rewards',
                      style: GoogleFonts.inter(
                        color: AppColors.primaryBg,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
