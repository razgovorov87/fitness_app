import 'package:fitness_app/domain/model/user.dart';
import 'package:fitness_app/presentation/design/colors.dart';
import 'package:fitness_app/presentation/design/common/interactive_widget.dart';
import 'package:fitness_app/presentation/news/widgets/post_list.dart';
import 'package:fitness_app/presentation/news/widgets/stories_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final stories = <User>[
    User(
      name: 'Julia',
      imgPath: 'https://randomuser.me/api/portraits/women/50.jpg',
      isHasNewStories: true,
    ),
    User(
      name: 'Andrew',
      imgPath: 'https://randomuser.me/api/portraits/men/83.jpg',
    ),
    User(
      name: 'Greg',
      imgPath: 'https://randomuser.me/api/portraits/men/29.jpg',
    ),
    User(
      name: 'Clara',
      imgPath: 'https://randomuser.me/api/portraits/women/59.jpg',
      isHasNewStories: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: CustomColors.newDarkBackground,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildStoriesList(),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: PostList(),
            ),
            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  Widget _buildStoriesList() => SizedBox(
        height: 110,
        child: StoriesList(
          itemCount: stories.length + 1,
          padding: const EdgeInsets.only(top: 15, left: 24, right: 24),
          itemBuilder: (context, index) => _storiesItem(
            index: index,
            isCreateStories: index == 0,
          ),
        ),
      );

  Widget _storiesItem({
    required int index,
    required bool isCreateStories,
  }) =>
      CustomInteractiveWidget(
        onTap: () {},
        child: SizedBox(
          width: 70,
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: !isCreateStories
                          ? Border.all(
                              color: stories[index - 1].isHasNewStories
                                  ? CustomColors.primary
                                  : CustomColors.darkBackground,
                              width: 3.5,
                            )
                          : const Border(),
                      image: DecorationImage(
                        image: Image.network(
                          isCreateStories
                              ? 'https://randomuser.me/api/portraits/men/23.jpg'
                              : stories[index - 1].imgPath,
                        ).image,
                      ),
                    ),
                  ),
                  if (isCreateStories)
                    Positioned(
                      bottom: -1,
                      right: -1,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: CustomColors.primary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 15,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                isCreateStories ? 'You' : stories[index - 1].name,
                style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );

  PreferredSizeWidget _appBar() => AppBar(
        backgroundColor: CustomColors.newDarkBackground,
        elevation: 0,
        flexibleSpace: Stack(
          children: [
            SafeArea(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Application',
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    CustomInteractiveWidget(
                      onTap: () {},
                      child: const Icon(
                        Linecons.heart,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 20),
                    CustomInteractiveWidget(
                      onTap: () {},
                      child: const Icon(
                        Linecons.comment,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
