
import 'package:flutter/material.dart';


class SliverListPage extends StatelessWidget {
  const SliverListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          const Positioned(
            bottom: -10,
            right: 0,
            child: _BotonNewList()
          )
        ],
      )
    );
  }
}


class _BotonNewList extends StatelessWidget {
  const _BotonNewList();

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return ButtonTheme(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffED6762),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40))
          )),
        onPressed: () {  }, 
        child: SizedBox(
          height: size.height*0.12,
          width: size.width*0.8,
          child: const Center(
            child: Text(
              'CREATE NEW LIST',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 2
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {

  final items = [
    const _ListItem( 'Orange', Color(0xffF08F66) ),
    const _ListItem( 'Family', Color(0xffF2A38A) ),
    const _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    const _ListItem( 'Books', Color(0xffFCEBAF) ),
    const _ListItem( 'Orange', Color(0xffF08F66) ),
    const _ListItem( 'Family', Color(0xffF2A38A) ),
    const _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    const _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[

        /* SliverAppBar(
          // elevation: 0,
          floating: true,
          backgroundColor: Colors.amber,
          title: Text('Hola Mundo'),
        ), */

        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minheight: 170,
            maxheight: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: _Titulo(),
            )
          ),
        ),

        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            const SizedBox(height: 100)
          ])
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate{

  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.minheight, 
    required this.maxheight, 
    required this.child
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => (minheight > maxheight) ? minheight : maxheight;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return  maxheight != oldDelegate.maxheight ||
            minheight != oldDelegate.minheight ||
            child     != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height:30),
        Container(
          margin: const EdgeInsets.only(left: 8, top: 24),
          child: const Text('New', style: TextStyle(color: Color(0xff532128), fontSize: 48)),
        ),
        Stack(
          children: [
            const SizedBox(width: 140,),
            Positioned(
              bottom: 8,
              left: -12,
              child: Container(
                margin: const EdgeInsets.only(left: 28),
                width: 120,
                height: 8,
                color: const Color(0xffF7CDD5),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 26) ,
              child: const Text('List', style: TextStyle(color: Color(0xffD93A30), fontSize: 48, fontWeight: FontWeight.bold),))
          ],
        )
      ],
    );
  }
}

class _ToDoList extends StatelessWidget {

  final items = [
    const _ListItem( 'Orange', Color(0xffF08F66) ),
    const _ListItem( 'Family', Color(0xffF2A38A) ),
    const _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    const _ListItem( 'Books', Color(0xffFCEBAF) ),
    const _ListItem( 'Orange', Color(0xffF08F66) ),
    const _ListItem( 'Family', Color(0xffF2A38A) ),
    const _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    const _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index]
    );
  }
}

class _ListItem extends StatelessWidget {

  final String titulo;
  final Color color;

  const _ListItem(
    this.titulo, 
    this.color
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(vertical:10, horizontal: 16),
      padding:const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(28)
      ),
      child: Text(
        titulo, 
        style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}