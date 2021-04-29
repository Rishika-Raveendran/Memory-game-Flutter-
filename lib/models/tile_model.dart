//Before we create data, we create a model

class tileModel {
  String imagePath;
  bool isSelected;
  //constructor
  tileModel({this.imagePath, this.isSelected});

  //setter methods
  void setImagePath(String getImagePath) {
    imagePath = getImagePath;
  }

  void setIsSelected(bool getIsSelected) {
    isSelected = getIsSelected;
  }

  //getter methods
  String getImageAssetPath() {
    return imagePath;
  }

  bool getIsSelectedVal() {
    return isSelected;
  }
}
