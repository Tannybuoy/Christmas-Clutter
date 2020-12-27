class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;

  Hotel({
    this.imageUrl,
    this.name,
    this.address,
    this.price,
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/homealone.jpg',
    name: 'Home Alone',
    address: 'Netflix',
    price: 99,
  ),
  Hotel(
    imageUrl: 'assets/images/elf.jpg',
    name: 'Elf',
    address: 'Amazon Prime',
    price: 96,
  ),
  Hotel(
    imageUrl: 'assets/images/grinch.jpg',
    name: 'The Grinch',
    address: 'Hotstar',
    price: 90,
  ),
];
