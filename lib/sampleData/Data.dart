import 'dart:math';
Random random = Random();

List<String> bedTypes = ['Single', 'Double','Twin XL','Sofa Bed',];
List<String> imageUrls = [
  'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.Z_Q09xr_RWyU44-BV1VctAHaFY%26pid%3DApi&f=1&ipt=45591eabe418fbf0d8174a241031e7280adc8fa6bb4cd458a8ccd34d979033f4&ipo=images',
  'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.eUmRjpZOz3-yqS_-wEwRPQHaE8%26pid%3DApi&f=1&ipt=47e26272d71314fe0fd1cfafc9ed561777aaad907f2352d86169637426df98c0&ipo=images',
  'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.Yi9Cvg7fxkXk5ORrAjXcmAHaFN%26pid%3DApi&f=1&ipt=14fc3b1490abad76c2c65315134c301e70193553ff40f08826a9e347c0b9feab&ipo=images',
  'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.t0iYeW_ZBz69hcqabOnYtwHaFj%26pid%3DApi&f=1&ipt=0e66915a81921d15722732f7bcbc951f1daae00cd6333b1f69ff4e93e0064f95&ipo=images',
  'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP._XuZby4A43FdQhGGOy_avwHaEK%26pid%3DApi&f=1&ipt=48b6365267cf252af375d3395cd5c4ff5ecc888cf0a153fe225174d2725abdf7&ipo=images',
  // Add more image URLs as needed
];
List<double> prices = [1000.0, 1500.0, 2500.0,3000.0,5000.0,850.0]; 
List<String> dates = [
  '2022, 4, 20',
 '2022, 4, 25',
  '2022, 4, 22',
]; // Example dates
List<String> statuses = ['Booked','Available'];
List<double> reviews = [1,2,3,4,5]; // Example reviews

class Room {
  final String bedType;
  final double price;
  final String date;
  final String status;
  final double review;
  final String imageUrl;


  Room({
    required this.bedType,
    required this.price,
    required this.date,
    required this.status,
    required this.review,
     required this.imageUrl,
  });
}

List<Room> generateRooms(int count) {
  return List.generate(count, (index) {
    return Room(
      bedType: bedTypes[random.nextInt(bedTypes.length)],
      price: prices[random.nextInt(prices.length)],
      date: dates[random.nextInt(dates.length)],
      status: statuses[random.nextInt(statuses.length)],
      review: reviews[random.nextInt(reviews.length)],
      imageUrl: imageUrls[random.nextInt(imageUrls.length)],
    );
  });
}

List names = [
  "Ling Waldner",
  "Gricelda Barrera",
  "Lenard Milton",
  "Bryant Marley",
  "Rosalva Sadberry",
  "Guadalupe Ratledge",
  "Brandy Gazda",
  "Kurt Toms",
  "Rosario Gathright",
  "Kim Delph",
  "Stacy Christensen",
];

List messages = [
  "Hey, how are you doing?",
  "Are you available tomorrow?",
  "It's late. Go to bed!",
  "This cracked me up 😂😂",
  "Flutter Rocks!!!",
  "The last rocket🚀",
  "Griezmann signed for Barca❤️❤️",
  "Will you be attending the meetup tomorrow?",
  "Are you angry at something?",
  "Let's make a UI serie.",
  "Can i hear your voice?",
];

List notifs = [
  "${names[random.nextInt(10)]} and ${random.nextInt(100)} others liked your post",
  "${names[random.nextInt(10)]} mentioned you in a comment",
  "${names[random.nextInt(10)]} shared your post",
  "${names[random.nextInt(10)]} commented on your post",
  "${names[random.nextInt(10)]} replied to your comment",
  "${names[random.nextInt(10)]} reacted to your comment",
  "${names[random.nextInt(10)]} asked you to join a Group️",
  "${names[random.nextInt(10)]} asked you to like a page",
  "You have memories with ${names[random.nextInt(10)]}",
  "${names[random.nextInt(10)]} Tagged you and ${random.nextInt(100)} others in a post",
  "${names[random.nextInt(10)]} Sent you a friend request",
];

List notifications = List.generate(13, (index)=>{
  "name": names[random.nextInt(10)],
  "dp": "assets/cm${random.nextInt(10)}.jpeg",
  "time": "${random.nextInt(50)} min ago",
  "notif": notifs[random.nextInt(10)]
});

List posts = List.generate(13, (index)=>{
    "name": names[random.nextInt(10)],
    "dp": "assets/cm${random.nextInt(10)}.jpeg",
    "time": "${random.nextInt(50)} min ago",
    "img": "assets/cm${random.nextInt(10)}.jpeg",
    "likes": "${random.nextInt(50)} likes",
});

List chats = List.generate(13, (index)=>{
  "name": names[random.nextInt(10)],
  "dp": "assets/images/${random.nextInt(10)}.jpg",
  "msg": messages[random.nextInt(10)],
  "counter": random.nextInt(20),
  "time": "${random.nextInt(50)} min ago",
  "isOnline": random.nextBool(),
});

List groups = List.generate(13, (index)=>{
  "name": "Group ${random.nextInt(20)}",
  "dp": "assets/cm${random.nextInt(10)}.jpeg",
  "msg": messages[random.nextInt(10)],
  "counter": random.nextInt(20),
  "time": "${random.nextInt(150)} min ago",
  "isOnline": random.nextBool(),
});

List types = ["text", "image"];
List conversation = List.generate(10, (index)=>{
  "username": "Group ${random.nextInt(20)}",
  "time": "${random.nextInt(50)} min ago",
  "type": types[random.nextInt(2)],
  "replyText": messages[random.nextInt(10)],
  "isMe": random.nextBool(),
  "isGroup": false,
  "isReply": random.nextBool(),
});

List friends = List.generate(13, (index)=>{
  "name": names[random.nextInt(10)],
  "dp": "assets/cm${random.nextInt(10)}.jpeg",
  "status": "Anything could be here",
  "isAccept": random.nextBool(),
});
