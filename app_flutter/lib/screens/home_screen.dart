import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../services/github_trigger.dart';
import '../models/edit_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? videoPath;

  bool faceTracking = true;
  bool emotionCrop = true;
  bool autoSubtitle = true;
  bool mrBeastMode = false;

  Future<void> pickVideo() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result != null) {
      setState(() {
        videoPath = result.files.single.path;
      });
    }
  }

  Future<void> runAutoEdit() async {
    if (videoPath == null) return;

    final config = EditConfig(
      faceTracking: faceTracking,
      emotionCrop: emotionCrop,
      autoSubtitle: autoSubtitle,
      mrBeastMode: mrBeastMode,
      videoPath: videoPath!,
    );

    await GitHubTrigger.runWorkflow(
      config: config.toJson(),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("🚀 Auto Edit Started")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AK Premium Auto Edit")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: pickVideo,
              child: const Text("🎥 Select Video"),
            ),
            if (videoPath != null)
              Text(
                videoPath!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            const Divider(),
            SwitchListTile(
              title: const Text("Face Tracking"),
              value: faceTracking,
              onChanged: (v) => setState(() => faceTracking = v),
            ),
            SwitchListTile(
              title: const Text("Emotion Crop"),
              value: emotionCrop,
              onChanged: (v) => setState(() => emotionCrop = v),
            ),
            SwitchListTile(
              title: const Text("Auto Subtitle"),
              value: autoSubtitle,
              onChanged: (v) => setState(() => autoSubtitle = v),
            ),
            SwitchListTile(
              title: const Text("🔥 MrBeast Mode"),
              value: mrBeastMode,
              onChanged: (v) => setState(() => mrBeastMode = v),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.all(16),
              ),
              onPressed: runAutoEdit,
              child: const Text("RUN AUTO EDIT 🚀"),
            ),
          ],
        ),
      ),
    );
  }
{
