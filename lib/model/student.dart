
class Student {

  int? id;
  final String name;
  final String mobile;
  final String course;
  final int totalFee;
  final int feePaid;

  Student({
    this.id,
    required this.name,
    required this.mobile,
    required this.course,
    required this.totalFee,
    required this.feePaid,
  });

  // Convert a Student into a Map.
  // The keys must correspond to the names of the
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'mobile': mobile,
      'course': course,
      'totalFee': totalFee,
      'feePaid': feePaid,
    };
  }
    // Convert Map to Student Object
    // named constructor
     factory Student.fromMap(Map<String, dynamic> map) {
      return Student(
        id: map['id'],
        name: map['name'],
        mobile: map['mobile'],
        course: map['course'],
        totalFee: map['totalFee'],
        feePaid: map['feePaid'],
      );
    }

}