import 'package:flutter/material.dart';
import 'package:tflite_audio/tflite_audio.dart';

class VoiceAnalysis extends StatefulWidget {
  @override
  _VoiceAnalysisState createState() => _VoiceAnalysisState();
}

class _VoiceAnalysisState extends State<VoiceAnalysis> {
  String _sound = "Press the button to start";
  bool _recording = false;
  Stream<Map<dynamic, dynamic>>? result;

  @override
  void initState() {
    super.initState();
    TfliteAudio.loadModel(
      model: 'assets/voice/soundclassifier_with_metadata.tflite',
      label: 'assets/voice/labels.txt',
      numThreads: 1,
      isAsset: true,
    );
  }

  void _recorder() {
    String recognition = "";
    if (!_recording) {
      setState(() => _recording = true);
      result = TfliteAudio.startAudioRecognition(
        numOfInferences: 1,
        inputType: 'rawAudio',
        sampleRate: 20000,
        // 44100,
        recordingLength: 44032,
        bufferSize: 15000,
        // 22016,
      );
      result!.listen((event) {
        recognition = event["recognitionResult"];
      }).onDone(() {
        setState(() {
          _recording = false;
          _sound = recognition.split(" ")[1];
        });
      });
    }
  }

  void _stop() {
    TfliteAudio.stopAudioRecognition();
    setState(() => _recording = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade300,
        title: Text(
          'Detect Suicidal Intent',
          style: TextStyle(color: Color(0xff2b2d70), fontSize: 20),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage("assets/background.jpg"),
            //   fit: BoxFit.cover,
            // ),
            ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Detect Voice...",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: _recorder,
                color: _recording ? Color(0xff4c2c87) : Color(0xff2596be),
                textColor: Colors.white,
                child: Icon(Icons.mic, size: 60),
                shape: CircleBorder(),
                padding: EdgeInsets.all(25),
              ),
              Text(
                '$_sound',
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
