class Character {
  final int id;
  final String name;
  List<String> image;
  Map<String, String> debut;
  Map<String, String> family;
  List<String> jutsu;
  List<String> elemen;
  Map<String, dynamic> personal;
  List<String> uniqueTrait;
  Map<String, dynamic> voiceActor;

  Character({
    required this.id,
    required this.name,
    required this.image,
    required this.debut,
    required this.family,
    required this.jutsu,
    required this.elemen,
    required this.personal,
    required this.uniqueTrait,
    required this.voiceActor,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      image: List<String>.from(json['images'] ?? []),
      debut: Map<String, String>.from(json['debut'] ?? {}),
      family: Map<String, String>.from(json['family'] ?? {}),
      jutsu: List<String>.from(json['jutsu'] ?? []),
      elemen: List<String>.from(json['natureType'] ?? []),
      personal: Map<String, dynamic>.from(json['personal'] ?? {}),
      uniqueTrait: List<String>.from(json['uniqueTraits'] ?? []),
      voiceActor: Map<String, dynamic>.from(json['voiceActors'] ?? {}),
    );
  }
}

