import 'package:Taco/reuse/button.dart';
import 'package:Taco/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PolicyDialog extends StatelessWidget {
  PolicyDialog({
    required Key key,
    this.radius = 5,
    required this.mdFileName,
  })  : assert(mdFileName.contains('.md'),
            'The file must contain the .md extension'),
        super(key: key);

  final double radius;
  final String mdFileName;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: Future.delayed(Duration(milliseconds: 700)).then((value) {
                return rootBundle.loadString('assets/privacy_policy.md');
              }),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Markdown(
                    data: snapshot.data.toString(),
                  );
                }
                return Center(
                  child: LoadingAnimationWidget.prograssiveDots(
                    color: appTheme.indigo400,
                    size: 50,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ReusableButton(
              buttonText: 'Close',
              onPressed: () => Navigator.of(context).pop(),
              textColor: appTheme.whiteA700,
              buttonColor: appTheme.indigo400,
              buttonWidth: 100,
              buttonradius: 30,
              buttonHeight: 40,
            ),
          )
        ],
      ),
    );
  }
}
