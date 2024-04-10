// ignore_for_file: deprecated_member_use
import 'package:Taco/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSnackBarContentSuccess extends StatelessWidget {
  final String errorText;

  CustomSnackBarContentSuccess({Key? key, required this.errorText}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 75,
          decoration: BoxDecoration(
            color: appTheme.indigo400, // #0B7141
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 48,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "Well done!",
                    //   style: GoogleFonts.poppins(
                    //     fontSize: 18,
                    //     color: Colors.white,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    Text(
                      errorText, // Use the errorText parameter here
                      style: GoogleFonts.poppins(
                        color: appTheme.whiteA700,
                        fontSize: 13,
                      ),
                      // maxLines: 1,
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
            ),
            child: SvgPicture.asset(
              "assets/icons/bubbles.svg",
              height: 48,
              width: 40,
              color: appTheme.blue200Af //#004E2F
            ),
          ),
        ),
        Positioned(
          top: -14,
          left: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                child: SvgPicture.asset(
                  "assets/icons/fail.svg",
                  height: 40,
                  color: appTheme.blue200Af
                ),
              ),
              Positioned(
                top: 10,
                child: SvgPicture.asset(
                  "assets/icons/check_mark.svg",
                  height: 22,
                  color: appTheme.whiteA700

                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
