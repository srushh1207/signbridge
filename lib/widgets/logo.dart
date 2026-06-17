import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class SignBridgeLogo extends StatefulWidget {
  final double size;
  final bool animate;
  final VoidCallback? onAnimationComplete;

  const SignBridgeLogo({
    super.key,
    this.size = 180,
    this.animate = true,
    this.onAnimationComplete,
  });

  @override
  State<SignBridgeLogo> createState() => _SignBridgeLogoState();
}

class _SignBridgeLogoState extends State<SignBridgeLogo>
    with TickerProviderStateMixin {
  late AnimationController _drawController;
  late AnimationController _glowController;
  late AnimationController _shiftController;

  late Animation<double> _drawAnimation;
  late Animation<double> _glowAnimation;
  late Animation<double> _shiftAnimation;

  @override
  void initState() {
    super.initState();

    _drawController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _shiftController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _drawAnimation = CurvedAnimation(
      parent: _drawController,
      curve: Curves.easeInOutCubic,
    );

    _shiftAnimation = CurvedAnimation(
      parent: _shiftController,
      curve: Curves.elasticOut,
    );

    _glowAnimation = CurvedAnimation(
      parent: _glowController,
      curve: Curves.easeInOutSine,
    );

    if (widget.animate) {
      _startAnimationSequence();
    } else {
      _drawController.value = 1.0;
      _glowController.value = 1.0;
      _shiftController.value = 1.0;
    }
  }

  void _startAnimationSequence() async {
    // 1. Draw hand outline
    await _drawController.forward();
    
    // 2. Fingers move subtly
    await _shiftController.forward();
    
    // 3. Glow pulses infinitely
    _glowController.repeat(reverse: true);
    
    if (widget.onAnimationComplete != null) {
      widget.onAnimationComplete!();
    }
  }

  @override
  void dispose() {
    _drawController.dispose();
    _shiftController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_drawController, _shiftController, _glowController]),
      builder: (context, child) {
        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Radial Glow Background
              Opacity(
                opacity: _glowAnimation.value * 0.4 * _drawAnimation.value,
                child: Container(
                  width: widget.size * 0.85,
                  height: widget.size * 0.85,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.primaryAccent.withOpacity(0.4),
                        AppColors.secondaryAccent.withOpacity(0.15),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              ),
              // Main Hand S-Gesture Custom Paint
              CustomPaint(
                size: Size(widget.size, widget.size),
                painter: _LogoPainter(
                  drawProgress: _drawAnimation.value,
                  fingerShift: _shiftAnimation.value,
                  glowIntensity: _glowAnimation.value,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _LogoPainter extends CustomPainter {
  final double drawProgress;
  final double fingerShift;
  final double glowIntensity;

  _LogoPainter({
    required this.drawProgress,
    required this.fingerShift,
    required this.glowIntensity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    // Define core points relative to canvas size
    // We design the path to look like a hand folded into an 'S' shape gesture.
    // Flow of 'S' outline:
    // Wrist (bottom right) -> curves left to bottom loop -> curves up to knuckles -> curves left to top loop -> curves down
    
    final Paint outlinePaint = Paint()
      ..color = AppColors.primaryAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.045
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final Paint innerPaint = Paint()
      ..color = AppColors.secondaryAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.035
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Outer hand outline tracing the "S" shape
    final Path handOutline = Path();
    // Start at bottom right (wrist)
    handOutline.moveTo(w * 0.65, h * 0.85);
    // Bottom curve of S (wrist to palm base)
    handOutline.cubicTo(
      w * 0.45, h * 0.95,
      w * 0.25, h * 0.80,
      w * 0.25, h * 0.65,
    );
    // Up pinky edge
    handOutline.lineTo(w * 0.25, h * 0.45);
    // Top curve of S (pinky knuckle to top fold)
    handOutline.cubicTo(
      w * 0.25, h * 0.20,
      w * 0.65, h * 0.15,
      w * 0.75, h * 0.30,
    );
    // Index finger outer curve
    handOutline.cubicTo(
      w * 0.82, h * 0.40,
      w * 0.70, h * 0.55,
      w * 0.55, h * 0.55,
    );

    // Inner folded fingers lines (shifting slightly as fingerShift advances)
    final double shiftOffset = fingerShift * (w * 0.03);
    
    // Middle / Ring / Pinky folded fingers
    final Path fingerLines = Path();
    // Pinky fold
    fingerLines.moveTo(w * 0.35, h * 0.48);
    fingerLines.quadraticBezierTo(w * 0.45 - shiftOffset, h * 0.42, w * 0.55 - shiftOffset, h * 0.48);
    
    // Ring fold
    fingerLines.moveTo(w * 0.35, h * 0.39);
    fingerLines.quadraticBezierTo(w * 0.48 - shiftOffset, h * 0.33, w * 0.60 - shiftOffset, h * 0.39);
    
    // Middle fold
    fingerLines.moveTo(w * 0.35, h * 0.30);
    fingerLines.quadraticBezierTo(w * 0.52 - shiftOffset, h * 0.24, w * 0.65 - shiftOffset, h * 0.30);

    // Thumb path (crosses the front of the fist diagonally, creating the middle of the 'S')
    final Path thumbPath = Path();
    thumbPath.moveTo(w * 0.30, h * 0.65);
    // Sweep up and right over the fingers
    thumbPath.cubicTo(
      w * 0.40, h * 0.65 - (shiftOffset * 0.2),
      w * 0.65 + (shiftOffset * 0.5), h * 0.55,
      w * 0.70 + (shiftOffset * 0.5), h * 0.45,
    );

    // Draw the paths with progress matching drawProgress
    _drawAnimatedPath(canvas, handOutline, outlinePaint);
    
    // Inner details draw slightly later (when drawProgress > 0.4)
    if (drawProgress > 0.4) {
      final double innerProgress = (drawProgress - 0.4) / 0.6;
      final Paint animatedInnerPaint = Paint()
        ..color = innerPaint.color.withOpacity(innerProgress)
        ..style = innerPaint.style
        ..strokeWidth = innerPaint.strokeWidth
        ..strokeCap = innerPaint.strokeCap
        ..strokeJoin = innerPaint.strokeJoin;
        
      _drawAnimatedPath(canvas, fingerLines, animatedInnerPaint, progress: innerProgress);
      _drawAnimatedPath(canvas, thumbPath, animatedInnerPaint, progress: innerProgress);
    }
  }

  void _drawAnimatedPath(Canvas canvas, Path path, Paint paint, {double progress = -1.0}) {
    final double actualProgress = progress == -1.0 ? drawProgress : progress;
    if (actualProgress <= 0.0) return;

    final Path animatedPath = Path();
    for (final PathMetric metric in path.computeMetrics()) {
      final double extractLength = metric.length * actualProgress;
      animatedPath.addPath(
        metric.extractPath(0.0, extractLength),
        Offset.zero,
      );
    }
    canvas.drawPath(animatedPath, paint);
  }

  @override
  bool shouldRepaint(covariant _LogoPainter oldDelegate) {
    return oldDelegate.drawProgress != drawProgress ||
        oldDelegate.fingerShift != fingerShift ||
        oldDelegate.glowIntensity != glowIntensity;
  }
}
