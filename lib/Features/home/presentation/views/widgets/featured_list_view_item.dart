import 'package:booklyapp/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:booklyapp/core/widgets/custom_circular_indecator_widget.dart';
import 'package:booklyapp/core/widgets/custom_failure_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: CustomBookImage(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks.thumbnail,
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomFailureWidget(errMessage: state.errMessage);
        } else {
          return const CustomCircularIndecatorWidget();
        }
      },
    );
  }
}
