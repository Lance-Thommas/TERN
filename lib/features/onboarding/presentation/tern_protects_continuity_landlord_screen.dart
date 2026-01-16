import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _bg = Color(0xFFFBFAF8);
const _primary = Color(0xFF1EE6D2);

class TernProtectsContinuityLandlordScreen extends StatelessWidget {
  const TernProtectsContinuityLandlordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        backgroundColor: _bg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go('/dev'),
        ),
        actions: [
          TextButton(
            onPressed: () => context.go('/onboarding/create-account-landlord'),
            child: const Text('Skip', style: TextStyle(color: Color(0x996B7280), fontWeight: FontWeight.w700)),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 6),
                  const _Progress(),
                  const SizedBox(height: 6),
                  const _HeroArt(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child: Column(
                      children: const [
                        _Headline(),
                        SizedBox(height: 12),
                        Text(
                          "Market volatility shouldn't disrupt your returns. TERN acts as a protective layer, ensuring predictable income regardless of tenant timing.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xCC292E38), height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => context.push('/onboarding/create-account-landlord'),
                icon: const Icon(Icons.arrow_forward, color: Color(0xFF0F756A)),
                label: const Text('Next', style: TextStyle(color: Color(0xFF0F756A), fontWeight: FontWeight.w800)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primary.withValues(alpha: 0.12),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Progress extends StatelessWidget {
  const _Progress();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _dot(false, short: true),
          const SizedBox(width: 6),
          _dot(true, short: false),
          const SizedBox(width: 6),
          _dot(false, short: true),
        ],
      ),
    );
  }

  Widget _dot(bool active, {required bool short}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: active ? 24 : (short ? 8 : 12),
      height: 8,
      decoration: BoxDecoration(
        color: active ? _primary : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(6),
        boxShadow: active ? [BoxShadow(color: _primary.withValues(alpha: 0.3), blurRadius: 8)] : null,
      ),
    );
  }
}

class _HeroArt extends StatelessWidget {
  const _HeroArt();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(color: _primary.withValues(alpha: 0.12), shape: BoxShape.circle),
          ),
          Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuA4iqR8RTiD8-8L1gZJVfyUz3CH8vfHqqh7Arwf9_QI-XKV-W-5uW8zX-rAyXu1cNZUzW2GC3pLaoj5cIOEOs_s-tLAFL0QsAW0NW8BzDbS5egUC6eEvFmKln54pw2-qjTKwDtp7oO38msg5vE5KhXBSSo0PUwcx-EI4NXsE6QF6KfzaQcHknMxhOPWLFcolRBccgikRAg1t7sd_mAiGoYH23W7fX9BYZ8l-eanlyNhKNVu1YZ3pZsTBDVuXo8TbtNQKi9swCjtg9Jh'),
                fit: BoxFit.cover,
              ),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))],
            ),
          ),
        ],
      ),
    );
  }
}

class _Headline extends StatelessWidget {
  const _Headline();

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Color(0xFF16B8A8), _primary],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: const Text(
        'TERN absorbs short-term timing issues so rent stays predictable.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, height: 1.15, color: Colors.white),
      ),
    );
  }
}
