import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class FacialGestures extends StatefulWidget {
  @override
  _FacialGesturesState createState() => _FacialGesturesState();
}

class _FacialGesturesState extends State<FacialGestures> {
  bool loading = true;
  File? _image;
  List? _output;
  final imagepicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadmodel().then((value) {
      setState(() {});
    });
  }

  detectimage(File image) async {
    var prediction = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.6,
        imageMean: 127.5,
        imageStd: 127.5);

    setState(() {
      _output = prediction;
      loading = false;
    });
  }

  loadmodel() async {
    await Tflite.loadModel(
        model: 'assets/model_unquant.tflite', labels: 'assets/labels.txt');
  }

  @override
  void dispose() {
    super.dispose();
  }

  pickimage_camera() async {
    var image = await imagepicker.getImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    detectimage(_image!);
  }

  pickimage_gallery() async {
    var image = await imagepicker.getImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    detectimage(_image!);
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade300,
        title: Text(
          'Detect Suicidal Intent',
          style: TextStyle(color: Color(0xff2b2d70), fontSize: 20),
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: Column(
          children: [
            Container(
              height: 150,
              width: 150,
              padding: EdgeInsets.all(10),
              child: Image.asset('assets/images/facial-1.png'),
            ),
            Container(
                child: Text(
              'Facial Gesture Analysis',
              style: TextStyle(
                  color: Color(0xff2b2d70),
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            )),
            SizedBox(height: 20),
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    width: double.infinity,
                    child: RaisedButton(
                        color: Color(0xff2596be),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Capture',
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 15,
                          ),
                        ),
                        onPressed: () {
                          pickimage_camera();
                        }),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    width: double.infinity,
                    child: RaisedButton(
                        color: Color(0xff4c2c87),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('Gallery',
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 15,
                            )),
                        onPressed: () {
                          pickimage_gallery();
                        }),
                  ),
                ],
              ),
            ),
            loading != true
                ? Container(
                    child: Column(
                      children: [
                        Container(
                          height: 220,
                          // width: double.infinity,
                          padding: EdgeInsets.all(15),
                          child: Image.file(_image!),
                        ),
                        _output != null
                            ? Text("Result : ${_output![0]["label"]}",
                                style: TextStyle(
                                  color: Color(0xff2596be),
                                  fontSize: 15,
                                )
                                // (_output![0]['label']).toString().substring(2),
                                )
                            : Text(''),
                        _output != null
                            ? Text(
                                'Confidence: ' +
                                    (_output![0]['confidence']).toString(),
                                style: TextStyle(
                                  color: Color(0xff2596be),
                                  fontSize: 15,
                                ))
                            : Text('')
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
