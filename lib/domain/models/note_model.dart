class NoteModel {
  final String id;
  final String title;
  final String message;

  NoteModel({
    required this.id,
    required this.title,
    required this.message,
  });

  factory  NoteModel.fromjson(Map<String, dynamic> data,String id) {
    return NoteModel(
      id:  id,
      title: data['title'] ?? '',
      message: data['message'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'message': message,
    };
  }
}