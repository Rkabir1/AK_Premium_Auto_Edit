def emotion_crop(video, faces, emotions, config):
    if emotions["angry"] > config["emotion_sensitivity"]:
        print("FAST ZOOM")
    elif emotions["sad"] > 0.5:
        print("SLOW PUSH")
    return video
