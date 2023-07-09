class Todo {

  final int? id;
  final String title;
  final String description;

  const Todo({
    this.id,
    required this.title,
    required this.description
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json['id'],
    title: json['title'],
    description: json['description']
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description
  };
}
