class EditConfig {
  bool faceTracking;
  bool emotionCrop;
  double emotionSensitivity;
  bool autoBroll;
  bool subtitle;
  List<String> dubLanguages;
  bool mrBeastMode;

  EditConfig({
    required this.faceTracking,
    required this.emotionCrop,
    required this.emotionSensitivity,
    required this.autoBroll,
    required this.subtitle,
    required this.dubLanguages,
    required this.mrBeastMode,
  });

  Map<String, dynamic> toJson() => {
        "face_tracking": faceTracking,
        "emotion_crop": emotionCrop,
        "emotion_sensitivity": emotionSensitivity,
        "auto_broll": autoBroll,
        "subtitle": subtitle,
        "dub_languages": dubLanguages,
        "mrbeast_mode": mrBeastMode,
      };
}
