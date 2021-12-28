import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../components/restaurant_appbar.dart';
import '../../../components/restaurant_card.dart';
import '../view_model/home_view_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, HomeViewModel viewModel, _) {
      return BaseView<HomeViewModel>(
          viewModel: viewModel,
          onModelReady: (model) {
            model.setContext(context);
            model.init();
          },
          onPageBuilder: (BuildContext context, viewModel) => Scaffold(
              appBar: RestaurantAppBar(),
              backgroundColor: context.theme.scaffoldBackgroundColor,
              body: buildBody(viewModel)));
    });
  }

  Widget buildBody(HomeViewModel viewModel) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (context.orientation == Orientation.portrait) {
          if (constraints.maxWidth < 600) {
            return buildGridView(1, viewModel, constraints.maxWidth * 0.9,
                constraints.maxHeight * 0.425);
          } else {
            return buildGridView(2, viewModel, constraints.maxWidth * 0.45,
                constraints.maxHeight * 0.35);
          }
        } else {
          if (constraints.maxHeight < 600) {
            return buildGridView(2, viewModel, constraints.maxWidth * 0.4,
                constraints.maxHeight * 0.85);
          } else {
            return buildGridView(3, viewModel, constraints.maxWidth * 0.3,
                constraints.maxHeight * 0.4);
          }
        }
      },
    );
  }

  Widget buildGridView(int crossAxisCount, HomeViewModel viewModel,
      double gridWidth, double gridHeight) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Observer(builder: (_) {
        if (viewModel.isLoading) {
          return buildCircularProgress();
        }
        return buildGrid(viewModel, crossAxisCount, gridWidth, gridHeight);
      }),
    );
  }

  GridView buildGrid(HomeViewModel viewModel, int crossAxisCount,
      double gridWidth, double gridHeight) {
    return GridView.builder(
      itemCount: viewModel.merchants.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount),
      itemBuilder: (context, index) {
        return Center(
            child: RestaurantCard(
                width: gridWidth,
                height: gridHeight,
                onPressed: () {
                  viewModel.index = index;
                  viewModel.navigateToDetailsPage();
                },
                merchants: viewModel.merchants[index]));
      },
    );
  }

  Center buildCircularProgress() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.black,
      ),
    );
  }
}
