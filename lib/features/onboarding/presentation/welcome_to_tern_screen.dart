import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeToTernScreen extends StatelessWidget {
  const WelcomeToTernScreen({super.key});

  static const _bgLight = Color(0xFFFBFAF8);
  static const _primary = Color(0xFF13EC92);
  static const _primaryDark = Color(0xFF0C9F62);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: _bgLight,
      appBar: AppBar(
        backgroundColor: _bgLight,
        elevation: 0,
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
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(
            top: -140,
            right: -100,
            child: _BlurCircle(color: _primary.withValues(alpha: 0.10), size: 220),
          ),
          Positioned(
            bottom: 160,
            left: -120,
            child: _BlurCircle(color: _primary.withValues(alpha: 0.10), size: 180),
          ),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: constraints.maxHeight - 120),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _LogoMark(primary: _primary),
                              const SizedBox(height: 24),
                              _GradientHeadline(primary: _primary, primaryDark: _primaryDark, theme: theme),
                              const SizedBox(height: 12),
                              Text(
                                'TERN helps keep renting calm when timing gets messy.',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  color: const Color(0xFF292E38).withValues(alpha: 0.80),
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _PrimaryCta(
                            primary: _primary,
                            primaryDark: _primaryDark,
                            onTap: () => context.push('/onboarding/create-account-screen'),
                          ),
                          const SizedBox(height: 12),
                          _SecondaryCta(onTap: () => context.push('/onboarding/rent-timing')),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _LogoMark extends StatelessWidget {
  const _LogoMark({required this.primary});
  final Color primary;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 96,
      decoration: BoxDecoration(
        color: primary.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Icon(Icons.shield_moon, size: 46, color: primary),
    );
  }
}

class _GradientHeadline extends StatelessWidget {
  const _GradientHeadline({required this.primary, required this.primaryDark, required this.theme});
  final Color primary;
  final Color primaryDark;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) => LinearGradient(
        colors: [primary, primaryDark],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(rect),
      child: Text(
        'Welcome to TERN',
        textAlign: TextAlign.center,
        style: theme.textTheme.displaySmall?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          letterSpacing: -0.5,
          height: 1.1,
        ),
      ),
    );
  }
}

class _PrimaryCta extends StatelessWidget {
  const _PrimaryCta({required this.primary, required this.primaryDark, required this.onTap});
  final Color primary;
  final Color primaryDark;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primary, primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: primary.withValues(alpha: 0.35), blurRadius: 12, offset: const Offset(0, 8)),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: SizedBox(
            height: 56,
            child: Center(
              child: Text(
                'I have a lease',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF111815),
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SecondaryCta extends StatelessWidget {
  const _SecondaryCta({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF292E38).withValues(alpha: 0.70),
          textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: const Text('See how it works'),
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
