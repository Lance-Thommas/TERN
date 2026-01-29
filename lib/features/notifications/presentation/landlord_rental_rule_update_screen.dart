import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _lrPrimary = Color(0xFF1EE6D2);
const _lrBg = Color(0xFFF6F8F8);

class LandlordRentalRuleUpdateScreen extends StatelessWidget {
  const LandlordRentalRuleUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _lrBg,
      appBar: AppBar(
        backgroundColor: _lrBg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/app/notifications');
            }
          },
        ),
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF111817), _lrPrimary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: const Text('Rental Rule Update', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 10),
              _HeroCard(),
              const SizedBox(height: 16),
              _BodyCard(),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward, color: Color(0xFF111817)),
                  label: const Text('View what this means for you', style: TextStyle(color: Color(0xFF111817), fontWeight: FontWeight.w800)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _lrPrimary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const _LandlordBottomNav(selectedIndex: 2),
    );
  }
}

class _HeroCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E9E8)),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))],
        image: const DecorationImage(
          image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAwcPCx9wvd6pOmP34AS4sqtj4eSP1UDwkOB_iRTbDhZwcP-eXv6PYtB0pJbhwQMTlKUX2E-9-7XgPqccgFDypsjkWPScZBzZhXyf4ql-IPDwABp0vIob1csnlIY4y0hGBoiMqsHA7_Ks7MZhPmYgmdXnOqEWhuLw6lXiSuUJnOr_MYenwB57hWkYkFOIuyMlTj0fGSQKIwKzHhzFW-BOoNzZwJ0xJWYTMjPZBI2-w3_y5Nmzdz5-BF66nANcnsvo8eJD5_ez3WouAQ'),
          fit: BoxFit.cover,
          opacity: 0.9,
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16), topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          gradient: LinearGradient(
            colors: [Color(0xCCF6F8F8), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        padding: const EdgeInsets.all(12),
        alignment: Alignment.bottomLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.85), borderRadius: BorderRadius.circular(8)),
          child: const Text('Regulation Impact', style: TextStyle(color: Color(0xFF6B7280), fontSize: 12, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}

class _BodyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Colors.white, Color(0xFFE8EAEE)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE8EAEE)),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3))],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border.all(color: const Color(0xFFE5E9E8))),
            child: const Icon(Icons.gavel, color: _lrPrimary, size: 30),
          ),
          const SizedBox(height: 12),
          Text('Regulatory Change', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800), textAlign: TextAlign.center),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFE8EAEE),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'A rental rule has changed that affects reclaim timelines.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF6B7280), height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}

class _LandlordBottomNav extends StatelessWidget {
  const _LandlordBottomNav({this.selectedIndex = 0});

  final int selectedIndex;

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/app/landlord/home');
        break;
      case 1:
        context.go('/app/landlord/portfolio');
        break;
      case 2:
        context.go('/app/landlord/decisions');
        break;
      case 3:
        context.go('/app/landlord/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) => _onTap(context, index),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_filled), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.apartment), label: 'Portfolio'),
        NavigationDestination(icon: Icon(Icons.rule), label: 'Decisions'),
        NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
