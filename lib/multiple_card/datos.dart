class City {
  final String nombre;
  final String price;
  final String image;

  City({required this.nombre, required this.price, required this.image});
}

final cities = [
  City(
      nombre: 'San Francisco',
      price: '300USD',
      image: 'assets/images/images.jpeg'),
  City(nombre: 'New York', price: '350USD', image: 'assets/images/images.jpeg'),
  City(nombre: 'Tokyo', price: '340USD', image: 'assets/images/images.jpeg'),
  City(nombre: 'Miami', price: '200USD', image: 'assets/images/images.jpeg'),
];
