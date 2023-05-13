import 'dart:io';

import 'package:flutter/material.dart';

class PreviewImage extends StatefulWidget {
  String imagePath;
  PreviewImage({super.key, required this.imagePath});

  @override
  State<PreviewImage> createState() => _PreviewImageState();
}

class _PreviewImageState extends State<PreviewImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.file(File(widget.imagePath)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, widget.imagePath);
                    },
                    child: const Text("Accept")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"))
              ],
            ),
          ),
        )
      ],
    );
  }
}
