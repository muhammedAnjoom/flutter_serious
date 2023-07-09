

// student data model
class StudentModel {
  int? id;
  final String name;
  final String age;
  final String branch;
  final String mark;
  final String image;

  static StudentModel fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final name = map['name'] as String;
    final age = map['age'] as String;
    final branch = map['branch'] as String;
    final mark = map['mark'] as String;
    final image = map['image'] as String;
    return StudentModel(
      name: name,
      age: age,
      branch: branch,
      mark: mark,
      image: image,
      id: id
    );
  }

  StudentModel({
    required this.name,
    required this.age,
    required this.branch,
    required this.mark,
    required this.image,
    this.id,
  });
}
