import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RentalRightsIntroductionScreen extends StatelessWidget {
  const RentalRightsIntroductionScreen({super.key});

  static const _bg = Color(0xFFF6F8F8);
  static const _primary = Color(0xFF17CFB0);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: const [
          // TODO(remove): temporary screen acronym during early development
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Text('RRI', style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go('/dev'),
        ),
        title: const Text('Rental Rights'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          _BlurredTimelineBackground(),
          Container(color: Colors.black.withValues(alpha: 0.05)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 28),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F5F2),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))],
                ),
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Know your rental rights', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800, color: _primary)),
                    const SizedBox(height: 8),
                    Text(
                      'We’ll flag important rule changes that affect your lease so you never miss a critical update.',
                      style: theme.textTheme.bodyMedium?.copyWith(color: const Color(0xFF64748B), height: 1.4),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(foregroundColor: const Color(0xFF52525B)),
                          child: const Text('Learn more', style: TextStyle(fontWeight: FontWeight.w700)),
                        ),
                        const SizedBox(width: 6),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            elevation: 3,
                          ),
                          child: const Text('Got it', style: TextStyle(fontWeight: FontWeight.w800)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BlurredTimelineBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color(0xFFEFF2F1)],
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))],
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDDydn5AxuCu_Ws5yfvuaqBP2r2erN9l2dHcQ82rHY3j2pRlSyXSw29q2QNxhF-p2yOVRGi_5qPDVp2NMjSEA9VcvxK6DlB1KAszutd5Yfrsjls_uJC6yalNKtMsepALgFiyxTjam3F923lHrKjl5saYAjALYNPDS6R8K2vQKlHj9fxh_-QhndJs2gYFp9cuyed5wJk_bCEzBKakjmweF2YOORtlE1VZTFUWaKy6hWefdLDwL5Gj6VL8UcVMYyIzrIduWaaOkIf9HqH'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text('Timeline', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 14, 20, 40),
                children: const [
                  _TimelineItem(icon: Icons.description, title: 'Lease Agreement Signed', date: 'Oct 24, 2023'),
                  _TimelineItem(icon: Icons.assignment, title: 'Move-in Inspection', date: 'Oct 26, 2023'),
                  _TimelineItem(icon: Icons.account_balance_wallet, title: 'Security Deposit Processed', date: 'Oct 27, 2023'),
                  _TimelineItem(icon: Icons.key, title: 'Key Handover', date: 'Oct 30, 2023', dim: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({required this.icon, required this.title, required this.date, this.dim = false});
  final IconData icon;
  final String title;
  final String date;
  final bool dim;

  @override
  Widget build(BuildContext context) {
    final color = dim ? Colors.black54 : Colors.black87;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const SizedBox(height: 6),
            Icon(icon, color: color),
            Container(width: 2, height: 28, color: Colors.grey.shade300),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: color, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text(date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
