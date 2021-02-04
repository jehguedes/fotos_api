import 'package:flutter/material.dart';
import 'package:fotos_api/screens/fotos.dart';
import 'package:fotos_api/service/placeholder_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _placeholderService = PlaceholderService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albuns'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        child: FutureBuilder<List>(
            future: _placeholderService.getAlbuns(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Fotos(snapshot.data[index].id),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("${snapshot.data[index].id}"),
                              ListTile(
                                title: Text(
                                  '${snapshot.data[index].title}',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Erro: ${snapshot.error}'));
              }

              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
