import 'package:flutter/material.dart';

class noUsersScreen extends StatelessWidget {
  const noUsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("Experiencia compartida \nAgregar participante"),),
      body: Column(
        children: <Widget> [

          const SizedBox(height: 50,),
          _card(color: Colors.orange,),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 50),
            child: Text(
              "No hay miembros activos en tus clanes",
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.blue
              ),
            ),
          ),

          SizedBox(height: size.height - 700,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _elevatedButton(
                text: "CANCELAR",
                color: Colors.lightGreenAccent,
                opacity: 0.5,
                outlineColor: Colors.blueAccent,
                onPressed: (){},
              ),

              _elevatedButton(
                text: "ACEPTAR",
                color: Colors.green,
                opacity: 1.0,
                onPressed: (){},
              )
            ],
          ),

        ],
      )
    );
  }
}

class _card extends StatelessWidget {

  Color color;

  _card({required this.color});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      width: size.width - 100,
      height: 300,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20)
      ),
      //TODO: revisar si este es un buen widget
      child: Container(
        width: 150,
        height: 150,
        decoration: const BoxDecoration(
          color: Colors.white30,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.groups_outlined,
          color: Colors.white,
          size: 80,
        ),
      ),
    );
  }
}

class _elevatedButton extends StatelessWidget {
  String text;
  Color color;
  Color? outlineColor;
  double opacity;
  dynamic? onPressed;


  _elevatedButton({
    required this.text,
    required this.color,
    required this.opacity,
    this.outlineColor,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(StadiumBorder()),
        backgroundColor: MaterialStateProperty.all(color.withOpacity(opacity)),
          side: MaterialStateProperty.all(BorderSide(color: outlineColor ?? color, width: 2.0),)
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 20,
                color: outlineColor ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
