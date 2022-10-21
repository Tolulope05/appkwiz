import 'package:appkwiz/configs/themes/app_dark_theme.dart';
import 'package:appkwiz/configs/themes/app_icons.dart';
import 'package:appkwiz/configs/themes/app_light_theme.dart';
import 'package:appkwiz/configs/themes/cusstom_text_style.dart';
import 'package:appkwiz/configs/themes/ui_paramters.dart';
import 'package:appkwiz/models/question_paper_model.dart';
import 'package:appkwiz/widgets/app_icon_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionCard extends StatelessWidget {
  final QuestionPaperModel model;
  const QuestionCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _padding = 10.0;
    return Container(
      decoration: BoxDecoration(
          borderRadius: UIParamters.cardBorderRadius,
          color: Theme.of(context).cardColor),
      child: Padding(
        padding: EdgeInsets.all(_padding),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(20),
                  child: ColoredBox(
                    // A contaainer with only color properties needed
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    child: SizedBox(
                      height: Get.width * 0.15,
                      width: Get.width * 0.15,
                      child: CachedNetworkImage(
                        placeholder: (context, url) => Container(
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(
                            color: Colors.amber,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/images/app_splash_logo.png"),
                        imageUrl: model.imageUrl!,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.title,
                        style: cardTitleStyle(context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 15),
                        child: Text(
                          model.description,
                        ),
                      ),
                      Row(
                        children: [
                          AppIconText(
                            iconData: Icons.help_outline_sharp,
                            text: "${model.questionCount} questions",
                          ),
                          const SizedBox(width: 15),
                          AppIconText(
                            iconData: Icons.timer,
                            text: model.timeInMinute(),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: -_padding,
              right: -_padding,
              child: GestureDetector(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(cardBorederRadius),
                      bottomRight: Radius.circular(cardBorederRadius),
                    ),
                  ),
                  child: const Icon(
                    AppIcons.trophyOutline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
