class SubmitInfo {
  String uid;
  int gender;
  int age;
  int phoneDegree;
  List offsetOrder = [
    "default",
    "up",
    "down",
    "right",
    "left",
    "default",
    "up",
    "down",
    "right",
    "left",
  ];
  List drawImages = [];

  SubmitInfo({
    required this.uid,
    required this.gender,
    required this.age,
    required this.phoneDegree,
  });

  void setGender(int gender) {
    this.gender = gender;
  }

  void setAge(int age) {
    this.age = age;
  }

  void setPhoneDegree(int phoneDegree) {
    this.phoneDegree = phoneDegree;
  }

  void setOffsetOrder(List offsetOrder) {
    this.offsetOrder = offsetOrder;
  }

  void addDrawImage(dynamic drawImage) {
    drawImages.add(drawImage);
  }

  void printInfo() {
    String gender = this.gender == 0 ? 'male' : 'female';
    print('-' * 20);
    print('gender: $gender');
    print('age: $age');
    print('phoneDegree: $phoneDegree');
    print('drawImages: $drawImages');
    print('-' * 20);
  }
}
