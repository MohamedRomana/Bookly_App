import 'package:booklyapp/Features/home/presentation/views/widgets/books_rating.dart';
import 'package:booklyapp/constants.dart';
import 'package:booklyapp/core/util/app_router.dart';
import 'package:booklyapp/core/util/assets.dart';
import 'package:booklyapp/core/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: Row(
        children: [
          SizedBox(
            height: 125,
            child: AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(AssetsData.testImage),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .58,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Harry Potter \nand the Goblet of Fire',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle20.copyWith(
                    fontFamily: kGtsectrafine,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  'J.K. Rowling',
                  style: Styles.textStyle14,
                ),
                Row(
                  children: [
                    Text(
                      '19.99 €',
                      style: Styles.textStyle20
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    const BookRating(),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
