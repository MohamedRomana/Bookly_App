import 'package:booklyapp/Features/home/presentation/manager/similar_books/similar_books_cubit.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:booklyapp/core/widgets/custom_circular_indecator_widget.dart';
import 'package:booklyapp/core/widgets/custom_failure_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListViw extends StatelessWidget {
  const SimilarBooksListViw({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSucces) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: CustomBookImage(
                    imageUrl:
                        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fbooks.goalkicker.com%2F&psig=AOvVaw22hZu3lUD9BMElquCzdmjU&ust=1729343588247000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCIjO9IKBmIkDFQAAAAAdAAAAABAE',
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomFailureWidget(errMessage: state.errMessage);
        } else {
          return const CustomCircularIndecatorWidget();
        }
      },
    );
  }
}
