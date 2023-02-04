class SelectProductModel {
  int price;
  String title;
  String description;
  String gender;
  String imageUrl;
  int delevaryService;

  SelectProductModel(
      {required this.price,
      required this.title,
      required this.gender,
      required this.description,
      required this.imageUrl,
      required this.delevaryService});

  SelectProductModel.fromFireStore(Map<String, dynamic> map)
      : this(
            price: map['price'],
            delevaryService: map['delevary_service'],
            title: map['title'],
            gender: map['gender'],
            imageUrl: map['image_url'],
            description: map['description']);
}
