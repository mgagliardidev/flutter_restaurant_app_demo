class Food {
  String name;
  num price;
  String imagePath;
  String rating;

  Food ({
    required this.name,
    required this.price,
    required this.rating,

    this.imagePath = ''
  });


  get getName => name;
  set setName(String name) => this.name = name;

  get getPrice => price;
  set setPrice( price) => this.price = price;

  get getImagePath => 'assets/images/food_icons/$name.png';
  //set setImagePath( imagePath) => this.imagePath = imagePath;

  get getRating => rating;
  set setRating( rating) => this.rating = rating;

  
}
