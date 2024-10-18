import 'package:booklyapp/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class SimilarBooksListViw extends StatelessWidget {
  const SimilarBooksListViw({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CustomBookImage(imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fbooks.goalkicker.com%2F&psig=AOvVaw22hZu3lUD9BMElquCzdmjU&ust=1729343588247000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCIjO9IKBmIkDFQAAAAAdAAAAABAE',),
          );
        },
      ),
    );
  }
}
