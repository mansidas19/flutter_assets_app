import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(
    ChewieDemo(),
  );
}

class ChewieDemo extends StatefulWidget {
  ChewieDemo({this.title = 'RAY OF HOPE'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<ChewieDemo> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.asset('assets/IMG_9250.MP4');
    _videoPlayerController2 = VideoPlayerController.network('https://drive.google.com/file/d/19hdWcpOfTTpC8Ju298GxEuDhz5uM9HzA/view?usp=sharing');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController2,
      aspectRatio: 16/9,
      autoPlay: true,
      looping: true,
      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  msg(){
    Fluttertoast.showToast(
        msg: "MAKING INDIA \n FUTURE READY",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 25.0
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: widget.title,
      theme: ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[IconButton(icon: Icon(Icons.message),onPressed: msg,)],
          backgroundColor: Colors.amberAccent,
          title: Text('RAY OF HOPE',style: TextStyle(fontStyle: FontStyle.italic, fontFamily: 'Raleway',color: Colors.redAccent, fontWeight: FontWeight.bold,fontSize: 30),),
        ),
        body: Container(
          decoration: BoxDecoration(
    color: Colors.orange,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(200),
        topRight: Radius.circular(200),
        bottomLeft: Radius.circular(200),
        bottomRight: Radius.circular(200)
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.red.withOpacity(1),
        spreadRadius: 20,
        blurRadius: 10,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
          ),
          width:double.infinity,
          height: double.infinity,
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Chewie(
                    controller: _chewieController,
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}