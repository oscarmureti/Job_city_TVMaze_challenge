import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:job_city_challenge/src/domain/entities/get_all_series/series_basic_info_entity.dart';
import 'package:job_city_challenge/src/presentation/presenters/home_presenter/home_presenter.dart';
import 'package:job_city_challenge/src/ui/mixins/navigation_manager.dart';
import 'package:job_city_challenge/src/ui/pages/shared/components/sliding_app_bar.dart';
import 'package:job_city_challenge/src/ui/themes/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/components/message_widget.dart';
import '../shared/components/series_card.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;
  const HomePage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with NavigationManager {
  late final ScrollController controller;
  int? pin;
  String? name;
  String? email;
  @override
  void initState() {
    super.initState();

    handleNavigationWithArgs(widget.presenter.navigateToWithArgsStream);
    getprefData();
    widget.presenter.getAllSeries();

    controller = ScrollController()
      ..addListener(() {
        if (controller.position.pixels >=
            controller.position.maxScrollExtent - 500) {
          widget.presenter.loadMoreSeries();
        }
      });
  }

  getprefData() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      pin = prefs.getInt("pin");
      name = prefs.getString("name");
      email = prefs.getString("email");
    });
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
              'Job City Challenge',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Color(0xFFFDB730),
                ),
                onPressed: () {
                  widget.presenter.goToSearchSeriesPage();
                },
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome back',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      name ?? '',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 10, top: 70),
              child: StreamBuilder<List<SeriesBasicInfoEntity>>(
                  stream: widget.presenter.seriesListStream,
                  builder: (context, listSnapshot) {
                    if (listSnapshot.hasData && listSnapshot.data!.isNotEmpty) {
                      return buildList(
                        controller: controller,
                        list: listSnapshot.data!,
                      );
                    } else if (listSnapshot.hasData &&
                        listSnapshot.data!.isEmpty) {
                      return const MessageWidget(
                        message: 'No TV Shows or Series here',
                      );
                    } else if (listSnapshot.hasError) {
                      return const MessageWidget(
                        message: 'Something wrong happened :(',
                      );
                    }

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
          ],
        ));
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
            heroTag: 'home${list[index].id}',
            index: index,
            seriesInfoItem: list[index],
            onTap: widget.presenter.goToSeriesDetailsPage,
          );
        },
      ),
    );
  }
}
