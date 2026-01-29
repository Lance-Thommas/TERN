import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _renew2Bg = Color(0xFFF8F7F6);
const _renew2Primary = Color(0xFFE5A01F);

class RenewalWindowDecision2Screen extends StatelessWidget {
  const RenewalWindowDecision2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _renew2Bg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          // TODO(remove): temporary screen acronym during early development
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Text('RWD2', style: const TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/app/timeline');
            }
          },
        ),
        title: const Text('Renewal Window Decision 2'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [_renew2Primary, Color(0xFFB37D18)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                    child: Text(
                      'Your lease is nearing a decision point.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Review your options below to choose the path that suits you best. Take your time, there is no rush.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(color: const Color(0xFF887B63), height: 1.4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFE5E0D6)),
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3))],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Icon(Icons.info, color: Color(0xFF887B63)),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'A recent rental rule update affects renewals after July 1st, 2024.',
                        style: theme.textTheme.bodySmall?.copyWith(color: const Color(0xFF887B63), height: 1.4, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  _PrimaryCard(),
                  const SizedBox(height: 14),
                  _SecondaryCard(),
                  const SizedBox(height: 14),
                  _ExitCard(),
                  const SizedBox(height: 10),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.open_in_new, color: _renew2Primary, size: 18),
                    label: const Text('Need help deciding?', style: TextStyle(color: _renew2Primary, fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PrimaryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [_renew2Primary, Color(0xFFE5A01F)], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(18),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: Container(color: Colors.transparent),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, 6))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
                child: SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuAsR1VaCo7oa5YFrLnuv_Rbm4aZbpVZ8gXRd1_q_PFK36pUIdc118iutWGJ0H1ISEnyxp68ieVkhft1_1HdVxG1x0t34Pazxbiml-Gw2-1dUwDcL6PXJ9JKRRDuwbUQ6V369t3TqfLVh2Ss-KKJVJCAZYtVXjXlqK-YUUfyRlvMCL1XAkLB1OafwUdyOBDeKKq81QGtfn0f-05cFR1Rwatchb9H-A4YqbipXjMW0sHlu4NvUTfiks6UWcQwPod1_r3tOc76OPNkFmUJ',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(color: _renew2Primary.withValues(alpha: 0.15), shape: BoxShape.circle),
                          child: const Icon(Icons.verified, color: _renew2Primary, size: 20),
                        ),
                        const SizedBox(width: 10),
                        Text('Renew Lease', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Continue living in your home with locked-in rates. This is the simplest way to secure your housing stability.',
                      style: theme.textTheme.bodyMedium?.copyWith(color: const Color(0xFF887B63), height: 1.4),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _renew2Primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          shadowColor: _renew2Primary.withValues(alpha: 0.3),
                          elevation: 6,
                        ),
                        child: const Text('Renew Now', style: TextStyle(fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SecondaryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E0D6)),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3))],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_month, color: Color(0xFF887B63)),
                        const SizedBox(width: 8),
                        Text('Plan a Transition', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Need flexibility? Structure a move-out plan that works for your timeline.',
                      style: theme.textTheme.bodySmall?.copyWith(color: const Color(0xFF887B63), height: 1.4),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuBH4qMDjzMi6pHxvOX34gWlPzPrGkFjRBgmlkTptbaoZxc4sbPK9Pa37tGadiErUlgLQPhweaZea-d_EfxoyrLfg0AYC0BIZsSjJ-HRDrEOW7x64fKyRyQ96yLz7KLTWrc9B1RlySYHlSx2IudqVgquwmme2MS2kQg-Y-Y_0VGBWUwQMkaf-YHscdkOAaTm_j5x6DX92GB5flpGT4bQXEyOR0jIF64rsCaediNRS5MrdRyzA5MKH12yh6_A7NViasJasOQpaZDoy8XV',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: const BorderSide(color: _renew2Primary),
                foregroundColor: _renew2Primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('Explore Options', style: TextStyle(fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExitCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E0D6)),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          const Icon(Icons.logout, color: Color(0xFF887B63)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Exit Lease', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800)),
                const SizedBox(height: 4),
                Text(
                  'End your tenancy at the conclusion of your current term.',
                  style: theme.textTheme.bodySmall?.copyWith(color: const Color(0xFF887B63), height: 1.3),
                ),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              backgroundColor: const Color(0xFFF2F2F0),
              foregroundColor: const Color(0xFF181511),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text('Initiate Exit', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
