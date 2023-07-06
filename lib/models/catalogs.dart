// ignore_for_file: camel_case_types

class catalogmodel {
  static List<Item> items = [
    Item(
        id: 1,
        name: "Iphone 12 pro",
        desc: "Apple iphone 12th generation",
        price: 999,
        color: "#33505a",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7w9Sz-R1JSsnoZCPXG5BpPSsnF6xl5wv-A7eUoD4hkmnm-jS5MqDVD0m0fBeFevdcNtg&usqp=CAU")
  ];



  Item getById(num id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        color: map["color"],
        image: map["image"]);
  }
  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}
