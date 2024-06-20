import 'package:app1/models/game.dart';
import 'package:app1/pages/detail/widgets/description.dart';
import 'package:app1/pages/detail/widgets/gallery.dart';
import 'package:app1/pages/detail/widgets/review.dart';
import 'package:app1/pages/home/widgets/header.dart';
import 'package:flutter/material.dart';

import '../../../models/game.dart';


class GameInfo extends StatelessWidget {
  final Game game;

  const GameInfo(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          HeaderSection(),
          GallerySection(game),
          DescriptionSection(game),
          ReviewSection(game)
        ],
      ),
    );
  }
}
