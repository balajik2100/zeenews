import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:zeenews/utils/Utils.dart';

class Videoplayer extends StatefulWidget {
  final String title;

  //final List<VideoPlayerController> controllers;

  Videoplayer({this.title = 'Video Player'});

  @override
  State<StatefulWidget> createState() {
    return new _VideoplayerState();
  }
}

class _VideoplayerState extends State<Videoplayer> {
  List<VideoPlayerController> controllers;
  String subject = '';
  List<String> items = List();

  @override
  void initState() {
    items.add(
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4");
    //    controllers = [
    //      new VideoPlayerController.network(
    //          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4'),
    //      /* new VideoPlayerController.network(
    //          'https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8'),*/
    //    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      // Create a ListView of Chewie Players
      body: new ListView(
        // Here's the magic. We convert our List<VideoPlayerController>
        // into a List<Widget>.
        children: items.map((item) {
          return new Container(
              margin: new EdgeInsets.symmetric(vertical: 20.0),
              // To display a single Video Player, you need to create a `Chewie` Widget.
              // Since we want to show multiple videos, each item in the List will
              // contain a Chewie player
              child: new Stack(
                children: <Widget>[
                  Chewie(
                      controller: ChewieController(
                          videoPlayerController:
                              new VideoPlayerController.network(item),
                          autoInitialize: true,
                          aspectRatio: 3 / 2,
                          autoPlay: false,
                          looping: false,
                          showControls: true,
                          allowMuting: false,
                          errorBuilder: (context, errorMessage) {
                            return Center(
                              child: Text(
                                errorMessage,
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          })),
                  Container(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "Video Player Title Name",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      )),
                  GestureDetector(
                      onTap: () {
                        Utils.share(context, item);
                      },
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.share,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                      ))
                ],
              ));
        }).toList(),
      ),
    );
  }
}
