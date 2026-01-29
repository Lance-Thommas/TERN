import 'package:flutter_application_1/features/adjustments/presentation/uneven_month_screen.dart';
import 'package:flutter_application_1/features/adjustments/presentation/uneven_month_adjustment_offer_screen.dart';
import 'package:flutter_application_1/features/adjustments/presentation/clear_exits_reduce_loss_landlord_screen.dart';
import 'package:flutter_application_1/features/deposit/presentation/deposit_overview_tenant_screen.dart';
import 'package:flutter_application_1/features/deposit/presentation/deposit_overview_screen.dart';
import 'package:flutter_application_1/features/deposit/presentation/deposit_resolution_landlord_screen.dart';
import 'package:flutter_application_1/features/deposit/presentation/move_out_and_deposit_settlement_screen.dart';
import 'package:flutter_application_1/features/deposit/presentation/pre_move_out_deposit_preview_screen.dart';
import 'package:flutter_application_1/features/dev/presentation/developer_nav_screen.dart';
import 'package:flutter_application_1/features/landlord/presentation/landlord_portfolio_screen.dart';
import 'package:flutter_application_1/features/landlord/presentation/landlord_portfolio_timeline_1_screen.dart';
import 'package:flutter_application_1/features/landlord/presentation/landlord_portfolio_timeline_2_screen.dart';
import 'package:flutter_application_1/features/landlord/presentation/landlord_home_screen.dart';
import 'package:flutter_application_1/features/home/presentation/home_screen.dart';
import 'package:flutter_application_1/features/notifications/presentation/notifications_screen.dart';
import 'package:flutter_application_1/features/notifications/presentation/rental_update_impact_landlord_screen.dart';
import 'package:flutter_application_1/features/notifications/presentation/rental_update_what_this_means_for_you_screen.dart';
import 'package:flutter_application_1/features/notifications/presentation/landlord_notification_transition_1_screen.dart';
import 'package:flutter_application_1/features/notifications/presentation/landlord_notification_transition_2_screen.dart';
import 'package:flutter_application_1/features/notifications/presentation/landlord_transition_signal_screen.dart';
import 'package:flutter_application_1/features/notifications/presentation/landlord_rental_rule_update_screen.dart';
import 'package:flutter_application_1/features/notifications/presentation/news_archive_rental_updates_screen.dart';
import 'package:flutter_application_1/features/landlord/presentation/landlord_reclaim_initiate_screen.dart';
import 'package:flutter_application_1/features/landlord/presentation/lease_closure_landlord_screen.dart';
import 'package:flutter_application_1/features/landlord/presentation/tenancy_history_landlord_screen.dart';
import 'package:flutter_application_1/features/landlord/presentation/property_and_lease_setup_landlord_screen.dart';
import 'package:flutter_application_1/features/landlord/presentation/property_and_lease_setup_methods_landlord_screen.dart';
import 'package:flutter_application_1/features/transition/presentation/after_exit_continuity_record_screen.dart';
import 'package:flutter_application_1/features/transition/presentation/early_exit_plan_transition_1_screen.dart';
import 'package:flutter_application_1/features/transition/presentation/early_exit_plan_transition_2_screen.dart';
import 'package:flutter_application_1/features/transition/presentation/transition_and_exit_landlord_screen.dart';
import 'package:flutter_application_1/features/onboarding/presentation/basic_onboarding_screen.dart';
import 'package:flutter_application_1/features/transition/presentation/transition_request_flexibility_screen.dart';
import 'package:flutter_application_1/features/onboarding/presentation/welcome_screen.dart';
import 'package:flutter_application_1/features/onboarding/presentation/rental_rights_introduction_screen.dart';
import 'package:flutter_application_1/features/onboarding/presentation/rent_is_about_timing_screen.dart';
import 'package:flutter_application_1/features/onboarding/presentation/welcome_to_tern_screen.dart';
import 'package:flutter_application_1/features/landlord/presentation/welcome_to_tern_landlord_side_screen.dart';
import 'package:flutter_application_1/features/onboarding/presentation/tern_protects_time_screen.dart';
import 'package:flutter_application_1/features/onboarding/presentation/good_care_has_upside_screen.dart';
import 'package:flutter_application_1/features/onboarding/presentation/create_your_account_screen.dart';
import 'package:flutter_application_1/features/onboarding/presentation/create_your_account_landlord_screen.dart';
import 'package:flutter_application_1/features/onboarding/presentation/connect_bank_account_screen.dart';
import 'package:flutter_application_1/features/onboarding/presentation/lease_connection_screen.dart';
import 'package:flutter_application_1/features/onboarding/presentation/rent_is_about_timing_landlord_screen.dart';
import 'package:flutter_application_1/features/onboarding/presentation/tern_protects_continuity_landlord_screen.dart';
import 'package:flutter_application_1/features/profile/presentation/profile_screen.dart';
import 'package:flutter_application_1/features/renewal/presentation/renewal_screen.dart';
import 'package:flutter_application_1/features/renewal/presentation/renewal_options_landlord_screen.dart';
import 'package:flutter_application_1/features/renewal/presentation/renewal_window_decision_1_screen.dart';
import 'package:flutter_application_1/features/renewal/presentation/renewal_window_decision_2_screen.dart';
import 'package:flutter_application_1/features/renewal/presentation/renew_now_confirmation_screen.dart';
import 'package:flutter_application_1/features/timeline/presentation/timeline_screen.dart';
import 'package:flutter_application_1/features/timeline/presentation/first_timeline_view_1_screen.dart';
import 'package:flutter_application_1/features/timeline/presentation/first_timeline_view_2_screen.dart';
import 'package:flutter_application_1/features/timeline/presentation/first_timeline_view_3_screen.dart';
import 'package:flutter_application_1/features/timeline/presentation/first_timeline_view_4_screen.dart';
import 'package:flutter_application_1/features/timeline/presentation/first_timeline_view_5_screen.dart';
import 'package:flutter_application_1/features/transition/presentation/transition_screen.dart';
import 'package:flutter_application_1/shared/widgets/app_shell.dart';
import 'package:flutter_application_1/shared/widgets/app_shell_landlord.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'root',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/dev',
        name: 'developer-hub',
        builder: (context, state) => const DeveloperNavScreen(),
      ),
      GoRoute(
        path: '/welcome',
        name: 'welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/welcome-to-tern',
        name: 'welcome-to-tern',
        builder: (context, state) => const WelcomeToTernScreen(),
      ),
      GoRoute(
        path: '/onboarding/rent-timing',
        name: 'rent-timing',
        builder: (context, state) => const RentIsAboutTimingScreen(),
      ),
      GoRoute(
        path: '/onboarding/landlord/rent-timing',
        name: 'rent-timing-landlord',
        builder: (context, state) => const RentIsAboutTimingLandlordScreen(),
      ),
      GoRoute(
        path: '/onboarding/tern-protects-time',
        name: 'tern-protects-time',
        builder: (context, state) => const TernProtectsTimeScreen(),
      ),
      GoRoute(
        path: '/onboarding/landlord/protects-continuity',
        name: 'tern-protects-continuity-landlord',
        builder: (context, state) => const TernProtectsContinuityLandlordScreen(),
      ),
      GoRoute(
        path: '/onboarding/good-care',
        name: 'good-care',
        builder: (context, state) => const GoodCareHasUpsideScreen(),
      ),
      GoRoute(
        path: '/onboarding/rental-rights',
        name: 'rental-rights-intro',
        builder: (context, state) => const RentalRightsIntroductionScreen(),
      ),
      GoRoute(
        path: '/onboarding/create-account-screen',
        name: 'create-account-screen',
        builder: (context, state) => const CreateYourAccountScreen(),
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
        builder: (context, state) => const CreateYourAccountLandlordScreen(),
      ),
      GoRoute(
        path: '/onboarding/landlord/property-lease-setup',
        name: 'property-lease-setup-landlord',
        builder: (context, state) => const PropertyAndLeaseSetupMethodsLandlordScreen(),
      ),
      GoRoute(
        path: '/onboarding/property-setup',
        name: 'property-setup-landlord',
        builder: (context, state) => const SetupFirstPropertyLandlordScreen(),
      ),
      GoRoute(
        path: '/onboarding/lease-connection',
        name: 'lease-connection',
        builder: (context, state) => const LeaseConnectionScreen(),
      ),
      GoRoute(
        path: '/onboarding/connect-bank',
        name: 'connect-bank',
        builder: (context, state) => const ConnectBankAccountScreen(),
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
      GoRoute(
        path: '/onboarding/landlord/welcome-side',
        name: 'welcome-landlord-side',
        builder: (context, state) => const WelcomeToTernLandlordSideScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => AppShellLandlord(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/landlord/home',
                name: 'landlord-home',
                builder: (context, state) => const LandlordHomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/landlord/portfolio',
                name: 'landlord-portfolio',
                builder: (context, state) => const LandlordPortfolioTimeline1Screen(),
                routes: [
                  GoRoute(
                    path: 'timeline-2',
                    name: 'landlord-portfolio-timeline-2',
                    builder: (context, state) => const LandlordPortfolioTimeline2Screen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/landlord/decisions',
                name: 'landlord-decisions',
                builder: (context, state) => const LandlordDecisionsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/landlord/profile',
                name: 'landlord-profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => AppShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/home',
                name: 'home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
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
                        builder: (context, state) => const PreMoveOutDepositPreviewScreen(),
                      ),
                      GoRoute(
                        path: 'settlement',
                        name: 'deposit-settlement',
                        builder: (context, state) => const MoveOutAndDepositSettlementScreen(),
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
                        builder: (context, state) => const RenewalOptionsLandlordScreen(),
                      ),
                      GoRoute(
                        path: 'window-1',
                        name: 'renewal-window-1-nested',
                        builder: (context, state) => const RenewalWindowDecision1Screen(),
                      ),
                      GoRoute(
                        path: 'window-2',
                        name: 'renewal-window-2-nested',
                        builder: (context, state) => const RenewalWindowDecision2Screen(),
                      ),
                      GoRoute(
                        path: 'confirm',
                        name: 'renewal-confirm',
                        builder: (context, state) => const RenewNowConfirmationScreen(),
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
                builder: (context, state) => const UnevenMonthAdjustmentOfferScreen(),
                routes: [
                  GoRoute(
                    path: 'uneven-month',
                    name: 'uneven-month',
                    builder: (context, state) => const UnevenMonthScreen(),
                  ),
                  GoRoute(
                    path: 'clear-exits',
                    name: 'clear-exits',
                    builder: (context, state) => const ClearExitsReduceLossLandlordScreen(),
                  ),
                  GoRoute(
                    path: 'offer',
                    name: 'uneven-month-offer-nested',
                    builder: (context, state) => const UnevenMonthAdjustmentOfferScreen(),
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
                    builder: (context, state) => const TenancyHistoryLandlordScreen(),
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
        path: '/app/timeline/view-1',
        name: 'timeline-view-1',
        builder: (context, state) => const FirstTimelineView1Screen(),
      ),
      GoRoute(
        path: '/app/timeline/view-2',
        name: 'timeline-view-2',
        builder: (context, state) => const FirstTimelineView2Screen(),
      ),
      GoRoute(
        path: '/app/timeline/view-3',
        name: 'timeline-view-3',
        builder: (context, state) => const FirstTimelineView3Screen(),
      ),
      GoRoute(
        path: '/app/timeline/view-4',
        name: 'timeline-view-4',
        builder: (context, state) => const FirstTimelineView4Screen(),
      ),
      GoRoute(
        path: '/app/timeline/view-5',
        name: 'timeline-view-5',
        builder: (context, state) => const FirstTimelineView5Screen(),
      ),
      GoRoute(
        path: '/app/timeline/deposit/tenant',
        name: 'deposit-overview-tenant',
        builder: (context, state) => const DepositOverviewTenantScreen(),
      ),
      GoRoute(
        path: '/app/deposit/pre-move-preview',
        name: 'pre-move-out-preview',
        builder: (context, state) => const PreMoveOutDepositPreviewScreen(),
      ),
      GoRoute(
        path: '/app/deposit/move-out-settlement',
        name: 'move-out-deposit-settlement',
        builder: (context, state) => const MoveOutAndDepositSettlementScreen(),
      ),
      GoRoute(
        path: '/app/deposit/resolution-landlord',
        name: 'deposit-resolution-landlord',
        builder: (context, state) => const DepositResolutionLandlordScreen(),
      ),
      GoRoute(
        path: '/app/adjustments/offer',
        name: 'uneven-month-offer',
        builder: (context, state) => const UnevenMonthAdjustmentOfferScreen(),
      ),
      GoRoute(
        path: '/app/renewal/window-1',
        name: 'renewal-window-1',
        builder: (context, state) => const RenewalWindowDecision1Screen(),
      ),
      GoRoute(
        path: '/app/renewal/window-2',
        name: 'renewal-window-2',
        builder: (context, state) => const RenewalWindowDecision2Screen(),
      ),
      GoRoute(
        path: '/app/renewal/confirm',
        name: 'renewal-confirmation',
        builder: (context, state) => const RenewNowConfirmationScreen(),
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
        path: '/app/transition/early-exit/step-1',
        name: 'transition-early-exit-step-1',
        builder: (context, state) => const EarlyExitPlanTransition1Screen(),
      ),
      GoRoute(
        path: '/app/transition/early-exit/step-2',
        name: 'transition-early-exit-step-2',
        builder: (context, state) => const EarlyExitPlanTransition2Screen(),
      ),
      GoRoute(
        path: '/app/landlord/clear-exits',
        name: 'landlord-clear-exits',
        builder: (context, state) => const ClearExitsReduceLossLandlordScreen(),
      ),
      GoRoute(
        path: '/app/transition/request-flexibility',
        name: 'transition-flexibility',
        builder: (context, state) => const TransitionRequestFlexibilityScreen(),
      ),
      GoRoute(
        path: '/app/transition/landlord',
        name: 'transition-landlord',
        builder: (context, state) => const TransitionAndExitLandlordScreen(),
      ),
      GoRoute(
        path: '/app/transition/reclaim-initiate',
        name: 'reclaim-initiate',
        builder: (context, state) => const LandlordReclaimInitiateScreen(),
      ),
      GoRoute(
        path: '/app/transition/lease-closure',
        name: 'lease-closure',
        builder: (context, state) => const LeaseClosureLandlordScreen(),
      ),
      GoRoute(
        path: '/app/notifications',
        name: 'notifications-root',
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: '/app/notifications/archive',
        name: 'notifications-archive',
        builder: (context, state) => const NewsArchiveRentalUpdatesScreen(),
      ),
      GoRoute(
        path: '/app/notifications/update',
        name: 'notifications-update',
        builder: (context, state) => const RentalUpdateWhatThisMeansForYouScreen(),
      ),
      GoRoute(
        path: '/app/notifications/update-landlord',
        name: 'notifications-update-landlord',
        builder: (context, state) => const RentalUpdateImpactLandlordScreen(),
      ),
      GoRoute(
        path: '/app/notifications/landlord/transition-signal',
        name: 'notifications-landlord-transition',
        builder: (context, state) => const LandlordTransitionSignalScreen(),
      ),
      GoRoute(
        path: '/app/notifications/landlord/transition-1',
        name: 'notifications-landlord-transition-1',
        builder: (context, state) => const LandlordNotificationTransition1Screen(),
      ),
      GoRoute(
        path: '/app/notifications/landlord/transition-2',
        name: 'notifications-landlord-transition-2',
        builder: (context, state) => const LandlordNotificationTransition2Screen(),
      ),
      GoRoute(
        path: '/app/notifications/landlord/rental-rule',
        name: 'notifications-landlord-rule',
        builder: (context, state) => const LandlordRentalRuleUpdateScreen(),
      ),
      GoRoute(
        path: '/app/transition/continuity-record',
        name: 'continuity-record',
        builder: (context, state) => const AfterExitContinuityRecordScreen(),
      ),
      GoRoute(
        path: '/app/landlord/reclaim/initiate',
        name: 'landlord-reclaim-initiate',
        builder: (context, state) => const LandlordReclaimInitiateScreen(),
      ),
      GoRoute(
        path: '/app/landlord/history',
        name: 'landlord-history',
        builder: (context, state) => const TenancyHistoryLandlordScreen(),
      ),
    ],
  );
});
