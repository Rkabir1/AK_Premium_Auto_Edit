class EditConfig {
  final bool faceTracking;
  final bool emotionCrop;
  final bool autoSubtitle;
  final bool mrBeastMode;
  final String videoPath;

  EditConfig({
    required this.faceTracking,
    required this.emotionCrop,
    required this.autoSubtitle,
    required this.mrBeastMode,
    required this.videoPath,
  });

  Map<String, dynamic> toJson() {
    return {
      "face_tracking": faceTracking,
      "emotion_crop": emotionCrop,
      "auto_subtitle": autoSubtitle,
      "mrbeast_mode": mrBeastMode,
      "video_path": videoPath,
    };
  }
}
