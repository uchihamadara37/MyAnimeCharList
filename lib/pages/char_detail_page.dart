import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/character_model.dart';

class CharacterDetailPage extends StatelessWidget {
  final Character character;

  CharacterDetailPage({required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Text(character.name, style: TextStyle(color: Colors.white)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.deepPurpleAccent],
              // begin: Alignment.topLeft,
              // end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.deepPurple.shade50],
            // begin: Alignment.topCenter,
            // end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: character.image.isNotEmpty
                            ? character.image[0]
                            : "https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png?20210521171500",
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    character.name,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Debut ->",
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 10, 10, 10),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "       Manga : ${character.debut["manga"]}\n",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 63, 63, 63),
                    ),
                  ),
                  Text(
                    "       Anime : ${character.debut["anime"]}\n",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 63, 63, 63),
                    ),
                  ),
                  Text(
                    "       Novel : ${character.debut["Novel"]}\n",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 63, 63, 63),
                    ),
                  ),
                  Text(
                    "       Movie : ${character.debut["movie"]}\n",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 63, 63, 63),
                    ),
                  ),
                  Text(
                    "       Game  : ${character.debut["game"]}\n",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 63, 63, 63),
                    ),
                  ),
                  Text(
                    "       Ova   : ${character.debut["ova"]}\n",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 63, 63, 63),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Family ->",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 63, 63, 63),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  character.family.isNotEmpty
                      ? Text(
                        "       ${character.family.keys.first} : ${character.family.values.first}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          color: const Color.fromARGB(255, 63, 63, 63),
                        ),
                      )
                      : SizedBox.shrink(),
                  SizedBox(height: 20),
                  Text(
                    "Jutsu ->",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 63, 63, 63),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ...List.generate(character.jutsu.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        "- ${character.jutsu[index]}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 63, 63, 63),
                        ),
                      ),
                    );
                  }),
                  SizedBox(height: 20),
                  Text(
                    "Elemen ->",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 63, 63, 63),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ...List.generate(character.elemen.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        "- ${character.elemen[index]}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 63, 63, 63),
                        ),
                      ),
                    );
                  }),
                  SizedBox(height: 20),
                  Text(
                    "Voice Actor ->",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 63, 63, 63),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "       japanese : ",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 63, 63, 63),
                    ),
                  ),
                  ...[
                    if (character.voiceActor["japanese"] != null)

                    if (character.voiceActor["japanese"] is List )
                      ...List.generate(
                        character.voiceActor["japanese"].length,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(
                              "            ${character.voiceActor["japanese"][index]}",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 63, 63, 63),
                              ),
                            ),
                          );
                        },
                      )
                      else
                      Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(
                              "            ${character.voiceActor["japanese"]}",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 63, 63, 63),
                              ),
                            ),
                          )
                    else
                      SizedBox.shrink(),
                  ],
                  Text(
                    "       english : ",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 63, 63, 63),
                    ),
                  ),
                  ...[
                    if (character.voiceActor["english"] != null)
                    if  (character.voiceActor["english"] is List )
                      ...List.generate(character.voiceActor["english"].length, (
                        index,
                      ) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            "             ${character.voiceActor["english"][index]}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 63, 63, 63),
                            ),
                          ),
                        );
                      })
                      else
                      Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            "             ${character.voiceActor["english"]}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 63, 63, 63),
                            ),
                          ),
                        )
                    else
                      SizedBox.shrink(),
                  ],
                  // Expanded(
                  //   child: SingleChildScrollView(
                  //     child: Text(character.name, style: TextStyle(fontSize: 16)),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
