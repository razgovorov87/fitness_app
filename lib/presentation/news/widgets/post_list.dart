import 'package:fitness_app/presentation/design/common/interactive_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _item(
          name: 'anny_wilson',
          subtitle: 'Marketing Coordinator',
          userImgPath: 'https://randomuser.me/api/portraits/women/65.jpg',
          contentImgPath: 'https://clck.ru/gwGuc',
          likeCount: '44,778',
          commentCount: '12,564',
        ),
        const SizedBox(height: 24),
        _item(
          name: 'hime_tanuki',
          subtitle: 'Flutter Developer',
          userImgPath: 'https://randomuser.me/api/portraits/men/42.jpg',
          contentImgPath: 'https://clck.ru/gwH6v',
          likeCount: '15,546',
          commentCount: '7,245',
        ),
      ],
    );
  }

  Widget _item({
    required String name,
    required String subtitle,
    required String userImgPath,
    required String contentImgPath,
    required String likeCount,
    required String commentCount,
  }) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _itemHeader(
            name: name,
            userImgPath: userImgPath,
            subtitle: subtitle,
          ),
          const SizedBox(height: 15),
          _itemContent(contentImgPath),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: _itemFooter(
              likeCount: likeCount,
              commentCount: commentCount,
            ),
          ),
        ],
      );

  Widget _itemFooter({
    required String likeCount,
    required String commentCount,
  }) =>
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _like(likeCount),
          const SizedBox(width: 18),
          _comment(commentCount),
          const SizedBox(width: 18),
          _share(),
        ],
      );

  Widget _like(String count) => CustomInteractiveWidget(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Linecons.heart,
              color: Colors.white,
              size: 22,
            ),
            const SizedBox(width: 7),
            Text(
              count,
              style: GoogleFonts.quicksand(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      );

  Widget _comment(String count) => CustomInteractiveWidget(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Linecons.comment,
              color: Colors.white,
              size: 22,
            ),
            const SizedBox(width: 7),
            Text(
              count,
              style: GoogleFonts.quicksand(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      );

  Widget _share() => const CustomInteractiveWidget(
        child: Icon(
          Linecons.paper_plane,
          color: Colors.white,
          size: 18,
        ),
      );

  Widget _itemContent(String contentImgPath) => AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            contentImgPath,
            fit: BoxFit.cover,
          ),
        ),
      );

  Widget _itemHeader({
    required String name,
    required String subtitle,
    required String userImgPath,
  }) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: Image.network(userImgPath).image,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.quicksand(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: GoogleFonts.quicksand(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomInteractiveWidget(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withOpacity(0.8),
                  width: 2,
                ),
              ),
              child: Icon(
                FontAwesome5.ellipsis_h,
                color: Colors.white.withOpacity(0.8),
                size: 10,
              ),
            ),
          ),
        ],
      );
}
