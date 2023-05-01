List<Map<String, dynamic>> user = [
  {
    "role": "trainee",
    "username": "trainee1",
    "password": "123456789",
    "id": 1,
    "name": "Mustafa Amin",
    "age": 20,
    "email": "mustafa.amin387@gmail.com",
    "phone": "+201125586333",
    "image": "assets/images/mustafa_amin.jpg",
    "weight": 50.0,
    "height": 178.0,
    "contractors": [
      {
        "role": "trainer",
        "username": "MostafaLotfy51",
        "password": "123456789",
        "id": 1,
        "name": "Mostafa Lotfy",
        "age": 20,
        "email": "mostafa.lotfy@gmail.com",
        "phone": "+201145589634",
        "image": "assets/images/Trainer_avatar.png",
        "weight": 70.0,
        "height": 174.0,
        "trainClass": "Fitness",
        "biography": "no biography yet",
        "yearsOfExp": 3,
      },
      {
        "role": "trainer",
        "username": "Moaaz22",
        "password": "123456789",
        "id": 1,
        "name": "Moaaz Mohammed",
        "age": 18,
        "email": "Moaaz.mohammed@gmail.com",
        "phone": "+201145589634",
        "image": "assets/images/Trainer_avatar.png",
        "weight": 60.0,
        "height": 160.0,
        "trainClass": "Fitness",
        "biography": "no biography yet",
        "yearsOfExp": 1,
      },
    ],
  },
  {
    "role": "trainer",
    "username": "MostafaLotfy51",
    "password": "123456789",
    "id": 1,
    "name": "Mostafa Lotfy",
    "age": 20,
    "email": "mostafa.lotfy@gmail.com",
    "phone": "+201145589634",
    "image": "assets/images/Trainer_avatar.png",
    "weight": 70.0,
    "height": 174.0,
    "trainClass": "Fitness",
    "biography": "no biography yet",
    "yearsOfExp": 3,
    "contractors": [
      {
        "role": "trainee",
        "username": "trainee1",
        "password": "123456789",
        "id": 1,
        "name": "Mustafa Amin",
        "age": 20,
        "email": "mustafa.amin387@gmail.com",
        "phone": "+201125586333",
        "image": "assets/images/mustafa_amin.jpg",
        "weight": 50.0,
        "height": 178.0,
        "contractors": []
      }
    ]
  },
  {
    "role": "trainer",
    "username": "Moaaz22",
    "password": "123456789",
    "id": 2,
    "name": "Moaaz Mohammed",
    "age": 18,
    "email": "Moaaz.mohammed@gmail.com",
    "phone": "+201145589634",
    "image": "assets/images/Trainer_avatar.png",
    "weight": 60.0,
    "height": 160.0,
    "trainClass": "Fitness",
    "biography": "no biography yet",
    "yearsOfExp": 1,
    "contractors": []
  },
  {
    "role": "trainer",
    "username": "MahmoudKhaled75",
    "password": "123456789",
    "id": 3,
    "name": "Mahmoud Khaled",
    "age": 23,
    "email": "mahmoud.khaled@gmail.com",
    "phone": "+201145589634",
    "image": "assets/images/Trainer_avatar.png",
    "weight": 58.0,
    "height": 170.0,
    "trainClass": "Fitness",
    "biography": "no biography yet",
    "yearsOfExp": 4,
    "contractors": []
  },
];

List<Map<String, String>> admins = [
  {"username": "mustafa.amin28", "password": "123456789"},
  {"username": "admin", "password": "123456789"}
];

List<Map<String, dynamic>> apiUsers = [
  {
    "status": "success",
    "user": {
      "photo": "user-1677506099224.jpeg",
      "role": "user",
      "_id": "63fcb633b10c7931e0e1a5c0",
      "name": "Mustafa Amin",
      "email": "mustafa.amin22@yahoo.com",
      "__v": 0,
      "deviceToken": "efu66R8cTsGYEBBOk31sdP:APA91bGiBDBceqngLViggIVL9KLz7sCrre8AP1vl40VEh0eZ9QPM7oACyvpWKjnDrOVOexReMEs_aCyio5J9IelVndT2xL982kXfU6KjFo8GKbYtpK8nS-xofXgT-x-u8_r9U7bs3-hW"
    },
    "subscribe": [],
    "private": [
      {
        "startDate": "2023-02-28T16:29:06.849Z",
        "_id": "63fe3878094c0318fcfd554b",
        "PrivatePackage": "63fb1e1c5872fb0a98e0cf37",
        "trainer": {
          "skills": ["a", "b"],
          "_id": "63fe36d4094c0318fcfd5547",
          "name": "Trainer 1",
          "biography": "bla bla bla",
          "experience": "5 years",
          "age": 23,
          "email": "trainer1@gmail.com",
          "phone": "01145587666",
          "__v": 0
        },
        "trainee": {
          "photo": "user-1677506099224.jpeg",
          "role": "user",
          "_id": "63fcb633b10c7931e0e1a5c0",
          "name": "Mustafa Amin",
          "email": "mustafa.amin22@yahoo.com",
          "__v": 0,
          "deviceToken": "efu66R8cTsGYEBBOk31sdP:APA91bGiBDBceqngLViggIVL9KLz7sCrre8AP1vl40VEh0eZ9QPM7oACyvpWKjnDrOVOexReMEs_aCyio5J9IelVndT2xL982kXfU6KjFo8GKbYtpK8nS-xofXgT-x-u8_r9U7bs3-hW"
        },
        "endDate": "2023-05-28T17:23:04.187Z",
        "__v": 0
      }
    ],
    "classes": []
  }
];
