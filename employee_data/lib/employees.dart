class Employees {
  int id;
  String imageUrl;
  String firstName;
  String lastName;
  String email;
  String contact;
  int age;
  String dateOfBirth;
  double salary;
  String address;

  Employees(
      {required this.id,
      required this.imageUrl,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.contact,
      required this.age,
      required this.dateOfBirth,
      required this.salary,
      required this.address});

  factory Employees.fromJson(Map<String, dynamic> json) {
    return Employees(
        id: json['id'],
        imageUrl: json['imageUrl'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        contact: json['contactNumber'],
        age: json['age'],
        dateOfBirth: json['dob'],
        salary: json['salary'],
        address: json['address']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imageUrl'] = imageUrl;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['contactNumber'] = contact;
    data['age'] = age;
    data['dob'] = dateOfBirth;
    data['salary'] = salary;
    data['address'] = address;
    return data;
  }
}
