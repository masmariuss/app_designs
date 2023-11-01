
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: _Slides()
            ),
            _Dots(),

          ],
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(),
          _Dot(),
          _Dot(),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: const BoxDecoration(
        color: Colors.black54,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  @override
  Widget build(BuildContext context) {
    return PageView(
        children: const <Widget>[
          _Slide('assets/svg/slide-1.svg'),
          _Slide('assets/svg/slide-2.svg'),
          _Slide('assets/svg/slide-3.svg'),
        ],
    );
  }
}

class _Slide extends StatelessWidget {

  final String svg;

  const _Slide(this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset(svg),
    );
  }
}