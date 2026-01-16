import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _trfBg = Color(0xFFF6F8F8);
const _trfPrimary = Color(0xFF17CFB0);

class TransitionRequestFlexibilityScreen extends StatelessWidget {
  const TransitionRequestFlexibilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _trfBg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: const [
          // TODO(remove): temporary screen acronym during early development
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Text('TRF', style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go('/dev'),
        ),
        title: const Text('Transition Flexibility'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 170),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [_trfPrimary, Color(0xFF0E8A75)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(bounds),
                        child: Text(
                          'Need a bit more time to move out calmly?',
                          style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w800, height: 1.2),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Extend your lease without the hassle of renegotiation. Choose a bounded extension that fits your timeline perfectly.',
                        style: theme.textTheme.bodyMedium?.copyWith(color: const Color(0xFF638882), height: 1.5),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFDCE5E4)),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3))],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(color: _trfPrimary.withValues(alpha: 0.12), shape: BoxShape.circle),
                          child: const Icon(Icons.verified_user, color: _trfPrimary),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Pricing Fairness', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                              const SizedBox(height: 6),
                              Text(
                                'Priced cheaper than a hotel, slightly more than your current rent. No renegotiation needed.',
                                style: theme.textTheme.bodySmall?.copyWith(color: const Color(0xFF638882), height: 1.4),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text('Select an Option', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: const [
                      _OptionCard(
                        title: '1 Month Extension',
                        price: '\$1,250',
                        note: '(+\$50 vs current)',
                        moveOut: 'New Move-out: Aug 31, 2024',
                        badge: 'Most Popular',
                        selected: false,
                      ),
                      SizedBox(height: 10),
                      _OptionCard(
                        title: '2 Months Extension',
                        price: '\$2,500',
                        note: 'total',
                        moveOut: 'New Move-out: Sep 30, 2024',
                        selected: true,
                      ),
                      SizedBox(height: 10),
                      _OptionCard(
                        title: '3 Months Extension',
                        price: '\$3,700',
                        note: 'total (Best Value)',
                        moveOut: 'New Move-out: Oct 31, 2024',
                        selected: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 18),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Color(0xFFDCE5E4))),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, -2))],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Selected Plan', style: TextStyle(color: Color(0xFF638882), fontWeight: FontWeight.w700, fontSize: 12)),
                          SizedBox(height: 4),
                          Text('2 Months • Sep 30, 2024', style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                      Text('\$2,500', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _trfPrimary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        elevation: 6,
                        shadowColor: _trfPrimary.withValues(alpha: 0.25),
                      ),
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('Confirm Transition Plan', style: TextStyle(fontWeight: FontWeight.w800)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color(0xFFDCE5E4))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _NavItem(icon: Icons.home, label: 'Home'),
            _NavItem(icon: Icons.swap_horiz, label: 'Transition', active: true),
            _NavItem(icon: Icons.chat_bubble, label: 'Support'),
            _NavItem(icon: Icons.person, label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

class _OptionCard extends StatelessWidget {
  const _OptionCard({
    required this.title,
    required this.price,
    required this.note,
    required this.moveOut,
    this.badge,
    this.selected = false,
  });

  final String title;
  final String price;
  final String note;
  final String moveOut;
  final String? badge;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final borderColor = selected ? _trfPrimary : const Color(0xFFDCE5E4);
    final bgColor = selected ? _trfPrimary.withValues(alpha: 0.08) : Colors.white;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: selected ? _trfPrimary : const Color(0xFF9CAEA9)),
                      color: selected ? _trfPrimary : Colors.white,
                    ),
                    child: selected ? const Icon(Icons.check, size: 14, color: Colors.white) : null,
                  ),
                  const SizedBox(width: 10),
                  Text(title, style: TextStyle(fontWeight: FontWeight.w800, color: Colors.grey[900], fontSize: 16)),
                ],
              ),
              if (badge != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
                  child: Text(badge!, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Color(0xFF638882))),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(price, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFF111817))),
              const SizedBox(width: 6),
              Text(note, style: const TextStyle(color: Color(0xFF638882), fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: const [
              Icon(Icons.event, color: Color(0xFF638882), size: 18),
              SizedBox(width: 6),
              Text('New Move-out date', style: TextStyle(color: Color(0xFF111817), fontWeight: FontWeight.w700)),
            ],
          ),
          const SizedBox(height: 4),
          Text(moveOut, style: const TextStyle(color: Color(0xFF638882), fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.icon, required this.label, this.active = false});
  final IconData icon;
  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final color = active ? _trfPrimary : const Color(0xFF638882);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 2),
        Text(label, style: TextStyle(color: color, fontSize: 10, fontWeight: active ? FontWeight.w700 : FontWeight.w500)),
      ],
    );
  }
}
