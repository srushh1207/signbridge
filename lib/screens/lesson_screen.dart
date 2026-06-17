import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/colors.dart';
import 'quiz_screen.dart';

class LessonScreen extends StatefulWidget {
  final String lessonTitle;
  final String lessonDesc;

  const LessonScreen({
    super.key,
    required this.lessonTitle,
    required this.lessonDesc,
  });

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  int _currentStep = 0;
  final int _totalSteps = 3;

  final List<Map<String, dynamic>> _stepsData = [
    {
      'concept': 'Basic Pose',
      'instruction': 'Extend your palm outwards with fingers aligned. Keep your wrist neutral and relaxed.',
      'action': 'Observe the initial pose representation.'
    },
    {
      'concept': 'Motion Flow',
      'instruction': 'Slowly sweep your hand outwards in a slight arc from the shoulder height.',
      'action': 'Move your forearm steadily, maintaining finger alignment.'
    },
    {
      'concept': 'Completion',
      'instruction': 'Briefly pause the hand and curl the thumb slightly across the palm base.',
      'action': 'Hold for 1 second to complete the communication bridge.'
    }
  ];

  void _onNextStep() {
    if (_currentStep < _totalSteps - 1) {
      setState(() {
        _currentStep++;
      });
    } else {
      // Go to Quiz Screen
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => QuizScreen(
            lessonTitle: widget.lessonTitle,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double stepProgress = (_currentStep + 1) / _totalSteps;

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
            value: stepProgress,
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
                '${_currentStep + 1}/$_totalSteps',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondaryText,
                  fontSize: 13,
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Info
            Text(
              widget.lessonTitle,
              style: GoogleFonts.sora(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.lessonDesc,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: AppColors.secondaryText,
              ),
            ),
            const SizedBox(height: 24),
            
            // Video / Gesture Showcase Area
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.secondaryBg,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.border),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Radial background indicator
                      Container(
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            colors: [
                              AppColors.secondaryAccent.withOpacity(0.15),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                      
                      // Gesture demonstration illustration
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomPaint(
                            size: const Size(160, 160),
                            painter: _LessonGesturePainter(step: _currentStep),
                          ),
                          const SizedBox(height: 24),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: AppColors.cardBg,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColors.border),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.videocam_rounded, color: AppColors.primaryAccent, size: 16),
                                const SizedBox(width: 8),
                                Text(
                                  '3D Interactive View',
                                  style: GoogleFonts.inter(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryText,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Step instruction description
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.cardBg,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'STEP ${_currentStep + 1}: ${_stepsData[_currentStep]['concept']}',
                    style: GoogleFonts.sora(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryAccent,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _stepsData[_currentStep]['instruction'],
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      color: AppColors.primaryText,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.info_outline_rounded, size: 16, color: AppColors.secondaryText),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _stepsData[_currentStep]['action'],
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: AppColors.secondaryText,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Bottom Action
            ElevatedButton(
              onPressed: _onNextStep,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 18),
                backgroundColor: AppColors.primaryAccent,
              ),
              child: Text(
                _currentStep == _totalSteps - 1 ? 'Start Practice Quiz' : 'Next Step',
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
    );
  }
}

class _LessonGesturePainter extends CustomPainter {
  final int step;

  _LessonGesturePainter({required this.step});

  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    final Paint mainPaint = Paint()
      ..color = AppColors.primaryAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.05
      ..strokeCap = StrokeCap.round;

    final Paint secondaryPaint = Paint()
      ..color = AppColors.secondaryAccent.withOpacity(0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.035
      ..strokeCap = StrokeCap.round;

    // Draw varying hands depending on step
    if (step == 0) {
      // Step 1: Flat pose hand
      // Wrist
      canvas.drawLine(Offset(w * 0.5, h * 0.9), Offset(w * 0.5, h * 0.7), mainPaint);
      // Palm Outline
      canvas.drawCircle(Offset(w * 0.5, h * 0.5), w * 0.2, mainPaint);
      // Fingers pointing straight up
      canvas.drawLine(Offset(w * 0.4, h * 0.45), Offset(w * 0.4, h * 0.15), secondaryPaint);
      canvas.drawLine(Offset(w * 0.47, h * 0.43), Offset(w * 0.47, h * 0.1), secondaryPaint);
      canvas.drawLine(Offset(w * 0.53, h * 0.43), Offset(w * 0.53, h * 0.1), secondaryPaint);
      canvas.drawLine(Offset(w * 0.6, h * 0.45), Offset(w * 0.6, h * 0.15), secondaryPaint);
      // Thumb out
      canvas.drawLine(Offset(w * 0.35, h * 0.55), Offset(w * 0.2, h * 0.45), secondaryPaint);
    } else if (step == 1) {
      // Step 2: Swoosh lines showing flow movement
      // Radial motion ripples behind
      final Paint ripplePaint = Paint()
        ..color = AppColors.secondaryAccent.withOpacity(0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3;
      canvas.drawArc(
        Rect.fromLTWH(w * 0.1, h * 0.25, w * 0.8, h * 0.5),
        -1.0, 2.0, false, ripplePaint,
      );

      // Hand shifted to the side
      canvas.drawLine(Offset(w * 0.6, h * 0.85), Offset(w * 0.6, h * 0.65), mainPaint);
      canvas.drawCircle(Offset(w * 0.6, h * 0.48), w * 0.18, mainPaint);
      // Fingers sweeping diagonally
      canvas.drawLine(Offset(w * 0.52, h * 0.43), Offset(w * 0.58, h * 0.18), secondaryPaint);
      canvas.drawLine(Offset(w * 0.58, h * 0.41), Offset(w * 0.65, h * 0.14), secondaryPaint);
      canvas.drawLine(Offset(w * 0.64, h * 0.41), Offset(w * 0.72, h * 0.15), secondaryPaint);
      canvas.drawLine(Offset(w * 0.70, h * 0.43), Offset(w * 0.78, h * 0.20), secondaryPaint);
    } else {
      // Step 3: Finished gesture with locked fingers
      // Pulse ring
      final Paint pulsePaint = Paint()
        ..color = AppColors.rewardAccent.withOpacity(0.5)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
      canvas.drawCircle(Offset(w * 0.5, h * 0.5), w * 0.45, pulsePaint);

      // Compact fist
      canvas.drawLine(Offset(w * 0.5, h * 0.9), Offset(w * 0.5, h * 0.75), mainPaint);
      canvas.drawCircle(Offset(w * 0.5, h * 0.55), w * 0.22, mainPaint);
      // Closed/Tucked finger loops
      canvas.drawArc(
        Rect.fromLTWH(w * 0.38, h * 0.42, w * 0.24, h * 0.16),
        -math.pi, math.pi, false, secondaryPaint,
      );
      // Thumb wrapped across
      canvas.drawLine(Offset(w * 0.32, h * 0.62), Offset(w * 0.62, h * 0.52), mainPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _LessonGesturePainter oldDelegate) {
    return oldDelegate.step != step;
  }
}
