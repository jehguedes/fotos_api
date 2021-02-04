import 'package:flutter/material.dart';
import 'package:fotos_api/models/fotos_model.dart';
import 'package:fotos_api/service/placeholder_service.dart';

class Fotos extends StatelessWidget {
  final _placeholderService = PlaceholderService();
  final int albumId;
  Fotos(this.albumId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fotos'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        color: Colors.white24,
        child: FutureBuilder<List<Foto>>(
          future: _placeholderService.getFotos(albumId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Text("${snapshot.data[index].id}"),
                        ListTile(
                          title: Text(
                            '${snapshot.data[index].title}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Image.network(snapshot.data[index].url),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Erro: ${snapshot.error}'));
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
