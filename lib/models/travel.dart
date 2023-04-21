class Travel {
  String? name;
  String? location;
  String? description;
  String? img;
  String? temp;
  String? rating;
  String? distance;
  String? price;

  Travel(
      {required this.name,
      required this.location,
      required this.description,
      required this.img,
      required this.temp,
      required this.rating,
      required this.distance,
      required this.price});
}

List<Travel> listTravel = [
  Travel(
      name: "Tehran",
      location: "Iran,Tehran",
      description: "Iran Iran Iran Iran Iran Iran",
      img: "assets/images/iran.jpg",
      temp: "25",
      rating: "5",
      distance: "5000",
      price: "1000"),
  Travel(
      name: "Malezi",
      location: "Malezi,Sangapour",
      description: "Malezi Malezi Malezi Malezi Malezi Malezi",
      img: "assets/images/malezi.jpg",
      temp: "30",
      rating: "5",
      distance: "3000",
      price: "3000"),
  Travel(
      name: "Paris",
      location: "France,Paris",
      description: "Paris Paris Paris Paris Paris",
      img: "assets/images/parisss.jpg",
      temp: "20",
      rating: "5",
      distance: "1500",
      price: "3000"),
  Travel(
      name: "Switzerland",
      location: "Switzerland,Tehran",
      description: "Switzerland Switzerland Switzerland Switzerland",
      img: "assets/images/switzerland.jpg",
      temp: "15",
      rating: "5",
      distance: "500",
      price: "5000"),
];
