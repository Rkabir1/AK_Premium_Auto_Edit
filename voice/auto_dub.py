def dub_audio(audio, config):
    for lang in config["dub_languages"]:
        print(f"Dubbing to {lang}")
    return audio
