class SliderModel {
  String imageAssetPath;
  String desc;
  String title;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("Recruitment Application");
  sliderModel.setTitle("");

  sliderModel.setImageAssetPath("images/1.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc(
      "Recruitment Application");
  sliderModel.setTitle("");

  sliderModel.setImageAssetPath("images/2.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc(
      "Recruitment Application");
  sliderModel.setTitle("");

  sliderModel.setImageAssetPath("images/3.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
