import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/core/videos/videos.dart';
//import 'package:netflix/presentation/fastluagh/widgets/videolistitems.dart';
import 'package:video_player/video_player.dart';

class FastLaugh extends StatefulWidget {
  const FastLaugh({super.key});

  @override
  State<FastLaugh> createState() => _FastLaughState();
}

class _FastLaughState extends State<FastLaugh> {
  late VideoPlayerController _controller;
  late String videoPath;

  @override
  void initState() {
    super.initState();
    videoController(videoPath: videoPathList[0]);
  }

  void videoController({required videoPath}) {
    _controller = VideoPlayerController.network(videoPath)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(videoPathList.length, (index) {
            return Stack(
              children: [
                SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: _controller.value.isInitialized
                        ? VideoPlayer(_controller)
                        : const Center(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //  <-----left Side------->
                        CircleAvatar(
                          radius: 23,
                          backgroundColor: Colors.black.withOpacity(0.5),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.volume_off,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Spacer(),

                        //  <-----right Side------->
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const CircleAvatar(
                                radius: 23,
                                backgroundImage: NetworkImage(
                                  "https://www.themoviedb.org/t/p/w220_and_h330_face/6GyzbZf1MsXfrDWTnNXrzwr6G9q.jpg",
                                ),
                              ),
                              kheigth,
                              const VideoActionWidget(
                                  icon: Icons.emoji_emotions, title: 'LOL'),
                              kheigth,
                              const VideoActionWidget(
                                  icon: Icons.add, title: 'My List'),
                              kheigth,
                              const VideoActionWidget(
                                  icon: Icons.share, title: 'Share'),
                              kheigth,
                              Column(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      _controller.value.isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      color: kwhite,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _controller.value.isPlaying
                                            ? _controller.pause()
                                            : _controller.play();
                                      });
                                    },
                                  ),
                                  const Text(
                                    'Play',
                                    style:
                                        TextStyle(fontSize: 14, color: kwhite),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
          onPageChanged: (value) {
            setState(() {
              _controller.dispose();
            });
            videoController(videoPath: videoPathList[value]);
          },
        ),
      ),
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidget({
    required this.icon,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
          color: kwhite,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: kwhite),
        ),
      ],
    );
  }
}
