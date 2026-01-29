import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _thBg = Color(0xFFF6F8F8);
const _thPrimary = Color(0xFF1EE6D2);

class TenancyHistoryLandlordScreen extends StatelessWidget {
  const TenancyHistoryLandlordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _thBg,
      appBar: AppBar(
        backgroundColor: _thBg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/app/landlord/history');
            }
          },
        ),
        title: const Text('Tenancy History'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFF111817), _thPrimary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: const Text(
                    "Your portfolio's continuity record.",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Unbiased and verified history of your property assets. This record preserves neutrality.',
                  style: TextStyle(color: Color(0xFF638884), height: 1.4),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _FilterChips(),
          const SizedBox(height: 12),
          _HistoryCard(
            title: 'Unit 4B, The Highland Lofts',
            dateRange: 'Mar 2022 – May 2023',
            tenant: 'Tenant: John D.',
            status: 'Lease Concluded',
            statusColor: Colors.grey,
            duration: '14 Months',
          ),
          _HistoryCard(
            title: '221B Baker Street, Apt 2',
            dateRange: 'Jan 2020 – Dec 2021',
            tenant: 'Tenant: Sarah M.',
            status: 'Transferred',
            statusColor: _thPrimary,
            duration: '24 Months',
          ),
          _HistoryCard(
            title: 'The Arches, Studio 5',
            dateRange: 'Jun 2018 – Dec 2019',
            tenant: 'Tenant: Alex R.',
            status: 'Lease Ended',
            statusColor: Colors.grey,
            duration: '18 Months',
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE5E9E8)),
              ),
              child: Row(
                children: const [
                  Icon(Icons.verified_user, color: Color(0xFF9CA3AF)),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'This record preserves neutrality and does not include subjective tenant scoring.',
                      style: TextStyle(color: Color(0xFF6B7280), fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
      bottomNavigationBar: const _LandlordBottomNav(selectedIndex: 1),
    );
  }
}

class _FilterChips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chips = ['Sort by Date', 'Filter by Property', 'Status'];
    return SizedBox(
      height: 46,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(chips[index], style: const TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(width: 4),
                const Icon(Icons.keyboard_arrow_down, size: 18),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: chips.length,
      ),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  const _HistoryCard({
    required this.title,
    required this.dateRange,
    required this.tenant,
    required this.status,
    required this.statusColor,
    required this.duration,
  });

  final String title;
  final String dateRange;
  final String tenant;
  final String status;
  final Color statusColor;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.apartment, color: Color(0xFF6B7280)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today, size: 14, color: Color(0xFF6B7280)),
                          const SizedBox(width: 4),
                          Text(dateRange, style: const TextStyle(color: Color(0xFF6B7280))),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.person, size: 14, color: Color(0xFF6B7280)),
                          const SizedBox(width: 4),
                          Text(tenant, style: const TextStyle(color: Color(0xFF6B7280))),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(width: 10, height: 10, decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle)),
                    const SizedBox(width: 6),
                    Text(status, style: const TextStyle(color: Color(0xFF111817), fontWeight: FontWeight.w700)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _thBg,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(duration, style: const TextStyle(color: Color(0xFF638884), fontWeight: FontWeight.w600, fontSize: 12)),
                ),
              ],
            ),
          ],
        ),
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
