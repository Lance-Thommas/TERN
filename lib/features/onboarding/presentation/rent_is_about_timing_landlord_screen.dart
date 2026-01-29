import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _bg = Color(0xFFFBFAF8);
const _fg = Color(0xFF292E38);
const _primary = Color(0xFF1EE6D2);

class RentIsAboutTimingLandlordScreen extends StatelessWidget {
  const RentIsAboutTimingLandlordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        backgroundColor: _bg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/welcome-to-tern');
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () => context.go('/onboarding/create-account-landlord'),
            child: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w700, color: Color(0x99292E38))),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const _HeroArt(),
                  const SizedBox(height: 20),
                  const _Indicators(activeIndex: 1),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      children: const [
                        _Headline(),
                        SizedBox(height: 12),
                        Text(
                          'TERN provides the rental continuity infrastructure you need. Achieve predictable rental income and ensure orderly exits by keeping every step synchronized.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0x99292E38), height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.push('/onboarding/landlord/protects-continuity'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primary.withValues(alpha: 0.15),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text('Next', style: TextStyle(color: Color(0xFF0F756A), fontWeight: FontWeight.w700, fontSize: 16)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroArt extends StatelessWidget {
  const _HeroArt();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
              color: _primary.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
          ),
          Container(
            width: 230,
            height: 230,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 3))],
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDOqaykwwLzBDvuRN1NPoW3kXWwyGCcCeV8CN_iwgLvUi5MtKM6tKtHMXPH0UUShVb0nCvxlQzNldmqOm1hdVX1VWeDIVxKASczUoD64-nn7D7gcztP1v5Xoo6pfYoeAsVC7ACwiEaETvJ6K9vSALd9tg9SCt6w1LGodBZRuH6-onqUvcLIoWoQg1OTxYaX6NBPJMU3IeyyO7SOvSq9YxI9iULRYCh39KgKXCyl4vnptww6xreJEp4Vm10yEWcYeOXsmcGyT4QeIocB'),
              ),
            ),
          ),
          Container(
            width: 230,
            height: 230,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _primary.withValues(alpha: 0.08),
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
        colors: [Color(0xFF18B5A4), _primary],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: const Text(
        'Most disputes start when timing breaks.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, height: 1.15, color: Colors.white),
      ),
    );
  }
}

class _Indicators extends StatelessWidget {
  const _Indicators({required this.activeIndex});
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _dot(activeIndex == 0, long: false),
        const SizedBox(width: 8),
        _dot(activeIndex == 1, long: true),
        const SizedBox(width: 8),
        _dot(activeIndex == 2, long: false),
      ],
    );
  }

  Widget _dot(bool active, {required bool long}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: long ? (active ? 20 : 10) : 8,
      height: 8,
      decoration: BoxDecoration(
        color: active ? _primary : _fg.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(4),
        boxShadow: active ? [BoxShadow(color: _primary.withValues(alpha: 0.4), blurRadius: 10)] : null,
      ),
    );
  }
}
