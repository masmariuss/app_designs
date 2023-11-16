
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';
import '../widgets/widgets.dart';


class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final VoidCallback onPress;

  ItemBoton( this.icon, this.texto, this.color1, this.color2, this.onPress );
}



class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {

    final items = <ItemBoton>[
      ItemBoton( FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5), () {
        print('hola1');
      } ),
      ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6), () {
        print('hola2');
      } ),
      ItemBoton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3), () {
        print('hola3');
      } ),
      ItemBoton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D), () {
        print('hola4');
      } ),
      ItemBoton( FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5), () {
        print('hola5');
      } ),
      ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6), () {
        print('hola6');
      } ),
      ItemBoton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3), () {
        print('hola7');
      } ),
      ItemBoton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D), () {
        print('hola8');
      } ),
      ItemBoton( FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5), () {
        print('hola9');
      } ),
      ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6), () {
        print('hola10');
      } ),
      ItemBoton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3), () {
        print('hola11');
      } ),
      ItemBoton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D), () {
        print('hola12');
      } ),
    ];

    List<Widget> itemMap = items.map(
      (item) => FadeInLeft(
        duration: const Duration(milliseconds: 250),
        child: BotonGordo(
          icon: item.icon,
          texto: item.texto,
          color1: item.color1,
          color2: item.color2,
          onPress: item.onPress,
        ),
      )
    ).toList();


    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 200),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 80),
                ...itemMap
              ],
            ),
          ),
          const _Encabezado()
        ],
      )
    );
  }
}

class _Encabezado extends StatelessWidget {
  const _Encabezado({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const IconHeader(
          icon: FontAwesomeIcons.plus, 
          title: 'Asistencia Médica', 
          subtitle: 'Has solicitado',
          color1: Color(0xff536CF6),
          color2: Color(0xff66A9F2),
        ),
        Positioned(
          right: 0,
          top: 44,
          child: RawMaterialButton(
            onPressed: () {  },
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15.0),
            child: const FaIcon(
              FontAwesomeIcons.ellipsisVertical,
              color: Colors.white,
            ),
          )
        )
      ],
    );
  }
}

class BotonGordoTemp extends StatelessWidget {
  const BotonGordoTemp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      icon: FontAwesomeIcons.carBurst,
      texto: 'Motor Accident',
      color1: const Color(0xff6989F5),
      color2: const Color(0xff906EF5),
      onPress: (){print('Click!');},
    );
  }
}



class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const IconHeader(
      icon: FontAwesomeIcons.plus, 
      title: 'Aistencia Médica', 
      subtitle: 'Has solicitado',
      color1: Color(0xff526BF6),
      color2: Color(0xff67ACF2),
    );
  }
}


