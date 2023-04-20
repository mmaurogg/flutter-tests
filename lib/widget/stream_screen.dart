import 'package:flutter/material.dart';
import 'package:testing/bloc/bloc_testing.dart';

class StreamScreen extends StatelessWidget {
  final testingBloc = TestingBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: StreamBuilder(
        stream: testingBloc.itemsContador,
        builder: (context, snapshot) {
          var count = snapshot.data ?? 0;
          print(count);
          return Text("Productos $count");
        },
      )),
      body: true
          ?
          //El StreamBuilder se mantiene escuchando el stream controller y por eso puede recibir info
          StreamBuilder(
              stream: testingBloc.getItems,
              builder: (_, AsyncSnapshot<List<String>> snapshot) {
                final items = snapshot.data ?? [];
                print(items);

                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (_, i) {
                    return ListTile(
                      title: Text(items[i]),
                    );
                  },
                );
              },
            )
          : null,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one),
        onPressed: () {},
      ),
    );
  }
}
