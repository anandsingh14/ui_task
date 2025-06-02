import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorManager.black,
        selectedItemColor: ColorManager.primary,
        unselectedItemColor: ColorManager.icon,
        currentIndex: _selectedIndex,
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
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: ColorManager.primary,
                      shape: BoxShape.circle,
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
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: ColorManager.primary,
                      shape: BoxShape.circle,
                    ),
                    constraints: BoxConstraints(minWidth: 16, minHeight: 16),
                    child: Text(
                      '3',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                      textAlign: TextAlign.center,
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
          SizedBox.expand(
            child: _controller.value.isInitialized
                ? FittedBox(
              fit: BoxFit.cover,
              clipBehavior: Clip.hardEdge,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            )
                : Container(color: Colors.black),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black.withOpacity(0.85)],
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
                  _buildHeader(),
                  const Spacer(),
                  _buildQuestionSection(),
                  const SizedBox(height: 24),
                  _buildOptions(context),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: _buildPromptText()),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: ColorManager.primary,
                                width: 2,
                              ),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.mic,
                                color: ColorManager.primary,
                                size: 24,
                              ),
                              onPressed: () {},
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: const CircleBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorManager.primary,
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(14),
                            ),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 24,
                            ),
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
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: ColorManager.primary,
                shadows: [
                  Shadow(
                    blurRadius: 12.0,
                    color: ColorManager.primary.withOpacity(0.5),
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: ColorManager.primary,
              size: 28,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.access_time, color: ColorManager.icon, size: 18),
            SizedBox(width: 4),
            Text("22h 00m", style: TextStyle(color: ColorManager.icon)),
            SizedBox(width: 16),
            Icon(Icons.people, color: ColorManager.icon, size: 18),
            SizedBox(width: 4),
            Text("103", style: TextStyle(color: ColorManager.icon)),
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
            padding: const EdgeInsets.only(left: 45.0),
            child: SizedBox(
              width: 180,
              height: 30,
              child: NeumorphicRectangle(
                innerShadow: true,
                outerShadow: true,
                backgroundColor: ColorManager.backgroundColor,
                shadowColor: ColorManager.shadowColor,
                highlightColor: ColorManager.highlightColor.withOpacity(0.05),
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "Angelina, 28",
                    style: TextStyle(
                      color: ColorManager.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 90,
            height: 80,
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
            padding: EdgeInsets.only(left: 90.0, top: 40),
            child: Text(
              "What is your favorite time\nof the day?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 70.0, top: 100),
            child: Text(
              '"Mine is definitely the peace in the morning."',
              style: TextStyle(
                color: Colors.white70,
                fontStyle: FontStyle.italic,
                fontSize: 13,
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
                  onTap: () => context.read<StrollBloc>().add(SelectOptionEvent("A")),
                ),
                const SizedBox(width: 12),
                OptionButton(
                  label: "B",
                  text: "The magical golden hours",
                  selected: selectedOption == "B",
                  onTap: () => context.read<StrollBloc>().add(SelectOptionEvent("B")),
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
                  onTap: () => context.read<StrollBloc>().add(SelectOptionEvent("C")),
                ),
                const SizedBox(width: 12),
                OptionButton(
                  label: "D",
                  text: "The serenity past midnight",
                  selected: selectedOption == "D",
                  onTap: () => context.read<StrollBloc>().add(SelectOptionEvent("D")),
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
    child: TextField(

      style: TextStyle(
        color: Colors.white60,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: 'Share what you think',
        hintStyle: TextStyle(
          color: Colors.white60,
          fontSize: 16,
        ),
        contentPadding: EdgeInsets.all(12),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
      maxLines: null,
      minLines: 1,
    )





    // Text(
    //   "Share what you think",
    //   style: TextStyle(color: Colors.white60, fontSize: 16),
    // ),
  );
}