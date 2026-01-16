import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _llBg = Color(0xFFF6F8F8);
const _llPrimary = Color(0xFF1EE6D2);

class LandlordPortfolioTimeline2Screen extends StatelessWidget {
  const LandlordPortfolioTimeline2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _llBg,
      appBar: AppBar(
        backgroundColor: _llBg,
        elevation: 0,
        actions: const [
          // TODO(remove): temporary screen acronym during early development
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Text('LPT2', style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go('/dev'),
        ),
        title: const Text('Portfolio'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 30),
        children: [
          const SizedBox(height: 6),
          _Chips(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Portfolio Health', style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey[600], fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text('100% Continuity', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800)),
                    const SizedBox(width: 6),
                    const Icon(Icons.check_circle, color: _llPrimary),
                  ],
                ),
              ],
            ),
          ),
          _PropertyCard(
            title: '123 Maple Ave',
            subtitle: 'Unit 4B',
            statusLabel: 'On Track',
            statusColor: _llPrimary,
            progress: 0.35,
            start: 'Started Mar 2023',
            end: 'Ends Mar 2024',
            nextWindow: 'Oct 1 - Oct 5',
            rent: 'AED 2,450.00',
            progressColor: _llPrimary,
            pulse: true,
          ),
          _PropertyCard(
            title: '450 Oak St',
            subtitle: 'Unit 2',
            statusLabel: 'Renewal',
            statusColor: const Color(0xFFE5A020),
            banner: 'Lease Progress',
            bannerValue: '45 days left',
            progress: 0.88,
            start: 'Started Nov 2022',
            end: 'Ends Nov 2023',
            nextWindow: 'Oct 1 - Oct 5',
            rent: 'AED 1,800.00',
            progressColor: const Color(0xFFE5A020),
            ctaLabel: 'Review Renewal Options',
          ),
          _PropertyCard(
            title: '88 Pine Ln',
            subtitle: 'Single Family Home',
            statusLabel: 'Transition',
            statusColor: Colors.orange,
            alertText: 'Tenant initiated move-out. Final inspection scheduled for Oct 15.',
            progress: 0.6,
            start: 'Projected Vacancy',
            end: 'Last Rent',
            nextWindow: '14 Days',
            rent: 'Paid Sept 1',
            progressColor: Colors.orange,
            showProgressBar: false,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class _Chips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chips = ['All Units', '123 Maple Ave', '450 Oak St', '88 Pine Ln'];
    return SizedBox(
      height: 44,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: chips.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final active = index == 0;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: active ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: active ? Colors.transparent : const Color(0xFFD0D7D6)),
            ),
            child: Center(
              child: Text(
                chips[index],
                style: TextStyle(
                  color: active ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PropertyCard extends StatelessWidget {
  const _PropertyCard({
    required this.title,
    required this.subtitle,
    required this.statusLabel,
    required this.statusColor,
    this.banner,
    this.bannerValue,
    this.alertText,
    required this.progress,
    required this.start,
    required this.end,
    required this.nextWindow,
    required this.rent,
    required this.progressColor,
    this.ctaLabel,
    this.showProgressBar = true,
    this.pulse = false,
  });

  final String title;
  final String subtitle;
  final String statusLabel;
  final Color statusColor;
  final String? banner;
  final String? bannerValue;
  final String? alertText;
  final double progress;
  final String start;
  final String end;
  final String nextWindow;
  final String rent;
  final Color progressColor;
  final String? ctaLabel;
  final bool showProgressBar;
  final bool pulse;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F5F2),
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.apartment, color: Color(0xFF5A5F61)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
                      const SizedBox(height: 2),
                      Text(subtitle, style: const TextStyle(color: Color(0xFF6B7280))),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      if (statusLabel == 'On Track')
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle),
                        )
                      else if (statusLabel == 'Renewal')
                        const Icon(Icons.history_edu, size: 16, color: Color(0xFFE5A020))
                      else
                        const Icon(Icons.key, size: 16, color: Colors.orange),
                      const SizedBox(width: 6),
                      Text(statusLabel, style: TextStyle(color: statusColor, fontWeight: FontWeight.w800, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
            if (alertText != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.orange.shade100),
                ),
                child: Text(alertText!, style: const TextStyle(color: Color(0xFF9A4A00))),
              ),
            ]
            else if (banner != null) ...[
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(banner!, style: TextStyle(color: progressColor, fontWeight: FontWeight.w700)),
                  if (bannerValue != null)
                    Text(bannerValue!, style: TextStyle(color: progressColor, fontWeight: FontWeight.w700)),
                ],
              ),
            ],
            if (showProgressBar) ...[
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 10,
                  backgroundColor: const Color(0xFFDCE5E4),
                  valueColor: AlwaysStoppedAnimation(progressColor),
                ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(start, style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 11)),
                  Text(end, style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 11)),
                ],
              ),
            ],
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Next Rent Window', style: TextStyle(color: Color(0xFF6B7280), fontSize: 12)),
                      const SizedBox(height: 2),
                      Text(nextWindow, style: const TextStyle(fontWeight: FontWeight.w800)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Monthly Rent', style: TextStyle(color: Color(0xFF6B7280), fontSize: 12)),
                      const SizedBox(height: 2),
                      Text(rent, style: const TextStyle(fontWeight: FontWeight.w800)),
                    ],
                  ),
                ),
              ],
            ),
            if (ctaLabel != null) ...[
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: progressColor,
                  side: BorderSide(color: progressColor.withValues(alpha: 0.4)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(ctaLabel!, style: const TextStyle(fontWeight: FontWeight.w800)),
                    const SizedBox(width: 6),
                    Icon(Icons.arrow_forward, color: progressColor, size: 18),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
