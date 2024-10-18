import 'package:booklyapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/books_rating.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:booklyapp/constants.dart';
import 'package:booklyapp/core/util/app_router.dart';
import 'package:booklyapp/core/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: bookModel);
      },
      child: Row(
        children: [
          SizedBox(
            height: 125,
            child: CustomBookImage(
                imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? ''),
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
                  bookModel.volumeInfo.title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle20.copyWith(
                    fontFamily: kGtsectrafine,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  bookModel.volumeInfo.authors![0],
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
                    BookRating(
                      rating: bookModel.volumeInfo.averageRating ?? 0,
                      count: bookModel.volumeInfo.ratingsCount ?? 0,
                    ),
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
