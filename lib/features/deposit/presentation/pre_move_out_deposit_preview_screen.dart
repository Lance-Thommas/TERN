import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _previewBg = Color(0xFFF6F8F8);
const _previewPrimary = Color(0xFF11D4C4);

class PreMoveOutDepositPreviewScreen extends StatelessWidget {
  const PreMoveOutDepositPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _previewBg,
      appBar: AppBar(
        backgroundColor: _previewBg,
        elevation: 0,
        actions: const [
          // TODO(remove): temporary screen acronym during early development
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Text('PDP', style: TextStyle(fontWeight: FontWeight.w700)),
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
        title: const Text('Deposit Preview'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Don't guess. Know your deposit status.",
                    style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800, height: 1.2, color: const Color(0xFF111817)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Address issues now to maximize your return. Preview your move-out outcome in 3 simple steps.',
                    style: theme.textTheme.bodyMedium?.copyWith(color: const Color(0xFF6A7B78), height: 1.4),
                  ),
                  const SizedBox(height: 16),
                  _ComparisonCard(),
                  const SizedBox(height: 16),
                  _Steps(),
                  const SizedBox(height: 12),
                  _Outcomes(),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 18),
                decoration: BoxDecoration(
                  color: _previewBg.withValues(alpha: 0.95),
                  border: const Border(top: BorderSide(color: Color(0xFFE1E5E4))),
                  boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, -2))],
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _previewPrimary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      elevation: 6,
                      shadowColor: _previewPrimary.withValues(alpha: 0.25),
                    ),
                    icon: const Icon(Icons.play_circle, size: 20),
                    label: const Text('Start Pre-Move-Out Check', style: TextStyle(fontWeight: FontWeight.w800)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ComparisonCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E9E8)),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Example Comparison', style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(color: _previewPrimary.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
                child: Text('AI Powered', style: theme.textTheme.labelSmall?.copyWith(color: _previewPrimary, fontWeight: FontWeight.w800)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 140,
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuBc9nJC8_VUX5h6haIoC7hrWbtkDIpHFr3f0TaV15OTuXlqSzaeCdSyn5_PzTBL6894BseA1-fNB2I2wWsttYkyKTGVxFxdQ6137NbVsiy9rAUdAuMcOEZ79pbkfhUmYEGH0ncY9zvezOjOV0AAIz6lLQIg5NOBxCoIL1yI2GoNr1lIIn7j6l31Vfxiw6A5z8Lmo7n9KknFe3nTZlpzt_QpHwBJTnU1r159CxdY0GdQJ9zKtGI6f3KDXloRtQrAhukbZlAVZ1vbexeL',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.6),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Move-In (Aug 2023)',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.compare_arrows, color: Color(0xFF9CAEA9)),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: _previewPrimary.withValues(alpha: 0.4), style: BorderStyle.solid),
                      color: _previewPrimary.withValues(alpha: 0.06),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.add_a_photo, color: _previewPrimary, size: 30),
                        SizedBox(height: 6),
                        Text('Your Photo', style: TextStyle(color: _previewPrimary, fontWeight: FontWeight.w600)),
                      ],
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

class _Steps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Widget step(IconData icon, String title, String subtitle) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(color: _previewPrimary.withValues(alpha: 0.2), shape: BoxShape.circle),
                child: Icon(icon, color: _previewPrimary, size: 18),
              ),
              Container(width: 2, height: 36, color: const Color(0xFFE1E5E4)),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: theme.textTheme.bodySmall?.copyWith(color: const Color(0xFF6A7B78), height: 1.4)),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('How it works', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
        const SizedBox(height: 10),
        step(Icons.photo_camera, 'Snap photos of current condition', 'Capture key areas like walls and floors.'),
        step(Icons.difference, 'AI Comparison against move-in', 'We check for changes automatically.'),
        step(Icons.price_check, 'Get your estimated return', 'Know what to fix before you leave.'),
      ],
    );
  }
}

class _Outcomes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget card({required Color stripe, required IconData icon, required Color iconColor, required String title, required String pill, required Color pillBg, required Color pillText, required String body}) {
      return Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border(
            top: const BorderSide(color: Color(0xFFE5E9E8)),
            right: const BorderSide(color: Color(0xFFE5E9E8)),
            bottom: const BorderSide(color: Color(0xFFE5E9E8)),
            left: BorderSide(color: stripe, width: 4),
          ),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: pillBg, borderRadius: BorderRadius.circular(10)),
                        child: Text(pill, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: pillText)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(body, style: theme.textTheme.bodySmall?.copyWith(color: const Color(0xFF6A7B78), height: 1.4)),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Potential Outcomes', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
        const SizedBox(height: 10),
        card(
          stripe: const Color(0xFFC6CED6),
          icon: Icons.check_circle,
          iconColor: const Color(0xFF9CA3AF),
          title: 'Normal Wear',
          pill: 'Covered',
          pillBg: const Color(0xFFF1F5F9),
          pillText: const Color(0xFF6B7280),
          body: 'Small scuffs, nail holes, or faded paint. No deduction from your deposit.',
        ),
        const SizedBox(height: 10),
        card(
          stripe: _previewPrimary,
          icon: Icons.home_repair_service,
          iconColor: _previewPrimary,
          title: 'Minor Issues',
          pill: 'Maintenance',
          pillBg: _previewPrimary.withValues(alpha: 0.12),
          pillText: _previewPrimary,
          body: 'Loose handles or deep cleaning needs. Often covered by TERN or maintenance.',
        ),
        const SizedBox(height: 10),
        card(
          stripe: const Color(0xFFF59E0B),
          icon: Icons.warning,
          iconColor: const Color(0xFFF59E0B),
          title: 'Material Damage',
          pill: 'Action Needed',
          pillBg: const Color(0xFFFEF3C7),
          pillText: const Color(0xFFB45309),
          body: 'Broken glass, large stains, or hardware damage. View fix-it guides to avoid fees.',
        ),
      ],
    );
  }
}
