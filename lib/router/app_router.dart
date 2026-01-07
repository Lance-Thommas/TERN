import 'package:flutter_application_1/features/adjustments/presentation/adjustments_screen.dart';
import 'package:flutter_application_1/features/adjustments/presentation/uneven_month_screen.dart';
import 'package:flutter_application_1/features/deposit/presentation/deposit_overview_screen.dart';
import 'package:flutter_application_1/features/landlord/presentation/landlord_portfolio_screen.dart';
import 'package:flutter_application_1/features/notifications/presentation/notifications_screen.dart';
import 'package:flutter_application_1/features/onboarding/presentation/basic_onboarding_screen.dart';
import 'package:flutter_application_1/features/onboarding/presentation/welcome_screen.dart';
import 'package:flutter_application_1/features/profile/presentation/profile_screen.dart';
import 'package:flutter_application_1/features/renewal/presentation/renewal_screen.dart';
import 'package:flutter_application_1/features/timeline/presentation/timeline_screen.dart';
import 'package:flutter_application_1/features/transition/presentation/transition_screen.dart';
import 'package:flutter_application_1/shared/widgets/app_shell.dart';
import 'package:flutter_application_1/shared/widgets/placeholder_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/welcome',
    routes: [
      GoRoute(
        path: '/welcome',
        name: 'welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/onboarding/create-account',
        name: 'create-account',
        builder: (context, state) => const BasicOnboardingScreen(
          title: 'Create Your Account',
          designRef: 'create_your_account',
          description: 'Collect phone/email, send verification code (mocked).',
          nextPath: '/onboarding/lease-connection',
        ),
      ),
      GoRoute(
        path: '/onboarding/create-account-landlord',
        name: 'create-account-landlord',
        builder: (context, state) => const BasicOnboardingScreen(
          title: 'Create Your Account (Landlord)',
          designRef: 'create_your_account_landlord',
          description: 'Landlord-specific sign up; invite tenants later (mocked).',
          nextPath: '/onboarding/property-setup',
        ),
      ),
      GoRoute(
        path: '/onboarding/lease-connection',
        name: 'lease-connection',
        builder: (context, state) => const BasicOnboardingScreen(
          title: 'Lease Connection',
          designRef: 'lease_connection',
          description: 'Upload or link lease; AI extraction is mocked.',
          nextPath: '/onboarding/connect-bank',
        ),
      ),
      GoRoute(
        path: '/onboarding/connect-bank',
        name: 'connect-bank',
        builder: (context, state) => const BasicOnboardingScreen(
          title: 'Connect Bank Account',
          designRef: 'connect_bank_account',
          description: 'Simulated Lean OAuth flow; no real bank calls.',
          nextPath: '/app/timeline',
        ),
      ),
      GoRoute(
        path: '/onboarding/learn',
        name: 'onboarding-learn',
        builder: (context, state) => const BasicOnboardingScreen(
          title: 'See how it works',
          designRef: 'good_care_has_upside / rent_is_about_timing',
          description: 'Education screens; calm tone; no inputs.',
          nextPath: '/welcome',
          secondaryPath: '/app/timeline',
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => AppShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/timeline',
                name: 'timeline',
                builder: (context, state) => const TimelineScreen(),
                routes: [
                  GoRoute(
                    path: 'deposit',
                    name: 'deposit-overview',
                    builder: (context, state) => const DepositOverviewScreen(),
                    routes: [
                      GoRoute(
                        path: 'preview',
                        name: 'deposit-preview',
                        builder: (context, state) => const PlaceholderScreen(
                          title: 'Pre-Move-Out Deposit Preview',
                          designRef: 'pre-move-out_deposit_preview',
                          description: 'Guided capture and preview — mocked.',
                        ),
                      ),
                      GoRoute(
                        path: 'settlement',
                        name: 'deposit-settlement',
                        builder: (context, state) => const PlaceholderScreen(
                          title: 'Move-Out & Deposit Settlement',
                          designRef: 'move-out_and_deposit_settlement',
                          description: 'Settlement summary and receipt (mocked).',
                        ),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'renewal',
                    name: 'renewal',
                    builder: (context, state) => const RenewalScreen(),
                    routes: [
                      GoRoute(
                        path: 'options',
                        name: 'renewal-options',
                        builder: (context, state) => const PlaceholderScreen(
                          title: 'Renewal Options (Landlord)',
                          designRef: 'renewal_options_landlord',
                          description: 'Landlord view of renew/reclaim/transition choices.',
                        ),
                      ),
                      GoRoute(
                        path: 'confirm',
                        name: 'renewal-confirm',
                        builder: (context, state) => const PlaceholderScreen(
                          title: 'Renew Now Confirmation',
                          designRef: 'renew_now_confirmation',
                          description: 'Confirm renewal and update timeline (mocked).',
                        ),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'rule-update',
                    name: 'rule-update',
                    builder: (context, state) => const NotificationsScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/adjustments',
                name: 'adjustments',
                builder: (context, state) => const AdjustmentsScreen(),
                routes: [
                  GoRoute(
                    path: 'uneven-month',
                    name: 'uneven-month',
                    builder: (context, state) => const UnevenMonthScreen(),
                  ),
                  GoRoute(
                    path: 'clear-exits',
                    name: 'clear-exits',
                    builder: (context, state) => const PlaceholderScreen(
                      title: 'Clear Exits Reduce Loss',
                      designRef: 'clear_exits_reduce_loss_landlord',
                      description: 'Explain calm endings for landlords; mocked states.',
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/profile',
                name: 'profile',
                builder: (context, state) => const ProfileScreen(),
                routes: [
                  GoRoute(
                    path: 'history',
                    name: 'history',
                    builder: (context, state) => const PlaceholderScreen(
                      title: 'Tenancy History',
                      designRef: 'tenancy_history_landlord / after_exit_continuity_record',
                      description: 'Read-only continuity record (mocked).',
                    ),
                  ),
                  GoRoute(
                    path: 'notifications',
                    name: 'notifications',
                    builder: (context, state) => const NotificationsScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/app/transition/early-exit',
        name: 'transition-early-exit',
        builder: (context, state) => const TransitionScreen(
          title: 'Early Exit Plan',
          designRef: 'early_exit_plan_transition_1-2',
        ),
      ),
      GoRoute(
        path: '/app/transition/request-flexibility',
        name: 'transition-flexibility',
        builder: (context, state) => const TransitionScreen(
          title: 'Request Flexibility',
          designRef: 'transition_request_flexibility',
        ),
      ),
      GoRoute(
        path: '/app/transition/landlord',
        name: 'transition-landlord',
        builder: (context, state) => const TransitionScreen(
          title: 'Transition & Exit (Landlord)',
          designRef: 'transition_and_exit_(landlord)',
        ),
      ),
      GoRoute(
        path: '/app/transition/reclaim-initiate',
        name: 'reclaim-initiate',
        builder: (context, state) => const TransitionScreen(
          title: 'Landlord Reclaim',
          designRef: 'landlord_reclaim_initiate',
        ),
      ),
      GoRoute(
        path: '/app/transition/lease-closure',
        name: 'lease-closure',
        builder: (context, state) => const TransitionScreen(
          title: 'Lease Closure',
          designRef: 'lease_closure_landlord',
        ),
      ),
      GoRoute(
        path: '/app/notifications',
        name: 'notifications-root',
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: '/app/landlord/portfolio',
        name: 'landlord-portfolio',
        builder: (context, state) => const LandlordPortfolioScreen(),
      ),
    ],
  );
});
