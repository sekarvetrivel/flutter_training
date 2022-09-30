class SliderModel {
  String image;

  SliderModel({required this.image});

  String getImage() {
    return image;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel = new SliderModel(image: "assets/images/image_1.jpg");

  slides.add(sliderModel);

  sliderModel = new SliderModel(image: "assets/images/image_1.jpg");

  slides.add(sliderModel);

  sliderModel = new SliderModel(image: "assets/images/image_1.jpg");

  slides.add(sliderModel);

  return slides;
}
