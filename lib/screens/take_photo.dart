import 'package:boosky/screens/preview_image.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class TakePhoto extends StatefulWidget {
  const TakePhoto({super.key});

  @override
  State<TakePhoto> createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  late CameraController controller;
  @override
  void initState() {
    super.initState();
  }

  Future<void> initCamera() async {
    var cameraList = await availableCameras();
    controller = CameraController(cameraList.first, ResolutionPreset.high);
    return controller.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo"),
      ),
      body: FutureBuilder<void>(
        future: initCamera(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error found");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(controller);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          takePicture(context);
        },
        child: const Icon(Icons.monochrome_photos_rounded),
      ),
    );
  }

  void takePicture(BuildContext context) async {
    var image = await controller.takePicture();
    // ignore: use_build_context_synchronously
    var result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PreviewImage(imagePath: image.path)));
    if (result != null) {
      Navigator.pop(context, result);
    }
  }
}
