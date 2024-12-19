class MyUserEntity {
  String id;
  String email;

  MyUserEntity({
    required this.id,
    required this.email,
  });

  Map<String, dynamic> toDocument(MyUserEntity entity){
    return {
      "id": id,
      "name": email,
    };
  }

  MyUserEntity fromDocument(Map<String, dynamic> doc){
    return MyUserEntity(
      id: doc["id"],
      email: doc["email"],
    );
  }
}