import 'package:easy_separator/easy_separator.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class QuestionScreenHolder extends StatelessWidget {
  const QuestionScreenHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Container line = Container(
      width: double.infinity,
      height: 12.0,
      color: Theme.of(context).scaffoldBackgroundColor,
    );
    Container answer = Container(
      width: double.infinity,
      height: 50.0,
      color: Theme.of(context).scaffoldBackgroundColor,
    );

    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.blueGrey.withOpacity(0.1),
      child: EasySeparatedColumn(
        separatorBuilder: ((context, index) => const SizedBox(
              height: 20,
            )),
        children: [
          EasySeparatedColumn(
            separatorBuilder: ((context, index) => const SizedBox(
                  height: 20,
                )),
            children: [
              line,
              line,
              line,
              line,
            ],
          ),
          answer,
          answer,
          answer,
        ],
      ),
    );
  }
}
