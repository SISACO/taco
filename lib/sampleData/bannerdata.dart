
class banner {
  String? name;
  String? image;
  String? image1;
  String? price;
}
List<banner> banners() {
  banner one = banner();
  one.image = '1.jpg';
  one.name = 'Garmin';
  one.price = '3500';
  banner two = banner();
  two.image = '2.jpg';
  two.name = 'Phone Stand';
  two.price = '170';
  banner three = banner();
  three.image = '3.jpg';
  three.image1 = '5.jpg';
  three.name = 'Travel bag';
  three.price = '2100';
  banner four = banner();
  four.image = '6.jpg';
  four.name = 'Camera Headphone combo';
  four.price = '2500';
  return [one, two, three, four];
}