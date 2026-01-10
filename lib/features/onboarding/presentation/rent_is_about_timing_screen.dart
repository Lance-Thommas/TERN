import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RentIsAboutTimingScreen extends StatelessWidget {
  const RentIsAboutTimingScreen({super.key});

  static const _bgLight = Color(0xFFFBFAF8);
  static const _primary = Color(0xFF13ECDA);
  static const _fgDark = Color(0xFF292E38);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: _bgLight,
      appBar: AppBar(
        backgroundColor: _bgLight,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
          if (context.canPop()) {
            context.pop();
          } else {
            context.go('/');
          }
        },
        ),
        title: const Text(''),
      ),
      body: Stack(
        children: [
          Positioned(
            top: -120,
            right: -100,
            child: _BlurCircle(color: _primary.withValues(alpha: 0.08), size: 220),
          ),
          Positioned(
            top: 140,
            left: -120,
            child: _BlurCircle(color: _primary.withValues(alpha: 0.12), size: 180),
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 12),
                        _ClockIllustration(primary: _primary),
                        const SizedBox(height: 28),
                        _Headline(primary: _primary, theme: theme),
                        const SizedBox(height: 12),
                        Text(
                          'TERN stabilizes your rental journey by protecting your time.',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: _fgDark.withValues(alpha: 0.70),
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _PageIndicators(primary: _primary),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 22),
                  child: _NextButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Headline extends StatelessWidget {
  const _Headline({required this.primary, required this.theme});
  final Color primary;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) => LinearGradient(
        colors: [const Color(0xFF102220), primary],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(rect),
      child: Text(
        'Most problems start when timing breaks.',
        textAlign: TextAlign.center,
        style: theme.textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.w800,
          color: Colors.white,
          letterSpacing: -0.2,
          height: 1.2,
        ),
      ),
    );
  }
}

class _PageIndicators extends StatelessWidget {
  const _PageIndicators({required this.primary});
  final Color primary;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 32,
          height: 8,
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(color: primary.withValues(alpha: 0.35), blurRadius: 10)],
          ),
        ),
        const SizedBox(width: 8),
        _Dot(),
        const SizedBox(width: 8),
        _Dot(),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class _ClockIllustration extends StatelessWidget {
  const _ClockIllustration({required this.primary});
  final Color primary;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 18, offset: Offset(0, 8))],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: CustomPaint(
        size: const Size(260, 260),
        painter: _ClockPainter(primary: primary),
      ),
    );
  }
}

class _ClockPainter extends CustomPainter {
  _ClockPainter({required this.primary});
  final Color primary;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.38;

    final ringPaint = Paint()
      ..color = primary.withValues(alpha: 0.18)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.drawArc(Rect.fromCircle(center: Offset.zero, radius: radius), -1.57, 5.6, false, ringPaint);
    canvas.restore();

    final innerPaint = Paint()
      ..color = primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.drawArc(Rect.fromCircle(center: Offset.zero, radius: radius), -1.57, 4.2, false, innerPaint);
    canvas.restore();

    final handPaintDark = Paint()
      ..color = const Color(0xFF292E38)
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(center, center.translate(0, -radius + 10), handPaintDark);

    final handPaintPrimary = Paint()
      ..color = primary
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(center, center.translate(radius - 15, 0), handPaintPrimary);

    final dashPaint = Paint()
      ..color = const Color(0xFF292E38)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final path = Path()
      ..moveTo(center.dx + radius * 0.75, center.dy - radius * 0.35)
      ..quadraticBezierTo(center.dx + radius * 0.9, center.dy, center.dx + radius * 0.9, center.dy + radius * 0.35);
    const dashWidth = 6.0;
    const dashSpace = 6.0;
    double distance = 0.0;
    for (final metric in path.computeMetrics()) {
      while (distance < metric.length) {
        final len = distance + dashWidth < metric.length ? dashWidth : metric.length - distance;
        canvas.drawPath(metric.extractPath(distance, distance + len), dashPaint);
        distance += dashWidth + dashSpace;
      }
    }

    final badgePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);
    final badgeCenter = Offset(center.dx + radius * 0.72, center.dy + radius * 0.72);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: badgeCenter, width: 60, height: 60),
        const Radius.circular(18),
      ),
      badgePaint,
    );

    final badgeBorder = Paint()
      ..color = Colors.grey.shade200
      ..style = PaintingStyle.stroke;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: badgeCenter, width: 60, height: 60),
        const Radius.circular(18),
      ),
      badgeBorder,
    );

    final calendarPaint = Paint()..color = primary;
    canvas.drawRect(Rect.fromCenter(center: badgeCenter, width: 26, height: 6), calendarPaint);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: badgeCenter.translate(0, 6), width: 26, height: 22),
        const Radius.circular(6),
      ),
      calendarPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _NextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        onPressed: () => context.push('/onboarding/tern-protects-time'),
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF292E38),
          textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            SizedBox(width: 24),
            Text('Next'),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}

class _BlurCircle extends StatelessWidget {
  const _BlurCircle({required this.color, required this.size});
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: color, blurRadius: size / 3, spreadRadius: size / 6)],
      ),
    );
  }
}
