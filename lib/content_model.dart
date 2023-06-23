class UnbordingContent {
  String image;
  String title;
  String description;

  UnbordingContent(
      {required this.image, required this.title, required this.description});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Explore & Unleash',
      image: 'assets/onboarding/onboarding_1.png',
      description: "Let's dive in and unlock the magic of music!"),
  UnbordingContent(
      title: 'Rapid Song Identification',
      image: 'assets/onboarding/onboarding_2.png',
      description: "Find the name of any song in seconds."),
  UnbordingContent(
      title: 'Effortless Song Recognition',
      image: 'assets/onboarding/onboarding_3.png',
      description:
          "Simply upload or record a snippet of the song you want to identify, and our system will work its magic to provide you with accurate results."),
  UnbordingContent(
      title: 'Farewell Earworms',
      image: 'assets/onboarding/onboarding_4.png',
      description:
          """Say goodbye to those "earworm" moments when you can't recall the name of a song!"""),
];
