import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/edit_config.dart';
import '../services/github_trigger.dart';
import '../widgets/option_switch.dart';
import '../widgets/option_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? video;

  bool faceTracking = true;
  bool emotionCrop = true;
  double emotionSensitivity = 0.8;
  bool autoBroll = true;
  bool subtitle = true;
  bool emotionColor = true;
  bool voiceDub = false;
  bool mrBeastMode = false;

  Future<void> pickVideo() async {
    final picker = ImagePicker();
    final picked = await picker.pickVideo(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => video = File(picked.path));
    }
  }

  Future<void> runEdit() async {
    if (video == null) return;

    final config = EditConfig(
      faceTracking: faceTracking,
      emotionCrop: emotionCrop,
      emotionSensitivity: emotionSensitivity,
      autoBroll: autoBroll,
      subtitle: subtitle,
      emotionColor: emotionColor,
      voiceDub: voiceDub,
      mrBeastMode: mrBeastMode,
    );

    await GitHubTrigger.runWorkflow(
      "GITHUB_TOKEN_HERE",
      config.toJson(),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("🔥 Auto Edit Started")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AK Premium Auto Edit")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: pickVideo,
              child: const Text("📹 Select Video"),
            ),
            if (video != null)
              Text("Selected: ${video!.path.split('/').last}"),

            const Divider(),

            OptionSwitch(
              title: "Face Tracking",
              value: faceTracking,
              onChanged: (v) => setState(() => faceTracking = v),
            ),

            OptionSwitch(
              title: "Emotion Reactive Crop",
              value: emotionCrop,
              onChanged: (v) => setState(() => emotionCrop = v),
            ),

            const Text("Emotion Sensitivity"),
            OptionSlider(
              value: emotionSensitivity,
              onChanged: (v) => setState(() => emotionSensitivity = v),
            ),

            OptionSwitch(
              title: "Auto B-Roll Zoom",
              value: autoBroll,
              onChanged: (v) => setState(() => autoBroll = v),
            ),

            OptionSwitch(
              title: "Auto Subtitle (BN + HI)",
              value: subtitle,
              onChanged: (v) => setState(() => subtitle = v),
            ),

            OptionSwitch(
              title: "Subtitle Emotion Color",
              value: emotionColor,
              onChanged: (v) => setState(() => emotionColor = v),
            ),

            OptionSwitch(
              title: "Voice Dub (BN + HI)",
              value: voiceDub,
              onChanged: (v) => setState(() => voiceDub = v),
            ),

            OptionSwitch(
              title: "🔥 MrBeast Mode",
              value: mrBeastMode,
              onChanged: (v) => setState(() => mrBeastMode = v),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.all(16),
              ),
              onPressed: runEdit,
              child: const Text(
                "🔥 RUN AUTO EDIT",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
