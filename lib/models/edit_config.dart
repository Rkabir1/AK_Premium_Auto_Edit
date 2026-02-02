class EditConfig {
  bool faceTracking;
  bool emotionCrop;
  double emotionSensitivity;
  bool autoBroll;
  bool subtitle;
  bool emotionColor;
  bool voiceDub;
  bool mrBeastMode;

  EditConfig({
    required this.faceTracking,
    required this.emotionCrop,
    required this.emotionSensitivity,
    required this.autoBroll,
    required this.subtitle,
    required this.emotionColor,
    required this.voiceDub,
    required this.mrBeastMode,
  });

  Map<String, dynamic> toJson() {
    return {
      "face_tracking": faceTracking,
      "emotion_crop": emotionCrop,
      "emotion_sensitivity": emotionSensitivity,
      "auto_broll": autoBroll,
      "subtitle": subtitle,
      "emotion_color": emotionColor,
      "voice_dub": voiceDub,
      "dub_languages": ["bn", "hi"],
      "mrbeast_mode": mrBeastMode,
    };
  }
}
