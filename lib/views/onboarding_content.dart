class OnBoardingContent {
  final String image;
  final String title;
  final String desc;

  OnBoardingContent(
      {required this.image, required this.title, required this.desc});
}

List<OnBoardingContent> contents = [
  OnBoardingContent(
    image: "assets/images/onboarding_1.png",
    title: "Diverse & sparkling food.",
    desc:
        "We use the best local ingredients to create fresh\n and delicious food and drinks.",
  ),
  OnBoardingContent(
      image: "assets/images/onboarding_2.png",
      title: "Free shipping on all orders",
      desc:
          "Free shipping on the primary order whilst the\nusage of CaPay fee method."),
  OnBoardingContent(
      image: "assets/images/onboarding_3.png",
      title: "+24K Restaurants",
      desc:
          "Easily find your favorite food and have it delivered in record time."),
];
