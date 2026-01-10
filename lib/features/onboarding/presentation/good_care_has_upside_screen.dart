import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoodCareHasUpsideScreen extends StatelessWidget {
  const GoodCareHasUpsideScreen({super.key});

  static const _bg = Color(0xFFFBFAF8);
  static const _primary = Color(0xFF13ECDA);
  static const _text = Color(0xFF292E38);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        backgroundColor: _bg,
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
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 60,
              right: -90,
              child: _BlurCircle(color: _primary.withValues(alpha: 0.08), size: 200),
            ),
            Column(
              children: [
                const SizedBox(height: 12),
                _Progress(activeIndex: 2, primary: _primary),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                    child: Column(
                      children: [
                        _Illustration(primary: _primary),
                        const SizedBox(height: 24),
                        _Headline(primary: _primary, theme: theme),
                        const SizedBox(height: 12),
                        Text(
                          "Looking after the home shouldn’t just avoid penalties. It unlocks long-term value for you.",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: _text.withValues(alpha: 0.75),
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  child: Column(
                    children: [
                      _PrimaryButton(onTap: () => context.push('/onboarding/create-account-screen')),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () => context.go('/welcome-to-tern'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.grey.shade600,
                          textStyle: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        child: const Text('Skip for now'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Progress extends StatelessWidget {
  const _Progress({required this.activeIndex, required this.primary});
  final int activeIndex;
  final Color primary;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        final active = index == activeIndex;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Container(
            width: active ? 18 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: active ? primary : const Color(0xFFDCE6E5),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        );
      }),
    );
  }
}

class _Illustration extends StatelessWidget {
  const _Illustration({required this.primary});
  final Color primary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 280,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: primary.withValues(alpha: 0.08),
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: primary.withValues(alpha: 0.10), blurRadius: 30)],
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuDIIaIA7XMnynMO745f1dQY35jjP-ia6VzWVz6vdSBy_ODnZMI7O_OqZJdFYUjkw-zwMHLzue58z90KCt-E2Ge3IfjJ54kPDinrZkCqspiYyefDkTGsELW1se9Gx2zLio_8aXrNAkVsps8BLWo6HgApy4XUxneJ5eWlUSf7lvOFX1RR6GojM0S8oiKHr3f9NG3ZWhTryIXwyqikIodu5hmVDyEn1sE_cytHkyL3eA3nzoZk5I_ZsAhJrJEp7SqFuhIrVbBrD3U4no12',
                  ),
                ),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, 6))],
              ),
            ),
          ),
          Positioned(
            bottom: -14,
            right: -14,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
              ),
              child: Icon(Icons.verified_user, color: primary, size: 30),
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
        colors: [primary, const Color(0xFF0FA89B)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(rect),
      child: Text(
        'Good Care Has Upside',
        textAlign: TextAlign.center,
        style: theme.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w800,
          color: Colors.white,
          height: 1.15,
        ),
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF13ECDA),
          foregroundColor: const Color(0xFF111817),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          elevation: 3,
          shadowColor: const Color(0xFF13ECDA).withValues(alpha: 0.25),
          textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
        ),
        icon: const Icon(Icons.arrow_forward, size: 20),
        label: const Text('Got it, connect my lease'),
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
