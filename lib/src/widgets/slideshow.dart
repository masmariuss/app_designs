
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Slideshow extends StatelessWidget {

  final List<Widget> slides;
  final bool dotsUp;
  final Color dotsColorPrimario;
  final Color dotsColorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  const Slideshow({
    super.key, 
    required this.slides, 
    this.dotsUp               = false, 
    this.dotsColorPrimario    = const Color(0xFF26A69A),
    this.dotsColorSecundario  = Colors.black26, 
    this.bulletPrimario       = 12.0, 
    this.bulletSecundario     = 12.0, 
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {

              Provider.of<_SlideshowModel>(context).dotsColorPrimario   = dotsColorPrimario;
              Provider.of<_SlideshowModel>(context).dotsColorSecundario = dotsColorSecundario;

              Provider.of<_SlideshowModel>(context).bulletPrimario      = bulletPrimario;
              Provider.of<_SlideshowModel>(context).bulletSecundario    = bulletSecundario;

              return _CrearEstructuraSlideshow(dotsUp: dotsUp, slides: slides);
              },
          ),
        ),
      ),
    );
  }
}

class _CrearEstructuraSlideshow extends StatelessWidget {
  const _CrearEstructuraSlideshow({
    required this.dotsUp,
    required this.slides,
  });

  final bool dotsUp;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(dotsUp) 
          _Dots(slides.length),
        Expanded(
          child: _Slides(slides)
        ),
        if (!dotsUp) 
          _Dots(slides.length),
        ],
      );
  }
}

class _Dots extends StatelessWidget {

  final int totalSlides;

  const _Dots(
    this.totalSlides
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides, (index) => 
          _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;

  const _Dot(
    this.index
  );

  @override
  Widget build(BuildContext context) {

    final ssModel = Provider.of<_SlideshowModel>(context);
    double size;
    Color color;

    if (ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5) {
      size  = ssModel.bulletPrimario;
      color = ssModel.dotsColorPrimario;
    } else {
      size  = ssModel.bulletSecundario;
      color = ssModel.dotsColorSecundario;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width   : size,
      height  : size,
      margin  : const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle), 
    );
  }
}

class _Slides extends StatefulWidget {

final List<Widget> slides;

  const _Slides(this.slides);


  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  final pageViewController = PageController();

  @override
    void initState() {
      super.initState();

      pageViewController.addListener(() {
        Provider.of<_SlideshowModel>(context, listen: false).currentPage = pageViewController.page!;
      });
    }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      children: widget.slides.map((slide) => _Slide(slide)).toList(),
    );
  }
}

class _Slide extends StatelessWidget {

  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width   : double.infinity,
      height  : double.infinity,
      padding : const EdgeInsets.all(30),
      child   : slide,
    );
  }
}


class _SlideshowModel with ChangeNotifier{

  double _currentPage         = 0;
  Color _dotsColorPrimario    = const Color(0xFF00BFA6);
  Color _dotsColorSecundario  =  Colors.black26;
  double _bulletPrimario      = 15;
  double _bulletSecundario    = 12;


  double get currentPage => _currentPage;
  set currentPage (double pagina) {
    _currentPage = pagina;
    notifyListeners();
  }

  Color get dotsColorPrimario => _dotsColorPrimario;
  set dotsColorPrimario (Color color) {
    _dotsColorPrimario = color;
  }

  Color get dotsColorSecundario => _dotsColorSecundario;
  set dotsColorSecundario (Color color) {
    _dotsColorSecundario = color;
  }

  double get bulletPrimario => _bulletPrimario;
  set bulletPrimario (double size) {
    _bulletPrimario = size;
  }

  double get bulletSecundario => _bulletSecundario;
  set bulletSecundario (double size) {
    _bulletSecundario = size;
  }

}