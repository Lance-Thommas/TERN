import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _clBg = Color(0xFFFBFAF8);
const _clPrimary = Color(0xFF1EE6D2);

class ClearExitsReduceLossLandlordScreen extends StatelessWidget {
  const ClearExitsReduceLossLandlordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _clBg,
      appBar: AppBar(
        backgroundColor: _clBg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/app/landlord/decisions');
            }
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const _Progress(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: const [
                  SizedBox(height: 6),
                  _HeroArt(),
                  SizedBox(height: 18),
                  _HeadlineBlock(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => context.push('/onboarding/landlord/property-lease-setup'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _clPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("Let's get started", style: TextStyle(color: Color(0xFF111817), fontWeight: FontWeight.w800, fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => context.push('/onboarding/create-account-landlord'),
                    child: const Text('Skip for now', style: TextStyle(color: Color(0x996B7280), fontWeight: FontWeight.w700)),
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

class _Progress extends StatelessWidget {
  const _Progress();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _bar(active: false),
        const SizedBox(width: 8),
        _bar(active: false),
        const SizedBox(width: 8),
        _bar(active: true),
      ],
    );
  }

  Widget _bar({required bool active}) {
    return Container(
      width: 32,
      height: 6,
      decoration: BoxDecoration(
        color: active ? const Color(0xFF292E38) : const Color(0xFFDCE5E4),
        borderRadius: BorderRadius.circular(6),
        boxShadow: active ? [BoxShadow(color: _clPrimary.withValues(alpha: 0.35), blurRadius: 10)] : null,
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
            width: 260,
            height: 260,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [_clPrimary, Colors.transparent], begin: Alignment.topLeft, end: Alignment.bottomRight),
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: _clPrimary.withValues(alpha: 0.15), blurRadius: 30)],
            ),
          ),
          Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDFRu56zQttpSPdrdDyfZuhgX7Q4-Wd7RumASB10JWxS4xaxvUUBdS0btdq0Z85hanAcNmQh0mO57S_dKezrmdCnvAaghgj4svJqh_FUU-M637D7Czf5KKcHxrAFghgrzqyEO8YJiVTWl-VOKUfwrX6Zdv8gnDXILXyzX_ZB5LGcxu9IuD3XW0RVybNlV7XodbyDC6DAF6Al5LG5HJSyjgCeSDE5666wVbqFXnuwPWTAc8hgellFICZijgXZuV2s-7sCAAbZPlG0CSw'),
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            right: 32,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3))],
                border: Border.all(color: const Color(0xFFE5E9E8)),
              ),
              child: const Icon(Icons.verified_user, color: _clPrimary, size: 30),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeadlineBlock extends StatelessWidget {
  const _HeadlineBlock();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'Orderly endings protect income and property',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Color(0xFF292E38)),
        ),
        SizedBox(height: 12),
        Text(
          'Chello ensures the move-out process is seamless. Protect your asset from vacancy loss and damages with our structured exit protocols.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xCC292E38), height: 1.5),
        ),
      ],
    );
  }
}
