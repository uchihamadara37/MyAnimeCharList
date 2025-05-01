import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/character_model.dart';
import '../services/api_service.dart';
import 'char_detail_page.dart';

class CharacterListPage extends StatefulWidget {
  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  String selectedGroup = 'akatsuki';
  late Future<List<Character>> characterFuture;

  @override
  void initState() {
    super.initState();
    characterFuture = ApiService.fetchCharacters(selectedGroup);
  }

  void switchGroup(String group) {
    setState(() {
      selectedGroup = group;
      characterFuture = ApiService.fetchCharacters(group);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WikiNaruto', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.deepPurpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              navButton('Akatsuki', 'akatsuki'),
              navButton('Kara', 'kara'),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.deepPurple.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder<List<Character>>(
          future: characterFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final char = snapshot.data![index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                        char.image.isNotEmpty
                            ? char.image[0]
                            : "https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png?20210521171500",
                      ),
                    ),
                    title: Text(char.name),
                    subtitle: Text(
                      "Status : ${char.personal["status"] ?? "null"}",
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => CharacterDetailPage(character: char),
                        ),
                      );
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Failed to load characters.'));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget navButton(String label, String group) {
    return TextButton(
      onPressed: () => switchGroup(group),
      child: Row(
        spacing: 5,
        children: [
          Icon(
            group == "akatsuki"
                ? Icons.cloud_queue_rounded
                : Icons.ac_unit_outlined,
            size: selectedGroup == group ? 30 : 20,
            color: selectedGroup == group ? Colors.white : Colors.white60,
          ),

          Text(
            label,
            style: TextStyle(
              color: selectedGroup == group ? Colors.white : Colors.white60,
              fontWeight:
                  selectedGroup == group ? FontWeight.bold : FontWeight.w500,
              fontSize: selectedGroup == group ? 18 : 15,
            ),
          ),
        ],
      ),
    );
  }
}
