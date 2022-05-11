class User {
  final String name;
  final String imgPath;
  final bool isHasNewStories;
  User({
    required this.name,
    required this.imgPath,
    this.isHasNewStories = false,
  });
}
