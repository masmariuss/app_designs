
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../pages/pages.dart';

final pageRoutes = <_Route>[
  
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', const SlideshowPage()),
  _Route(FontAwesomeIcons.truckMedical, 'Emergency', const EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Heading', const HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarryBox, 'Animated Box', const CuadradoAnimadoPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Progress Bar', const GraficasCicularesPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', const PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', const SliverListPage()),
  
];

class _Route {

  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);

}