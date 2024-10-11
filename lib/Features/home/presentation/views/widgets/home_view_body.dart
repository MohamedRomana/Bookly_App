import 'package:booklyapp/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/featured_list_view_item.dart';
import 'package:booklyapp/core/util/styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: CustomAppBar(),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: FeaturedListViewItem(),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Best Seller',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: BestSellerListView(),
          ),
        )
      ],
    );
  }
}
