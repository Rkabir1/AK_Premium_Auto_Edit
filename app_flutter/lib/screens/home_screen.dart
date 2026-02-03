import 'package:flutter/material.dart';
import '../models/edit_config.dart';
import '../services/github_trigger.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool faceTracking = true;
  bool emotionCrop = true;
  bool autoSubtitle = true;
  bool emotionColor = true;
  bool noiseReduction = true;

  bool mrBeastMode = false;

  String mode = "reel";

  void runAutoEdit() async {
    final config = EditConfig(
      faceTracking: faceTracking,
      emotionCrop: emotionCrop,
      autoSubtitle: autoSubtitle,
      emotionColor: emotionColor,
      noiseReduction: noiseReduction,
      mode: mode,
      mrBeastMode: mrBeastMode,
    );

    await GitHubTrigger.runWorkflow(
      "YOUR_GITHUB_TOKEN",
      config.toJson(),
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("🔥 Auto Edit Started on GitHub")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AK Premium Auto Edit"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Edit Options",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SwitchListTile(
              title: const Text("Face Tracking"),
              value: faceTracking,
              onChanged: (v) => setState(() => faceTracking = v),
            ),

            SwitchListTile(
              title: const Text("Emotion Reactive Crop"),
              value: emotionCrop,
              onChanged: (v) => setState(() => emotionCrop = v),
            ),

            SwitchListTile(
              title: const Text("Noise Reduction"),
              value: noiseReduction,
              onChanged: (v) => setState(() => noiseReduction = v),
            ),

            SwitchListTile(
              title: const Text("Auto Subtitle"),
              value: autoSubtitle,
              onChanged: (v) => setState(() => autoSubtitle = v),
            ),

            SwitchListTile(
              title: const Text("Emotion Color Subtitle"),
              value: emotionColor,
              onChanged: (v) => setState(() => emotionColor = v),
            ),

            const SizedBox(height: 10),

            const Text(
              "Video Mode",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            RadioListTile(
              title: const Text("Reel (9:16)"),
              value: "reel",
              groupValue: mode,
              onChanged: (v) => setState(() => mode = v.toString()),
            ),

            RadioListTile(
              title: const Text("Full Video"),
              value: "full",
              groupValue: mode,
              onChanged: (v) => setState(() => mode = v.toString()),
            ),

            const Divider(),

            SwitchListTile(
              title: const Text("🔥 MrBeast Mode"),
              value: mrBeastMode,
              onChanged: (v) {
                setState(() {
                  mrBeastMode = v;
                  if (v) {
                    faceTracking = true;
                    emotionCrop = true;
                    autoSubtitle = true;
                    emotionColor = true;
                    noiseReduction = true;
                  }
                });
              },
            ),

            const SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: runAutoEdit,
                child: const Text("🚀 RUN AUTO EDIT"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
