class UnbordingContent {
  String image;
  String title;
  String description;

  UnbordingContent({required this.image, required this.title, required this.description});
}

List<UnbordingContent> contents = [
  UnbordingContent(
    title: 'Song Seeker',
    image: 'assets/onboarding/onboarding_1.png',
    description: "Find the name of any song in seconds."
  ),
  UnbordingContent(
    title: 'Add Songs',
    image: 'assets/onboarding/onboarding_2.png',
    description: "Listen and add songs directly to Apple Music and Spotify."
  ),
  UnbordingContent(
    title: 'Sing Along',
    image: 'assets/onboarding/onboarding_3.png',
    description: "Follow along with time-synced lyrics."
  ),
  UnbordingContent(
    title: 'Upload Your Songs',
    image: 'assets/onboarding/onboarding_4.png',
    description: "Upload your songs easily as an artist and add songs to your playlist."
  ),
];