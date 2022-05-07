class Workout {
  final String bgImagePath;
  final String title;
  final String subtitle;
  final String? chip;

  Workout({
    required this.bgImagePath,
    required this.title,
    required this.subtitle,
    this.chip,
  });
}
