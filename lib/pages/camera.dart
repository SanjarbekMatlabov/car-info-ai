import 'dart:convert';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CarDetectionPage extends StatefulWidget {
  @override
  _CarDetectionPageState createState() => _CarDetectionPageState();
}

class _CarDetectionPageState extends State<CarDetectionPage> {
  CameraController? _cameraController;
  List<CameraDescription>? cameras;
  String? carModel;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    _cameraController = CameraController(
      cameras![0],
      ResolutionPreset.high,
    );
    await _cameraController?.initialize();
    setState(() {});
  }

  Future<void> detectCar() async {
    final image = await _cameraController?.takePicture();
    if (image != null) {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://127.0.0.1:5000/detect_car'),
      );
      request.files.add(await http.MultipartFile.fromPath('file', image.path));
      var response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final jsonData = json.decode(responseData);
        setState(() {
          carModel =
              jsonData['message']; // 'model' o'rniga 'message' dan foydalaning
        });
      } else {
        print("Xato: ${response.statusCode}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _cameraController?.value.isInitialized ?? false
          ? Stack(
              children: [
                CameraPreview(_cameraController!),
                // Tashqarisi qorong'i bo'lgan Container
                Positioned.fill(
                  child: Container(
                      // color: Colors.black.withOpacity(0.5), // Tashqarisi qorong'i
                      ),
                ),
                // Ramka uchun Container
                Center(
                  child: Container(
                    width: 300, // Ramka kengligi
                    height: 400, // Ramka balandligi
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.green, width: 3), // Ramka rangi
                    ),
                    child: Center(
                      child: Text(
                        "Mashinani old tarafini joylashtiring",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    right: 0,
                    left: 0,
                    child: Container(
                      child: IconButton(
                          onPressed: detectCar,
                          icon: Icon(
                            Icons.camera,
                            size: 40,
                          )),
                    )),
                if (carModel != null)
                  Center(
                    child: Text("Model: $carModel",
                        style: TextStyle(fontSize: 24, color: Colors.white)),
                  ),
              ],
            )
          : Center(child: CircularProgressIndicator()),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: detectCar,
      //   child: Icon(Icons.camera),
      // ),
    );
  }
}
