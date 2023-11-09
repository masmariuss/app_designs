
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../widgets/pinterest_menu.dart';


class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            const PinterestGrid(),
            _PinterestMenuLocation(),
          ]
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final widthScreen = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context).mostrar;

    return Positioned(
      bottom: 28,
      child: SizedBox(
        width: widthScreen,
        child: Align(
          child: PinterestMenu(
            mostrar: mostrar,
            // backgroundColor: Colors.purple,
            // activeColor: Colors.blue,
            // inactiveColor: Colors.red,
            items: [
              PinterestButton(onPressed: () {print('Icon pie_ckart');}, icon: Icons.pie_chart),
              PinterestButton(onPressed: () {print('Icon search');}, icon: Icons.search),
              PinterestButton(onPressed: () {print('Icon notifications');}, icon: Icons.notifications),
              PinterestButton(onPressed: () {print('Icon supervised_user_circle');}, icon: Icons.supervised_user_circle),
            ],
          ),
        ),
      )
    );
  }
}

class PinterestGrid extends StatefulWidget {


  const PinterestGrid({super.key});

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {

  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {

    /* controller.addListener(() {
      print('ScrollListener ${controller.offset}');
    }); */
    controller.addListener(() {

    /* if (controller.offset > scrollAnterior) {
      print('Ocultar menú');
      } else {
        print('Mostrar menú');
      }  */

      
    if (controller.offset > scrollAnterior && controller.offset > 150) {
      Provider.of<_MenuModel>(context, listen: false).mostrar = false;
    } else {
      Provider.of<_MenuModel>(context, listen: false).mostrar = true;
    }
    /* if (controller.offset > scrollAnterior && controller.offset > 150) {
      Provider.of<_MenuModel>(context, listen: false).mostrar = false;
    } else {
      Provider.of<_MenuModel>(context, listen: false).mostrar = true;
    } */

      scrollAnterior = controller.offset;
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      controller: controller,
      crossAxisCount: 2,
      itemCount: items.length,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        return Tile(
          index: index,
          extent: (index % 5 + 1) * 100,
        );
      },
    );
  }
}

const _defaultColor = Color(0xFF34568B);

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.title,
    this.topPadding = 0,
    required this.child,
  });

  final String title;
  final Widget child;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: child,
      ),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({
    super.key,
    required this.index,
    this.extent,
    this.backgroundColor,
    this.bottomSpace,
  });

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor ?? _defaultColor,
      ),
      margin: const EdgeInsets.all(4),
      height: extent,
      child: Center(
        child: CircleAvatar(
          minRadius: 20,
          maxRadius: 20,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Text('$index', style: const TextStyle(fontSize: 20)),
        ),
      ),
    );

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
}


class _MenuModel with ChangeNotifier {

  bool _mostrar = true;

  bool get mostrar => _mostrar;
  set mostrar (bool valor) {
    _mostrar = valor;
    notifyListeners();
  } 

}