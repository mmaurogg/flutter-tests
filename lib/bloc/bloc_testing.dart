import 'dart:async';

const ITEMS = ['PRODUCTOS', 'MURCIELAGO', 'LISTADO', 'OTRO ITEM'];

class TestingBloc {

  //1. construllo un streamController:
  // Convertimos la lista a stream, usamos async* para indicar que trabajaremos con streams
  Stream<List<String>> get getItems async* {
    final List<String> items = [];
    for(String item in ITEMS){
      // uso await para y un delayed para dar efecto de retardo
      await Future.delayed(Duration(seconds: 2));
      items.add( item );
      
      // uso para  ya que el return me corta el stream
      yield items;
    }
  }

  //2. Manipulo el stream con el streamController:
  //StreamController Este stream es emitido de forma controlada
  StreamController<int> _itemsContador = StreamController<int>();
  //Se crea el obserbable
  Stream<int> get itemsContador => _itemsContador.stream;

  // enlazo los streams desde el constructor
  TestingBloc(){
    // indico el tratamiento de datos que hará StreamController
    getItems.listen((itemsList) => _itemsContador.add(itemsList.length));
  }



  dispose(){
    _itemsContador.close();
  }


}