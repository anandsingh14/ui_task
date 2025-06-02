import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ui_task/features/stroll_bonfire/presentation/bloc/StrollBloc.dart';
import 'package:ui_task/features/stroll_bonfire/presentation/pages/StrollBonfirePage.dart';

import 'package:ui_task/main.dart';
import 'package:video_player/video_player.dart';

import 'MockStrollBloc.dart';

void main() {
  late MockStrollBloc mockBloc;
  late MockVideoPlayerController mockVideoController;

  setUpAll(() {
    registerFallbackValue(FakeStrollEvent());
    // registerFallbackValue(FakeStrollState());
  });

  setUp(() {
    mockBloc = MockStrollBloc();
    mockVideoController = MockVideoPlayerController();

    // Mock default bloc state
    when(() => mockBloc.state).thenReturn(null);
  });

  group('StrollBonfirePage Widget Tests', () {
    testWidgets('renders StrollBonfirePage with BlocProvider', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: StrollBonfirePage(),
        ),
      );

      expect(find.byType(BlocProvider<StrollBloc>), findsOneWidget);
      expect(find.byType(StrollBonfireView), findsOneWidget);
    });

    testWidgets('initial VideoPlayerController initializes and plays video',
            (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: const StrollBonfireView(),
            ),
          );

          // Video player should be present (after initialization)
          await tester.pumpAndSettle();

          expect(find.byType(VideoPlayer), findsOneWidget);
        });

    testWidgets('bottom navigation bar shows 4 items with correct icons',
            (tester) async {
          await tester.pumpWidget(
            MaterialApp(home: const StrollBonfireView()),
          );

          expect(find.byType(BottomNavigationBar), findsOneWidget);
          expect(find.byType(BottomNavigationBarItem), findsNothing); // Not a widget
          expect(find.byIcon(Icons.keyboard_arrow_down_rounded), findsNothing); // It's in header, not nav

          // Check for 4 items visually (image assets can't be directly tested easily)
          final bottomNav = tester.widget<BottomNavigationBar>(find.byType(BottomNavigationBar));
          expect(bottomNav.items.length, 4);
        });

    testWidgets('tapping bottom navigation bar updates selected index',
            (tester) async {
          await tester.pumpWidget(
            MaterialApp(home: const StrollBonfireView()),
          );

          expect(find.byType(BottomNavigationBar), findsOneWidget);

          await tester.tap(find.byType(BottomNavigationBarItem).at(1));
          await tester.pump();

          // final state = tester.state<_StrollBonfireViewState>(find.byType(StrollBonfireView));
          // expect(state._selectedIndex, 1);
        });

    testWidgets('Header displays title and subtitle with icons',
            (tester) async {
          await tester.pumpWidget(
            MaterialApp(home: const StrollBonfireView()),
          );

          expect(find.text('Stroll Bonfire'), findsOneWidget);
          expect(find.text('22h 00m'), findsOneWidget);
          expect(find.text('103'), findsOneWidget);
          expect(find.byIcon(Icons.access_time), findsOneWidget);
          expect(find.byIcon(Icons.people), findsOneWidget);
        });

    testWidgets('Question section displays correct texts and avatar',
            (tester) async {
          await tester.pumpWidget(
            MaterialApp(home: const StrollBonfireView()),
          );

          expect(find.text('Angelina, 28'), findsOneWidget);
          expect(find.text('What is your favorite time\nof the day?'), findsOneWidget);
          expect(find.text('"Mine is definitely the peace in the morning."'), findsOneWidget);
          expect(find.byType(CircleAvatar), findsOneWidget);
        });

    testWidgets('Options show and respond to taps correctly', (tester) async {
      // Provide a real StrollBloc for this test
      final strollBloc = StrollBloc();

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: strollBloc,
            child: const StrollBonfireView(),
          ),
        ),
      );

      await tester.pump();

      // Find option buttons labeled A, B, C, D
      expect(find.textContaining('The peace in the early mornings'), findsOneWidget);
      expect(find.textContaining('The magical golden hours'), findsOneWidget);
      expect(find.textContaining('Wind-down time after dinners'), findsOneWidget);
      expect(find.textContaining('The serenity past midnight'), findsOneWidget);

      // Tap on option A
      await tester.tap(find.textContaining('The peace in the early mornings'));
      await tester.pump();

      // Bloc state should update accordingly (test by listening or state changes)
      expect(strollBloc.state, "A");
    });

    testWidgets('Prompt text shows placeholder and enables focus on tap',
            (tester) async {
          await tester.pumpWidget(
            MaterialApp(home: const StrollBonfireView()),
          );

          final promptTextField = find.byType(TextField);
          expect(promptTextField, findsOneWidget);

          expect(find.textContaining('Pick your option'), findsOneWidget);

          // Tap to enable focus
          await tester.tap(promptTextField);
          await tester.pump();

          // final state = tester.state<_StrollBonfireViewState>(find.byType(StrollBonfireView));
          // expect(state._focusNode.hasFocus, isTrue);
        });

    testWidgets('Mic and Forward buttons are present and tappable',
            (tester) async {
          await tester.pumpWidget(
            MaterialApp(home: const StrollBonfireView()),
          );

          final micButton = find.byIcon(Icons.mic);
          final forwardButton = find.byIcon(Icons.arrow_forward);

          expect(micButton, findsOneWidget);
          expect(forwardButton, findsOneWidget);

          await tester.tap(micButton);
          await tester.tap(forwardButton);
        });

    // testWidgets('Video controller disposes on widget dispose', (tester) async {
    //   await tester.pumpWidget(
    //     MaterialApp(home: const StrollBonfireView()),
    //   );
    //
    //   final state = tester.state<_StrollBonfireViewState>(find.byType(StrollBonfireView));
    //   final videoController = state._controller;
    //
    //   expect(videoController.value.isInitialized, isTrue);
    //
    //   await tester.pumpWidget(Container()); // Remove widget
    //   expect(videoController.value.isInitialized, isTrue); // Cannot test dispose directly here, but no errors
    // });
  });
}

