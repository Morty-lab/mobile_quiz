class User {
  User({
    required this.name,
    required this.email,
    required this.age,
    required this.image
});
  final String name;
  final String email;
  final int age;
  final String image;


}


final main_user = User(name: "Anie", email: "mail.com", age: 21,image: "https://i.pinimg.com/originals/75/d4/42/75d442fd5aabfce76372fea6c1218754.jpg");
