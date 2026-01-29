import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _exit2Bg = Color(0xFFF6F8F8);
const _exit2Primary = Color(0xFF17CFB0);

class EarlyExitPlanTransition2Screen extends StatelessWidget {
  const EarlyExitPlanTransition2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _exit2Bg,
      appBar: AppBar(
        backgroundColor: _exit2Bg,
        elevation: 0,
        actions: const [
          // TODO(remove): temporary screen acronym during early development
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Text('EEPT2', style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/app/transition/early-exit');
            }
          },
        ),
        title: const Text('Plan Transition'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 140),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _InfoBanner(),
                  const SizedBox(height: 12),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Life happens.\n',
                          style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800, height: 1.1),
                        ),
                        TextSpan(
                          text: 'Secure your exit.',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            foreground: Paint()
                              ..shader = const LinearGradient(colors: [_exit2Primary, Color(0xFF13A89E)])
                                  .createShader(const Rect.fromLTWH(0, 0, 200, 40)),
                            height: 1.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Initiate an early exit to protect your rental history and freeze penalties.',
                    style: theme.textTheme.bodyMedium?.copyWith(color: const Color(0xFF6E7B78), height: 1.5),
                  ),
                  const SizedBox(height: 14),
                  _ProtectionCard(),
                  const SizedBox(height: 16),
                  Text('Reason for exit  (Optional & Non-binding)', style: theme.textTheme.bodySmall?.copyWith(color: const Color(0xFF6E7B78), fontWeight: FontWeight.w700)),
                  const SizedBox(height: 10),
                  _ReasonChips(),
                  const SizedBox(height: 16),
                  Text('What happens next?', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                  const SizedBox(height: 10),
                  _TimelineSteps(),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.95),
                border: const Border(top: BorderSide(color: Color(0xFFDCE5E4))),
                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, -3))],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Early exit costs stay capped', style: TextStyle(color: Color(0xFF6E7B78), fontWeight: FontWeight.w700)),
                      Icon(Icons.info_outline, color: Color(0xFF6E7B78)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _exit2Primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 6,
                        shadowColor: _exit2Primary.withValues(alpha: 0.3),
                      ),
                      icon: const Icon(Icons.logout),
                      label: const Text('Signal Early Exit', style: TextStyle(fontWeight: FontWeight.w800)),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This does not break your lease immediately. It safely starts the protection plan.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall?.copyWith(color: const Color(0xFF7A8584)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFDCE5E4)),
        gradient: const LinearGradient(colors: [Colors.white, Color(0xFFF8F8F8)]),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(Icons.info_outline, color: Color(0xFF6E7B78)),
          SizedBox(width: 10),
          Expanded(
            child: Text('Early exit costs remain capped as per your lease.', style: TextStyle(color: Color(0xFF6E7B78), fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}

class _ProtectionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFDCE5E4)),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3))],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(color: _exit2Primary.withValues(alpha: 0.15), shape: BoxShape.circle),
                      child: const Icon(Icons.shield_outlined, color: _exit2Primary),
                    ),
                    const SizedBox(width: 10),
                    Text('Protection Activated', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  "Signaling an exit changes your lease state to 'Transition'. This freezes penalty escalation immediately.",
                  style: theme.textTheme.bodySmall?.copyWith(color: const Color(0xFF6E7B78), height: 1.4),
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
                'https://lh3.googleusercontent.com/aida-public/AB6AXuAyBNrn3RTptWMO7sNEquS6FDDlQW9Xg1JtBHiQ6SW6NMLuEO8mwElyyOGeCSMG0jwybhm6HsfewOPC_N2Ayexb4FtNU8XCGU5iWoc3Vk6o-ikU5ZJz_bbWLNEbAz-I7jvvzc-OstWQVFu9ieqcjx1Rs2UgO55x9lADFaQcyg46SsQOoDXL8srwvMxOiI2L4ciD_4pCru8OsLYcUVRt-4EMQuLkmMmUgiojXUw3ei93j95SIe1hY5gltqPcey7-b3F-qqC9f1nHSHoh',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReasonChips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reasons = [
      ('work', Icons.work, 'Job Relocation'),
      ('trending_down', Icons.trending_down, 'Job Loss'),
      ('family_restroom', Icons.family_restroom, 'Family Shift'),
      ('', null, 'Other'),
    ];
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: reasons.map((r) {
        final icon = r.$2;
        final label = r.$3;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFEEF0EF),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.transparent),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, color: const Color(0xFF6E7B78), size: 18),
                const SizedBox(width: 6),
              ],
              Text(label, style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF181511))),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _TimelineSteps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final steps = const [
      ('Lease State: Transition', 'Status changes immediately. Penalties freeze.', true),
      ('Timeline Review', "We'll calculate your bounded costs and options.", false),
      ('Relisting', 'TERN begins marketing your unit to fill the gap.', false),
    ];
    return Column(
      children: steps.map((s) {
        final active = s.$3;
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: active ? _exit2Primary : const Color(0xFFB0B8B7),
                      shape: BoxShape.circle,
                      border: Border.all(color: active ? _exit2Primary : const Color(0xFFB0B8B7), width: 2),
                    ),
                  ),
                  Container(
                    width: 2,
                    height: 32,
                    color: const Color(0xFFD6DEDD),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(s.$1, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
                    const SizedBox(height: 4),
                    Text(s.$2, style: const TextStyle(color: Color(0xFF6E7B78), fontSize: 12, height: 1.4)),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
