
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  const HeaderBordesRedondeados({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        )
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter() ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // PaintingStyle.stroke; 
    lapiz.strokeWidth = 2;

    final path = Path();

    // Dibujar con el path y el lápiz
    path.moveTo(0, size.height*0.35);
    path.lineTo(size.width, size.height*0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // path.moveTo(0, size.height*0.5);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangular extends StatelessWidget {
  const HeaderTriangular({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter() ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // PaintingStyle.stroke; 
    lapiz.strokeWidth = 2;

    final path = Path();

    // Dibujar con el path y el lápiz
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);  
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  const HeaderPico({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter() ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // PaintingStyle.stroke; 
    lapiz.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el lápiz
    path.lineTo(0, size.height*0.25);
    path.lineTo(size.width*0.5, size.height*0.35);
    path.lineTo(size.width, size.height*0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);  
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter() ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // PaintingStyle.stroke; 
    lapiz.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el lápiz
    path.lineTo(0, size.height*0.25);
    path.quadraticBezierTo(size.width*0.5, size.height*0.5, size.width, size.height*0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);  
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWave extends StatelessWidget {

  final Color color;

  const HeaderWave({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(color) ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {

  final Color color;

  _HeaderWavePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    // Propiedades
    lapiz.color = color; // const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // PaintingStyle.stroke; 
    lapiz.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el lápiz
    path.lineTo(0, size.height*0.25);
    path.quadraticBezierTo(size.width*0.25, size.height*0.35, size.width*0.5, size.height*0.25);
    path.quadraticBezierTo(size.width*0.75, size.height*0.15, size.width, size.height*0.25);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, size.height*0.25);


    canvas.drawPath(path, lapiz);  
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaveGradient extends StatelessWidget {
  const HeaderWaveGradient({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter() ),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = Rect.fromCircle(
      center: const Offset(160, 50), 
      radius: 180
    );

    const Gradient gradiente = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color> [
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA),
      ],
      stops: [
        0.2,
        0.6,
        1
      ]
    ) ;

    final lapiz = Paint()..shader = gradiente.createShader(rect);

    // Propiedades
    // lapiz.color = const Color(0xff615AAB);
    lapiz.color = Colors.red;
    lapiz.style = PaintingStyle.fill; // PaintingStyle.stroke; 
    lapiz.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el lápiz
    path.lineTo(0, size.height*0.25);
    path.quadraticBezierTo(size.width*0.25, size.height*0.35, size.width*0.5, size.height*0.25);
    path.quadraticBezierTo(size.width*0.75, size.height*0.15, size.width, size.height*0.25);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, size.height*0.25);


    canvas.drawPath(path, lapiz);  
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


class IconHeader extends StatelessWidget {

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color1;
  final Color color2;

  const IconHeader({
    super.key, 
    required this.icon, 
    required this.title, 
    required this.subtitle, 
    this.color1 = Colors.grey, 
    this.color2 = Colors.blueGrey
  });

  @override
  Widget build(BuildContext context) {
    
    const Color colorWhithe = Colors.white;

    return Stack(
      children: [
        _IconHeaderBackground(
          color1: color1, 
          color2: color2
        ),

        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            icon, 
            size: 250,
            color: Colors.white.withOpacity(0.2),
          )
        ),
        Column(
          children: [
            const SizedBox(height: 80, width: double.infinity),
            Text(
              subtitle, 
              style: TextStyle(
                fontSize: 20, 
                color: colorWhithe.withOpacity(0.7)
              )
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 28, 
                color: colorWhithe, 
                fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 20),
            FaIcon(
              icon, 
              size: 80,
              color: Colors.white.withOpacity(0.8),
            )
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {

  final Color color1;
  final Color color2;

  const _IconHeaderBackground({
    required this.color1, 
    required this.color2
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color> [
            color1,
            color2,           
          ])
      ),
    );
  }
}
