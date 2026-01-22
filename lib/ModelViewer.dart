import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ModelView extends StatelessWidget {
  final String name;
  const ModelView({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ModelViewer(
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            src: 'assets/$name',
            alt: 'A 3D model of an astronaut',
            ar: true,
            arModes: const ['scene-viewer', 'webxr', 'quick-look'],
            cameraControls: true,
            autoRotate: true,
            autoPlay: true,
            iosSrc:
                'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
            disableZoom: true,
            innerModelViewerHtml: """
            <button slot="ar-button" style="border: none; background-color: white; border-radius: 20px; color: black; padding: 10px 20px; position: absolute; bottom: 20px; left: 50%; transform: translateX(-50%); font-family: sans-serif; font-size: 16px; box-shadow: 0 2px 5px rgba(0,0,0,0.25);">
              View in AR
            </button>
          """,
          ),
          Positioned(
            top: 20,
            left: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
                backgroundColor: Colors.white, // <-- Button color
                foregroundColor: Colors.white, // <-- Splash color
              ),
            ),
          ),
        ],
      ),
    );
  }
}
