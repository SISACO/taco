
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSnackBarContentError extends StatelessWidget {
  final String errorText;

  CustomSnackBarContentError({Key? key, required this.errorText}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        
        Container(
          padding: const EdgeInsets.all(16),
          height: 75,
        
          decoration: const BoxDecoration(
            color: Color(0xFFC72C41),
            borderRadius: BorderRadius.all(Radius.circular(20)),
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
                    //   "Oops..!",
                    //   style: GoogleFonts.poppins(
                    //     fontSize: 18,
                    //     color: Colors.white,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    Text(
                      errorText, // Use the errorText parameter here
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                     // presetFontSizes: const [12, 10, 8],
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
              // ignore: deprecated_member_use
              color: const Color(0xFF801336),
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
                ),
              ),
              Positioned(
                top: 10,
                child: SvgPicture.asset(
                  "assets/icons/close.svg",
                  height: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
