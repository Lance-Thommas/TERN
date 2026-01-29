import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FirstTimelineView4Screen extends StatelessWidget {
  const FirstTimelineView4Screen({super.key});

  static const _bg = Color(0xFFF6F8F8);
  static const _line = Color(0xFFDbe6e5);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    final entries = <_TimelineEntry>[
      const _TimelineEntry(icon: Icons.check_circle, title: 'Lease Start', subtitle: 'Jan 1, 2023', status: _TimelineStatus.past),
      const _TimelineEntry(
        icon: Icons.check_circle,
        title: 'Rent paid — on time',
        subtitle: 'Automatic payment complete',
        status: _TimelineStatus.current,
        pill: 'Today',
        highlight: true,
      ),
      const _TimelineEntry(icon: Icons.schedule, title: 'Next Rent Window', subtitle: 'Nov 1, 2023', status: _TimelineStatus.future),
      const _TimelineEntry(icon: Icons.flag, title: 'Lease End Date', subtitle: 'Dec 31, 2023', status: _TimelineStatus.future),
    ];

    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        backgroundColor: _bg,
        elevation: 0,
        actions: const [
          // TODO(remove): temporary screen acronym during early development
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Text('FTV4', style: TextStyle(fontWeight: FontWeight.w700)),
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
        title: Text('TERN', style: theme.textTheme.titleMedium?.copyWith(letterSpacing: 4, fontWeight: FontWeight.w700)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HeroSection(
                title: 'Everything is on track.',
                subtitle: 'Rent paid. You are covered until Nov 1, 2023.',
                primary: primary,
              ),
              const SizedBox(height: 20),
              _ProgressSection(label: 'Annual Progress', valueLabel: '150 Days Elapsed', progress: 0.42, primary: primary),
              const SizedBox(height: 18),
              _TimelineList(entries: entries, lineColor: _line, primary: primary),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection({required this.title, required this.subtitle, required this.primary});
  final String title;
  final String subtitle;
  final Color primary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall?.copyWith(color: primary, fontWeight: FontWeight.w800, height: 1.1),
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: SizedBox(
            width: 300,
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(color: const Color(0xFF618986), height: 1.3),
            ),
          ),
        ),
      ],
    );
  }
}

class _ProgressSection extends StatelessWidget {
  const _ProgressSection({required this.label, required this.valueLabel, required this.progress, required this.primary});
  final String label;
  final String valueLabel;
  final double progress;
  final Color primary;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
            Text(
              valueLabel,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(color: primary, fontWeight: FontWeight.w700, letterSpacing: 0.3),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: LinearProgressIndicator(
            minHeight: 6,
            value: progress,
            color: primary,
            backgroundColor: const Color(0xFFDbe6e5),
          ),
        ),
      ],
    );
  }
}

enum _TimelineStatus { past, current, future }

class _TimelineEntry {
  const _TimelineEntry({
    required this.icon,
    required this.title,
    required this.status,
    this.subtitle,
    this.pill,
    this.highlight = false,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final _TimelineStatus status;
  final String? pill;
  final bool highlight;
}

class _TimelineList extends StatelessWidget {
  const _TimelineList({required this.entries, required this.lineColor, required this.primary});

  final List<_TimelineEntry> entries;
  final Color lineColor;
  final Color primary;

  @override
  Widget build(BuildContext context) {
    final currentIndex = entries.indexWhere((e) => e.status == _TimelineStatus.current);
    return Column(
      children: [
        for (var i = 0; i < entries.length; i++)
          _TimelineItem(
            entry: entries[i],
            isFirst: i == 0,
            isLast: i == entries.length - 1,
            currentIndex: currentIndex >= 0 ? currentIndex : 0,
            index: i,
            lineColor: lineColor,
            primary: primary,
          ),
      ],
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({
    required this.entry,
    required this.isFirst,
    required this.isLast,
    required this.currentIndex,
    required this.index,
    required this.lineColor,
    required this.primary,
  });

  final _TimelineEntry entry;
  final bool isFirst;
  final bool isLast;
  final int currentIndex;
  final int index;
  final Color lineColor;
  final Color primary;

  Color get _topLineColor => isFirst ? Colors.transparent : (index <= currentIndex ? primary.withValues(alpha: 0.3) : lineColor);
  Color get _bottomLineColor => isLast ? Colors.transparent : (index < currentIndex ? primary.withValues(alpha: 0.3) : lineColor);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCurrent = entry.status == _TimelineStatus.current;
    final isPast = entry.status == _TimelineStatus.past;

    Widget icon = Icon(entry.icon, color: isPast || isCurrent ? primary : const Color(0xFF9CAEA9), size: 22);
    if (entry.icon == Icons.check_circle && isCurrent) {
      icon = Icon(entry.icon, color: primary, size: 22);
    }

    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 38,
            child: Column(
              children: [
                Container(height: 16, width: 2, color: _topLineColor),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    if (isCurrent)
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(color: primary.withValues(alpha: 0.1), shape: BoxShape.circle),
                      ),
                    if (isCurrent)
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(color: primary.withValues(alpha: 0.12), shape: BoxShape.circle),
                      ),
                    icon,
                  ],
                ),
                Container(height: 48, width: 2, color: _bottomLineColor),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (entry.pill != null)
                  Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(entry.pill!, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Color(0xFF11D4C4), letterSpacing: 0.3)),
                  ),
                Text(
                  entry.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: entry.highlight || isCurrent ? primary : const Color(0xFF111817),
                  ),
                ),
                if (entry.subtitle != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      entry.subtitle!,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: isCurrent ? primary : const Color(0xFF618986),
                        fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w400,
                      ),
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
