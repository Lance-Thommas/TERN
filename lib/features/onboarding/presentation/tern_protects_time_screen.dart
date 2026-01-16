import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TernProtectsTimeScreen extends StatelessWidget {
  const TernProtectsTimeScreen({super.key});

  static const _bg = Color(0xFFF6F8F8);
  static const _primary = Color(0xFF13ECDA);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        actions: [
          // TODO(remove): temporary screen acronym during early development
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Text('TPT', style: const TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
        backgroundColor: _bg,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go('/dev'),
        ),
        title: const Text(''),
      ),
      body: Stack(
        children: [
          Positioned(
            top: -140,
            right: -120,
            child: _BlurCircle(color: _primary.withValues(alpha: 0.08), size: 240),
          ),
          Positioned(
            top: 140,
            left: -120,
            child: _BlurCircle(color: _primary.withValues(alpha: 0.10), size: 200),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 12),
                _ProgressDots(primary: _primary),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 12),
                        _Illustration(primary: _primary),
                        const SizedBox(height: 24),
                        _Headline(primary: _primary, theme: theme),
                        const SizedBox(height: 10),
                        Text(
                          'We absorb the timing shocks so your rental history stays unbroken.',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: const Color(0xFF292E38).withValues(alpha: 0.70),
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  child: _NextButton(onTap: () => context.push('/onboarding/good-care')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressDots extends StatelessWidget {
  const _ProgressDots({required this.primary});
  final Color primary;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _dot(active: false, primary: primary),
        const SizedBox(width: 8),
        _dot(active: true, primary: primary),
        const SizedBox(width: 8),
        _dot(active: false, primary: primary),
      ],
    );
  }

  Widget _dot({required bool active, required Color primary}) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: active ? const Color(0xFF292E38) : const Color(0xFFDCE6E5),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class _Illustration extends StatelessWidget {
  const _Illustration({required this.primary});
  final Color primary;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.white,
        border: Border.all(color: Colors.black.withValues(alpha: 0.05)),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, 6))],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 260,
            height: 260,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(130),
              gradient: LinearGradient(
                colors: [primary.withValues(alpha: 0.20), primary.withValues(alpha: 0.05), Colors.transparent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Stack(
              children: [
                SizedBox(
                  width: 260,
                  height: 260,
                  child: Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuAGF9PLX1UoyafvocM0EsAmu3154mdXBN8cHNrGfxnu5EQNPrxjaaIInHfGzUEPS4WVNHFw4VdIT5Vm9Njbo616Ppsv74qMVZmommslYWGbJXEhT1D6pxK-G6rxjpE2TooAm8qu3EjRupMEogBijoHH9iTGYWFhanmMd4lesXC-ssEpGU630WS_ogJqus--1VLgjFwO2I2F2vmcacqxlnIy57CaRBwh9y_Rnu2ppn3VNAnfMdrmMJhcG1MJRYPwHvWKSrz8woFOUDpH',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white.withValues(alpha: 0.85), Colors.transparent, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.65),
                        borderRadius: BorderRadius.circular(36),
                        border: Border.all(color: primary.withValues(alpha: 0.30)),
                        boxShadow: [BoxShadow(color: primary.withValues(alpha: 0.2), blurRadius: 12)],
                      ),
                      child: Icon(Icons.waves, color: primary, size: 34),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 4,
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.grey.shade300, Colors.transparent],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 6,
                            margin: const EdgeInsets.only(left: 12),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [primary, primary.withValues(alpha: 0.0)],
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'When a month gets uneven, ',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: const Color(0xFF292E38),
              fontWeight: FontWeight.w800,
              height: 1.2,
              letterSpacing: -0.2,
            ),
            children: [
              WidgetSpan(
                child: ShaderMask(
                  shaderCallback: (rect) => LinearGradient(
                    colors: [primary, Colors.tealAccent.shade400],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ).createShader(rect),
                  child: Text(
                    'TERN smooths it.',
                    style: theme.textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          height: 1.2,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF292E38),
          textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Next'),
            SizedBox(width: 6),
            Icon(Icons.arrow_forward, size: 18),
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
