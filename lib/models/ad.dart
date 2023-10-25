class Ad {
  late String? model, mark, city, phone;
  List<String>? photos = [];
  late int? distance, price, year;
  late bool isSpecial;
  Ad({
    this.model = '',
    this.mark = '',
    this.city = '',
    this.phone = '',
    this.photos,
    this.distance = 0,
    this.price = 0,
    this.year = 2022,
    this.isSpecial = false,
  });
}
