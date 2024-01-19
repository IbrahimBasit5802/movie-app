class Genre {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Genre.fromMap(Map<String, dynamic> map) {
    return Genre(
      id: map['id'],
      name: map['name'] as String,
    );
  }

  static List<Genre> toList(dynamic map) {
    List<Genre> list = [];
    for (var i = 0; i < map.length; i++) {
      list.add(Genre.fromMap(map[i]));
    }
    return list;
  }
}
