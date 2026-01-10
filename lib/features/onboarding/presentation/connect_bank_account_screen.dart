import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConnectBankAccountScreen extends StatelessWidget {
  const ConnectBankAccountScreen({super.key});

  static const _bg = Color(0xFFF6F8F8);
  static const _primary = Color(0xFF11D4C4);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        backgroundColor: _bg,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/');
            }
          },
        ),
        title: ShaderMask(
          shaderCallback: (rect) => const LinearGradient(
            colors: [_primary, Color(0xFF0E968B)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(rect),
          child: Text(
            'Connect Bank Account',
            style: theme.textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.2,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                child: Column(
                  children: [
                    const SizedBox(height: 6),
                    Text(
                      'Connect your bank to pay rent smoothly and on time.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF111817),
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.verified_user, size: 18, color: Colors.grey),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 260,
                          child: Text(
                            'TERN can only access rent payments — nothing else.',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _BankGrid(primary: _primary),
                    const SizedBox(height: 20),
                    Text(
                      'By connecting, you agree to our Terms of Service and Privacy Policy.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              decoration: BoxDecoration(
                color: _bg,
                border: Border(top: BorderSide(color: Colors.grey.shade200)),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: () => context.go('/app/timeline'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primary,
                    foregroundColor: const Color(0xFF102220),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 4,
                    shadowColor: _primary.withValues(alpha: 0.25),
                    textStyle: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  icon: const Icon(Icons.lock, size: 20),
                  label: const Text('Connect My Bank'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BankGrid extends StatelessWidget {
  const _BankGrid({required this.primary});
  final Color primary;

  Widget _tile({required IconData icon, required String label, Color? iconColor, Color? bg}) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: bg ?? Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor ?? Colors.grey.shade800, size: 26),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _tile(icon: Icons.account_balance_wallet, label: 'Wio Bank', iconColor: Colors.grey.shade800, bg: Colors.grey.shade100)),
            const SizedBox(width: 12),
            Expanded(child: _tile(icon: Icons.account_balance, label: 'Emirates NBD', iconColor: Colors.blue.shade700, bg: Colors.blue.shade50)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _tile(icon: Icons.account_balance, label: 'FAB', iconColor: Colors.indigo.shade700, bg: Colors.indigo.shade50)),
            const SizedBox(width: 12),
            Expanded(child: _tile(icon: Icons.account_balance, label: 'HSBC', iconColor: Colors.red.shade600, bg: Colors.red.shade50)),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(color: Colors.grey.shade100, shape: BoxShape.circle),
                child: Icon(Icons.search, color: Colors.grey.shade600),
              ),
              const SizedBox(width: 10),
              Text('Find another bank', style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ],
    );
  }
}
