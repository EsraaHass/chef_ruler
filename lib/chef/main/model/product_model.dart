class MainPageModel {
  String title;
  String imageUrl;

  //String category;
  MainPageModel({required this.title, required this.imageUrl});

  MainPageModel.fromFireStore(Map<String, dynamic> map)
      : this(
          title: map['title'],
          imageUrl: map['image_url'],
          //category: map['category'],
        );

  Map<String, dynamic> toFireStore() {
    return {
      'title': title,
      'image_url': imageUrl,
      //'category': category,
    };
  }
}
