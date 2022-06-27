import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../domain/entities/get_all_series/series_basic_info_entity.dart';
import '../../../presentation/presenters/favorites_presenter/favorites_presenter.dart';
import '../../../routes/app_routes.dart';
import '../../mixins/navigation_manager.dart';
import '../../themes/app_colors.dart';
import '../shared/components/message_widget.dart';
import '../shared/components/series_card.dart';
import '../shared/components/sliding_app_bar.dart';

class FavoritesPage extends StatefulWidget {
  final FavoritesPresenter presenter;
  const FavoritesPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> with NavigationManager {
  late final ScrollController controller;
  @override
  void initState() {
    super.initState();

    handleNavigationWithArgs(widget.presenter.navigateToWithArgsStream);

    controller = ScrollController();
  }

  Future<bool> _reloadFavorites() async {
    widget.presenter.getAllFavoriteSeries();

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: const Padding(
            padding: EdgeInsets.only(
              left: 8,
            ),
            child: Text(
              'Favorites',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FutureBuilder(
              future: _reloadFavorites(),
              builder: (context, _) {
                return StreamBuilder<List<SeriesBasicInfoEntity>>(
                    initialData: const [],
                    stream: widget.presenter.seriesListStream,
                    builder: (context, listSnapshot) {
                      return StreamBuilder(
                          stream: widget.presenter.isLoadingStream,
                          builder: (context, loadingSnapshot) {
                            if (loadingSnapshot.hasData &&
                                loadingSnapshot.data == false) {
                              if (listSnapshot.hasData &&
                                  listSnapshot.data!.isNotEmpty) {
                                return buildList(
                                  controller: controller,
                                  list: listSnapshot.data!,
                                );
                              } else if (listSnapshot.hasData &&
                                  listSnapshot.data!.isEmpty) {
                                return const MessageWidget(
                                  message:
                                      'Your favorite Series and TV Shows will appear listed here :)',
                                );
                              } else if (listSnapshot.hasError) {
                                return const MessageWidget(
                                  message: 'Something wrong happened :(',
                                );
                              }

                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          });
                    });
              }),
        ));
  }

  void _goToPage({required SeriesBasicInfoEntity seriesEntity}) {
    goToPage(
      route: AppRoutes.seriesDetailsPage,
      arguments: {
        'seriesInfo': seriesEntity,
        'heroTag': 'favorite${seriesEntity.id}'
      },
    )!
        .then((_) {
      setState(() {});
    });
  }

  Widget buildList(
      {required ScrollController controller,
      required List<SeriesBasicInfoEntity> list}) {
    return RepaintBoundary(
      child: MasonryGridView.count(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 24,
        crossAxisSpacing: 16,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return SeriesCard(
            key: ValueKey(index),
            heroTag: 'favorite${list[index].id}',
            index: index,
            seriesInfoItem: list[index],
            onTap: _goToPage,
          );
        },
      ),
    );
  }
}
