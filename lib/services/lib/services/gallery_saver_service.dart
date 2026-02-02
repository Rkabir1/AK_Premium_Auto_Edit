import 'package:gallery_saver/gallery_saver.dart';

class GallerySaveService {
  static Future<void> saveVideo(String videoUrl) async {
    await GallerySaver.saveVideo(
      videoUrl,
      albumName: "AK Auto Edit",
    );
  }
}
