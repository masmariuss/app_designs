
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';
import '../widgets/slideshow.dart';


class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: MiSlideshow()),
          Expanded(child: MiSlideshow()),
        ],
      )
    );
  }
}

class MiSlideshow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    final indicatorColor = appTheme.currentTheme.indicatorColor;

    return Slideshow(
      bulletPrimario: 12,
      bulletSecundario: 8,
      dotsUp: false,
      dotsColorPrimario: (appTheme.darkTheme) ? indicatorColor : const Color(0xFF26A69A),
      // dotsColorSecundario: Colors.black12,
      slides: [
        SvgPicture.asset('assets/svg/slide-1.svg'),
        SvgPicture.asset('assets/svg/slide-2.svg'),
        SvgPicture.asset('assets/svg/slide-3.svg'),
        SvgPicture.asset('assets/svg/slide-4.svg'),
        SvgPicture.asset('assets/svg/slide-5.svg'),
      ],
    );
  }
}