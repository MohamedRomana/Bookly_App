import 'package:booklyapp/core/util/styles.dart';
import 'package:flutter/material.dart';

class CustomFailureWidget extends StatelessWidget {
  const CustomFailureWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errMessage , style: Styles.textStyle18,));
  }
}
