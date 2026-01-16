import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _roPrimary = Color(0xFF1EE6D2);
const _roBg = Color(0xFFF6F8F8);

class RenewalOptionsLandlordScreen extends StatelessWidget {
  const RenewalOptionsLandlordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _roBg,
      appBar: AppBar(
        backgroundColor: _roBg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go('/dev'),
        ),
        title: const Text('Renewal Options'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(colors: [_roPrimary, Color(0xFF12A596)]).createShader(bounds),
                  child: const Text('123 Maple Avenue, Apt 4B', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white)),
                ),
                const SizedBox(height: 6),
                const Text('This property\'s lease is nearing a decision point. Review your options below.', style: TextStyle(color: Color(0xFF111817), height: 1.4)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _OptionCard(
            title: 'Renew Lease',
            body: 'Keep current tenant. Maintain rental income continuity without interruption.',
            icon: Icons.published_with_changes,
            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDDc18Cz9WlCsoYWwCI976YsREO3KK0TfcJtDS3MSB5p8j2-puqQZfuw_PEbw518SrvEvp8my3LxIlDqXsMxFU7zQ5dnXj89N0u740yMkIFsBAhcCDEKk3dK0psQ1xlBsKamBzvbcHaPFYVw_vueEf1_s72k5KPHdgQTbzY0hz_Zaa4fFRfYdoG_-bFa9dGEP8GG-C1fD-YjG7vJAD-MKgKzlXzBQ-LyAGo5lX-r3VVVJ4aYiw81bAPUwNqQujbWg3BbH_3o4e3HoM3',
            buttonLabel: 'Select Renewal',
            buttonStyle: const _PrimaryButtonStyle(),
            onTap: () {},
          ),
          _OptionCard(
            title: 'Prepare Reclaim',
            body: 'End the lease to use the property yourself or prepare it for sale.',
            icon: Icons.vpn_key,
            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAjUJl-OREMUv6PtF1FfWGZJJPY03iPwSj9FU9Qzh3i0Ztz1lvkedd_Xp-r3ZqT9toTZL6FBJbMr-RxqL7OvUYN5VjX7KVPEfm2QoqvAwXUv4AFCTQZbWxQe7Lv71yb40rdDJj8aPyKUFNMhoyCrSzz1Ob4ogb6T6OEG4Ve8Su_uE15S6sakZAf5HGN12Ns6bn31b71EZ0Oh_EfRuuHdbHTr2aFGfHA9L_Mv8-d1oZYfX_a3nVMzTowHm8wLdwvrRnahWzzMltf-5LJ',
            buttonLabel: 'Begin Reclaim',
            buttonStyle: const _OutlineButtonStyle(),
            onTap: () => context.push('/app/transition/reclaim-initiate'),
          ),
          _OptionCard(
            title: 'Allow Transition',
            body: 'Tenant exits. We help you market and screen for a new resident.',
            icon: Icons.move_up,
            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCxX6V_3u76lZtGd8P1sxudcATF0XQXaEOjjuzZ5wlMhc_I_QIVXLPTqI4djpoS_0_-nvXzst22EEfmCKCwFfy5whMOUQq0XqXjvWaF9lO30F-icxOHVMOE9jHNCR05GxUAKO2oIl4urvVrUgrXmiTCclB1gOWuUQ_VtFmE-YP9ahdU3ph7EsbJvBKrSiLfphInRa06XwZehIYIfbsdeqsq86rHoPay5roIY-rrjZps0uK_xRX26M4gpv-VZji4oDAvm09-bwz-lLWB',
            buttonLabel: 'Plan Transition',
            buttonStyle: const _GhostButtonStyle(),
            onTap: () => context.push('/app/transition/landlord'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 8),
            child: Center(
              child: TextButton.icon(
                onPressed: () => context.push('/app/landlord/portfolio/timeline-1'),
                icon: const Icon(Icons.arrow_forward, color: _roPrimary, size: 18),
                label: const Text('View Impact & Timelines', style: TextStyle(color: _roPrimary, fontWeight: FontWeight.w700)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OptionCard extends StatelessWidget {
  const _OptionCard({
    required this.title,
    required this.body,
    required this.icon,
    required this.imageUrl,
    required this.buttonLabel,
    required this.buttonStyle,
    required this.onTap,
  });

  final String title;
  final String body;
  final IconData icon;
  final String imageUrl;
  final String buttonLabel;
  final _ButtonStyle buttonStyle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          height: 230,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3))],
            image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: buttonStyle.overlay,
                  border: Border.all(color: Colors.black.withValues(alpha: 0.05)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Row(
                      children: [
                        Icon(icon, color: buttonStyle.iconColor, size: 24),
                        const SizedBox(width: 8),
                        Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 20)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(body, style: const TextStyle(color: Colors.white70, height: 1.3)),
                    const SizedBox(height: 12),
                    buttonStyle.buildButton(label: buttonLabel, onPressed: onTap),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

abstract class _ButtonStyle {
  const _ButtonStyle();
  LinearGradient get overlay;
  Color get iconColor;
  Widget buildButton({required String label, required VoidCallback onPressed});
}

class _PrimaryButtonStyle extends _ButtonStyle {
  const _PrimaryButtonStyle();

  @override
  LinearGradient get overlay => const LinearGradient(colors: [Colors.black87, Colors.black54], begin: Alignment.bottomCenter, end: Alignment.topCenter);

  @override
  Color get iconColor => _roPrimary;

  @override
  Widget buildButton({required String label, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _roPrimary,
          foregroundColor: const Color(0xFF111817),
          padding: const EdgeInsets.symmetric(vertical: 11),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.w800)),
      ),
    );
  }
}

class _OutlineButtonStyle extends _ButtonStyle {
  const _OutlineButtonStyle();

  @override
  LinearGradient get overlay => const LinearGradient(colors: [Colors.black87, Colors.black54], begin: Alignment.bottomCenter, end: Alignment.topCenter);

  @override
  Color get iconColor => Colors.white;

  @override
  Widget buildButton({required String label, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.white.withValues(alpha: 0.5), width: 2),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 11),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.w800)),
      ),
    );
  }
}

class _GhostButtonStyle extends _ButtonStyle {
  const _GhostButtonStyle();

  @override
  LinearGradient get overlay => const LinearGradient(colors: [Colors.black87, Colors.black54], begin: Alignment.bottomCenter, end: Alignment.topCenter);

  @override
  Color get iconColor => Colors.white70;

  @override
  Widget buildButton({required String label, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.white.withValues(alpha: 0.2)),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 11),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.w800)),
      ),
    );
  }
}
