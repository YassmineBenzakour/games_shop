import 'package:app1/models/game.dart';
import 'package:app1/pages/detail/widgets/detail_sliver.dart';
import 'package:app1/pages/detail/widgets/info.dart';
import 'package:flutter/material.dart';

import '../../models/game.dart';


class DetailPage extends StatelessWidget {
  const DetailPage(this.game, {super.key});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: DetailSliverDelegate(
              game: game,
              expandedHeight: 360,
              roundedContainerHeight: 30,
            ),
          ),
          SliverToBoxAdapter(
            child: GameInfo(game),
          )
        ],
      ),
    );
  }
}
