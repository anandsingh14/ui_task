import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_task/core/color_manager.dart';
import 'package:video_player/video_player.dart';
import 'package:ui_task/features/stroll_bonfire/presentation/bloc/StrollBloc.dart';
import 'package:ui_task/features/stroll_bonfire/presentation/bloc/StrollEvent.dart';
import 'package:ui_task/features/stroll_bonfire/presentation/widgets/OptionButton.dart';
import '../widgets/NeumorphicRectangle.dart';
import '../widgets/NeuomorphicCircle.dart';

class StrollBonfirePage extends StatelessWidget {
  const StrollBonfirePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StrollBloc(),
      child: StrollBonfireView(),
    );
  }
}

class StrollBonfireView extends StatefulWidget {
  const StrollBonfireView({super.key});

  @override
  _StrollBonfireViewState createState() => _StrollBonfireViewState();
}

class _StrollBonfireViewState extends State<StrollBonfireView> {
  late VideoPlayerController _controller;
  int _selectedIndex = 0;
  final FocusNode _focusNode = FocusNode(canRequestFocus: false);

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/sun_set.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF0F1115),
        selectedItemColor: ColorManager.primary,
        unselectedItemColor: ColorManager.icon,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/playing_card.png',
              width: 24,
              height: 24,
              color: ColorManager.bottomIconcolor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Image.asset(
                  'assets/images/bonefire.png',
                  width: 24,
                  height: 24,
                  color: ColorManager.bottomIconcolor,
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/badge.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '', // Text inside badge
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Proxima Nova',
                        fontWeight: FontWeight.w700,
                        fontSize: 7,
                        height: 1.0,
                        letterSpacing: 0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Image.asset(
                  'assets/images/speech_bubble.png',
                  width: 24,
                  height: 24,
                  color: ColorManager.bottomIconcolor,
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/badge.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '3',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Proxima Nova',
                        fontWeight: FontWeight.w700,
                        fontSize: 7,
                        height: 1.0,
                        letterSpacing: 0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/user.png',
              width: 24,
              height: 24,
              color: ColorManager.bottomIconcolor,
            ),
            label: '',
          ),
        ],
      ),

      body: Stack(
        children: [
          Container(
            width: double.infinity, // set desired width
            height: double.infinity, // set desired height
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bck.jpg'), // replace with your asset path
                fit: BoxFit.cover, // or BoxFit.fill/BoxFit.contain/etc. as needed
              ),
              borderRadius: BorderRadius.circular(12), // optional: rounded corners
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black.withOpacity(0.92)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  _buildHeader(),
                  const Spacer(),
                  _buildQuestionSection(),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        '"Mine is definitely the peace in the morning."',
                        style: TextStyle(
                          fontWeight: FontWeight.w400, // Regular
                          fontStyle: FontStyle.italic,
                          fontSize: 12,
                          height: 1.2, // 120% line height
                          letterSpacing: 0.0,
                          color: const Color(0xB2CBC9FF),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildOptions(context),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: _buildPromptText()),
                      Row(
                        children: [

                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                child: Image.asset(
                                  'assets/images/mike.png',
                                  width: 48,
                                  height: 48,
                                  color: Color(0x33000000),
                                ),
                              ),
                              // Shadow Layer 2
                              Positioned(
                                child: Image.asset(
                                  'assets/images/mike.png',
                                  width: 48,
                                  height: 48,
                                  color: Color(0xFFBEBEBE),
                                ),
                              ),
                              // Shadow Layer 3
                              Positioned(
                                top: 1,
                                child: Image.asset(
                                  'assets/images/mike.png',
                                  width: 48,
                                  height: 48,
                                  color: Color(0x8024232F), // #24232F80
                                ),
                              ),
                              // Main Icon
                              Image.asset(
                                'assets/images/mike.png',
                                width: 48,
                                height: 48,
                              ),
                            ],
                          ),

                          const SizedBox(width: 16),


                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                child: Image.asset(
                                  'assets/images/arrow.png',
                                  width: 48,
                                  height: 48,
                                  color: Color(0x33000000),
                                ),
                              ),
                              // Shadow Layer 2
                              Positioned(
                                child: Image.asset(
                                  'assets/images/arrow.png',
                                  width: 48,
                                  height: 48,
                                  color: Color(0xFFBEBEBE),
                                ),
                              ),
                              // Shadow Layer 3
                              Positioned(
                                top: 1,
                                child: Image.asset(
                                  'assets/images/arrow.png',
                                  width: 48,
                                  height: 48,
                                  color: Color(0x8024232F), // #24232F80
                                ),
                              ),
                              // Main Icon
                              Image.asset(
                                'assets/images/arrow.png',
                                width: 48,
                                height: 48,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() => Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Stroll Bonfire',
              style: TextStyle(
                fontFamily: 'ProximaNova',
                // Add to pubspec.yaml
                fontWeight: FontWeight.w700,
                fontSize: 34,
                height: 1.0,
                // 100% line height
                letterSpacing: 0,
                color: Color(0xFFCCC8FF),
                shadows: [
                  Shadow(
                    color: Color(0x33000000), // #00000033
                    blurRadius: 20,
                    offset: Offset(0, 0),
                  ),
                  Shadow(
                    color: Color(0xFFBEBEBE),
                    blurRadius:9,
                    offset: Offset(0, 0),
                  ),
                  Shadow(
                    color: Color(0x8024232F), // #24232F80
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
            ),

            SizedBox(width: 8),
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Image.asset(
                    'assets/images/arrow_down.png',
                    width: 24,
                    height: 24,
                    color: Color(0x33000000),
                  ),
                ),
                // Shadow Layer 2
                Positioned(
                  child: Image.asset(
                    'assets/images/arrow_down.png',
                    width: 24,
                    height: 24,
                    color: Color(0xFFBEBEBE),
                  ),
                ),
                // Shadow Layer 3
                Positioned(
                  top: 1,
                  child: Image.asset(
                    'assets/images/arrow_down.png',
                    width: 24,
                    height: 24,
                    color: Color(0x8024232F), // #24232F80
                  ),
                ),
                // Main Icon
                Image.asset(
                  'assets/images/arrow_down.png',
                  width: 24,
                  height: 24,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Image.asset(
                    'assets/images/watch.png',
                    width: 22,
                    height: 22,
                    color: Color(0x33000000),
                  ),
                ),
                // Shadow Layer 2
                Positioned(
                  child: Image.asset(
                    'assets/images/watch.png',
                    width: 22,
                    height: 22,
                    color: Color(0xFFBEBEBE),
                  ),
                ),
                // Shadow Layer 3
                Positioned(
                  top: 1,
                  child: Image.asset(
                    'assets/images/watch.png',
                    width: 22,
                    height: 22,
                    color: Color(0x8024232F), // #24232F80
                  ),
                ),
                // Main Icon
                Image.asset(
                  'assets/images/watch.png',
                  width: 23,
                  height: 23,
                  color: Color(0xFFFFFFFF), // Icon fill color
                ),
              ],
            ),
            SizedBox(width: 4),
            Text(
              '22h 00m',
              style: TextStyle(
                fontFamily: 'ProximaNova',
                fontWeight: FontWeight.w600,
                fontSize: 12,
                height: 1.0,
                letterSpacing: 0.0,
                color: Color(0xFFFFFFFF),
                shadows: [
                  Shadow(
                    color: Color(0x33000000), // #00000033
                    blurRadius: 20,
                    offset: Offset(0, 0),
                  ),
                  Shadow(
                    color: Color(0xFFBEBEBE),
                    blurRadius: 9,
                    offset: Offset(0, 0),
                  ),
                  Shadow(
                    color: Color(0x8024232F), // #24232F80
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
            ),

            SizedBox(width: 16),
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Image.asset(
                    'assets/images/user.png',
                    width: 26,
                    height: 26,
                    color: Color(0x33000000),
                  ),
                ),
                // Shadow Layer 2
                Positioned(
                  child: Image.asset(
                    'assets/images/user.png',
                    width: 26,
                    height: 26,
                    color: Color(0xFFBEBEBE),
                  ),
                ),
                // Shadow Layer 3
                Positioned(
                  top: 1,
                  child: Image.asset(
                    'assets/images/user.png',
                    width: 26,
                    height: 26,
                    color: Color(0x8024232F), // #24232F80
                  ),
                ),
                // Main Icon
                Image.asset(
                  'assets/images/user.png',
                  width: 26,
                  height: 26,
                  color: Color(0xFFFFFFFF), // Icon fill color
                ),
              ],
            ),
            SizedBox(width: 4),
            Text(
              '103',
              style: TextStyle(
                fontFamily: 'ProximaNova',
                fontWeight: FontWeight.w600,
                fontSize: 12,
                height: 1.0,
                letterSpacing: 0.0,
                color: Color(0xFFFFFFFF),
                shadows: [
                  Shadow(
                    color: Color(0x33000000), // #00000033
                    blurRadius: 20,
                    offset: Offset(0, 0),
                  ),
                  Shadow(
                    color: Color(0xFFBEBEBE),
                    blurRadius: 9,
                    offset: Offset(0, 0),
                  ),
                  Shadow(
                    color: Color(0x8024232F), // #24232F80
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );

  Widget _buildQuestionSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: SizedBox(
              width: 107,
              child: NeumorphicRectangle(
                innerShadow: true,
                outerShadow: true,
                backgroundColor: ColorManager.backgroundColor,
                shadowColor: ColorManager.shadowColor,
                highlightColor: ColorManager.highlightColor.withOpacity(0.05),
                child: const Padding(
                  padding: EdgeInsets.only(left: 14.0,right: 8,top: 8,bottom: 8),
                  child: Text(
                    'Angelina, 28',
                    style: TextStyle(
                      fontFamily: 'ProximaNova',
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                      height: 1.0,
                      letterSpacing: 0.0,
                      color: Color(0xFFFFFFFF),
                      shadows: [
                        Shadow(
                          color: Color(0x33000000), // #00000033
                          blurRadius: 7.9,
                          offset: Offset(0, 0),
                        ),
                        Shadow(
                          color: Color(0xFFBEBEBE),
                          blurRadius: 2,
                          offset: Offset(0, 0),
                        ),
                        Shadow(
                          color: Color(0x8024232F), // #24232F80
                          blurRadius: 2,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 60,
            height: 60,
            child: NeuomorphicCircle(
              innerShadow: true,
              outerShadow: false,
              backgroundColor: ColorManager.backgroundColor,
              shadowColor: ColorManager.shadowColor,
              highlightColor: ColorManager.highlightColor.withOpacity(0.05),
              child: SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://m.media-amazon.com/images/M/MV5BODg3MzYwMjE4N15BMl5BanBnXkFtZTcwMjU5NzAzNw@@._V1_FMjpg_UX1000_.jpg',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 70.0, top: 40),
            child: Text(
              "What is your favorite time\nof the day?",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'ProximaNova',
                fontWeight: FontWeight.w700, // 700 = Bold
                fontSize: 20,
                height: 1.0, // 100% line height
                letterSpacing: 0.0,
              ),
            ),
          ),

        ],
      ),
    ],
  );

  Widget _buildOptions(BuildContext context) {
    return BlocBuilder<StrollBloc, String?>(
      builder: (context, selectedOption) {
        return Column(
          children: [
            Row(
              children: [
                OptionButton(
                  label: "A",
                  text: "The peace in the early mornings",
                  selected: selectedOption == "A",
                  onTap: () =>
                      context.read<StrollBloc>().add(SelectOptionEvent("A")),
                ),
                const SizedBox(width: 12),
                OptionButton(
                  label: "B",
                  text: "The magical golden hours",
                  selected: selectedOption == "B",
                  onTap: () =>
                      context.read<StrollBloc>().add(SelectOptionEvent("B")),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                OptionButton(
                  label: "C",
                  text: "Wind-down time after dinners",
                  selected: selectedOption == "C",
                  onTap: () =>
                      context.read<StrollBloc>().add(SelectOptionEvent("C")),
                ),
                const SizedBox(width: 12),
                OptionButton(
                  label: "D",
                  text: "The serenity past midnight",
                  selected: selectedOption == "D",
                  onTap: () =>
                      context.read<StrollBloc>().add(SelectOptionEvent("D")),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildPromptText() => Padding(
    padding: EdgeInsets.only(left: 2),
    child: Text(
      "Pick your option.\nSee who has a similar mind.",
      style: TextStyle(
        fontFamily: 'Proxima Nova',
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.2, // 120% line height
        letterSpacing: 0,
        color: Color(0xFFE5E5E5), // Hex color #E5E5E5
      )
    ),
  );
}
