from config_loader import load_config
from audio.audio_clean import clean_audio
from subtitle.subtitle_gen import generate_subtitle
from vision.face_tracker import track_face
from vision.emotion_detector import detect_emotion
from camera.smart_crop import emotion_crop
from camera.broll_zoom import auto_broll
from voice.auto_dub import dub_audio
from export.exporter import export_video

def run_pipeline(video, config):
    audio = clean_audio(video)
    subs = generate_subtitle(audio, config)

    faces = track_face(video)
    emotions = detect_emotion(video)

    cropped = emotion_crop(video, faces, emotions, config)
    zoomed = auto_broll(cropped, audio, config)

    if config["dub_languages"]:
        audio = dub_audio(audio, config)

    export_video(zoomed, audio, subs, config)

if __name__ == "__main__":
    config = load_config("config.json")
    run_pipeline("input.mp4", config)
