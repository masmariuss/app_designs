
import 'package:flutter/material.dart';
import '../widgets/radial_progress.dart';


class GraficasCicularesPage extends StatefulWidget {
  const GraficasCicularesPage({super.key});

  @override
  State<GraficasCicularesPage> createState() => _GraficasCicularesPageState();
}

class _GraficasCicularesPageState extends State<GraficasCicularesPage> {

  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () { 
          setState(() {
            porcentaje += 10;
            if (porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row( 
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue),
            CustomRadialProgress(porcentaje: porcentaje, color: Colors.red),
            ]
          ),

          Row( 
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            CustomRadialProgress(porcentaje: porcentaje, color: Colors.green),
            CustomRadialProgress(porcentaje: porcentaje, color: Colors.yellow),
            ]
          )
        ]
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {

  final Color color;
  
  const CustomRadialProgress({
    super.key,
    required this.porcentaje, 
    required this.color,
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      // color: Colors.red,
      child: RadialProgress(
        porcentaje      : porcentaje, 
        colorPrimario   : color,
        colorSecundario : Colors.grey,
        grosorPrimario  : 10,
        grosorSecundario: 4,
      ),
      // child: Text('$porcentaje %', style: const TextStyle(fontSize: 50)),
    );
  }
}