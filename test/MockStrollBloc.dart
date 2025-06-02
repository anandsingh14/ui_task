import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:video_player/video_player.dart';

import 'package:ui_task/features/stroll_bonfire/presentation/bloc/StrollBloc.dart';
import 'package:ui_task/features/stroll_bonfire/presentation/bloc/StrollEvent.dart';

// Mocks
class MockStrollBloc extends Mock implements StrollBloc {}
class FakeStrollEvent extends Fake implements StrollEvent {}
// class FakeStrollState extends Fake implements String {}

class MockVideoPlayerController extends Mock implements VideoPlayerController {}
