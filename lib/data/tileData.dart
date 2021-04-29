import '../models/tile_model.dart';

List<tileModel> getPairs() {
  List<tileModel> pairs = new List<tileModel>();
  //tileModel tm = new tileModel();
  var images = [
    "assets/cute_pupper.webp",
    "assets/pix_lamb.webp",
    "assets/pix_beast.webp",
    "assets/pix_happy.webp",
    "assets/pix_love.webp",
    "assets/pix_hen.webp"
  ];

  for (var i = 0; i < 6; ++i) {
    tileModel tm = new tileModel();
    tm.setImagePath(images[i]);
    tm.setIsSelected(false);
    pairs.add(tm);
    pairs.add(tm);
  }
  return pairs;
}
