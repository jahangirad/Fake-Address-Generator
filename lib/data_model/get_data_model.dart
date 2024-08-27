import 'dart:convert';

// JSON থেকে ডাটা পার্স করার জন্য ফাংশন
List<GetRendomData> getRendomDataFromJson(String str) =>
    List<GetRendomData>.from(json.decode(str).map((x) => GetRendomData.fromJson(x)));

// JSON-এ ডাটা কনভার্ট করার জন্য ফাংশন
String getRendomDataToJson(List<GetRendomData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// GetRendomData মডেল ক্লাস
class GetRendomData {
  String gender;
  Name name;
  Location location;
  String email;
  Login login;
  Dob dob;
  Dob registered;
  String phone;
  String cell;
  Id id;
  Picture picture;
  String nat;

  GetRendomData({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.login,
    required this.dob,
    required this.registered,
    required this.phone,
    required this.cell,
    required this.id,
    required this.picture,
    required this.nat,
  });

  // JSON থেকে মডেল অবজেক্টে কনভার্ট
  factory GetRendomData.fromJson(Map<String, dynamic> json) => GetRendomData(
    gender: json["gender"] ?? 'Unknown',
    name: Name.fromJson(json["name"]),
    location: Location.fromJson(json["location"]),
    email: json["email"] ?? 'Unknown',
    login: Login.fromJson(json["login"]),
    dob: Dob.fromJson(json["dob"]),
    registered: Dob.fromJson(json["registered"]),
    phone: json["phone"] ?? 'Unknown',
    cell: json["cell"] ?? 'Unknown',
    id: Id.fromJson(json["id"]),
    picture: Picture.fromJson(json["picture"]),
    nat: json["nat"] ?? 'Unknown',
  );

  // মডেল অবজেক্ট থেকে JSON-এ কনভার্ট
  Map<String, dynamic> toJson() => {
    "gender": gender,
    "name": name.toJson(),
    "location": location.toJson(),
    "email": email,
    "login": login.toJson(),
    "dob": dob.toJson(),
    "registered": registered.toJson(),
    "phone": phone,
    "cell": cell,
    "id": id.toJson(),
    "picture": picture.toJson(),
    "nat": nat,
  };
}

// DOB মডেল ক্লাস
class Dob {
  DateTime date;
  int age;

  Dob({
    required this.date,
    required this.age,
  });

  factory Dob.fromJson(Map<String, dynamic> json) => Dob(
    date: DateTime.parse(json["date"]),
    age: json["age"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "date": date.toIso8601String(),
    "age": age,
  };
}

// Id মডেল ক্লাস
class Id {
  String name;
  String value;

  Id({
    required this.name,
    required this.value,
  });

  factory Id.fromJson(Map<String, dynamic> json) => Id(
    name: json["name"] ?? 'Unknown',
    value: json["value"] ?? 'Unknown',
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "value": value,
  };
}

// Location মডেল ক্লাস
class Location {
  Street street;
  String city;
  String state;
  String country;
  int postcode;
  Coordinates coordinates;
  Timezone timezone;

  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    street: Street.fromJson(json["street"]),
    city: json["city"] ?? 'Unknown',
    state: json["state"] ?? 'Unknown',
    country: json["country"] ?? 'Unknown',
    postcode: json["postcode"] ?? 0,
    coordinates: Coordinates.fromJson(json["coordinates"]),
    timezone: Timezone.fromJson(json["timezone"]),
  );

  Map<String, dynamic> toJson() => {
    "street": street.toJson(),
    "city": city,
    "state": state,
    "country": country,
    "postcode": postcode,
    "coordinates": coordinates.toJson(),
    "timezone": timezone.toJson(),
  };
}

// Coordinates মডেল ক্লাস
class Coordinates {
  String latitude;
  String longitude;

  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    latitude: json["latitude"] ?? 'Unknown',
    longitude: json["longitude"] ?? 'Unknown',
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}

// Street মডেল ক্লাস
class Street {
  int number;
  String name;

  Street({
    required this.number,
    required this.name,
  });

  factory Street.fromJson(Map<String, dynamic> json) => Street(
    number: json["number"] ?? 0,
    name: json["name"] ?? 'Unknown',
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "name": name,
  };
}

// Timezone মডেল ক্লাস
class Timezone {
  String offset;
  String description;

  Timezone({
    required this.offset,
    required this.description,
  });

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
    offset: json["offset"] ?? 'Unknown',
    description: json["description"] ?? 'Unknown',
  );

  Map<String, dynamic> toJson() => {
    "offset": offset,
    "description": description,
  };
}

// Login মডেল ক্লাস
class Login {
  String uuid;
  String username;
  String password;
  String salt;
  String md5;
  String sha1;
  String sha256;

  Login({
    required this.uuid,
    required this.username,
    required this.password,
    required this.salt,
    required this.md5,
    required this.sha1,
    required this.sha256,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    uuid: json["uuid"] ?? 'Unknown',
    username: json["username"] ?? 'Unknown',
    password: json["password"] ?? 'Unknown',
    salt: json["salt"] ?? 'Unknown',
    md5: json["md5"] ?? 'Unknown',
    sha1: json["sha1"] ?? 'Unknown',
    sha256: json["sha256"] ?? 'Unknown',
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid,
    "username": username,
    "password": password,
    "salt": salt,
    "md5": md5,
    "sha1": sha1,
    "sha256": sha256,
  };
}

// Name মডেল ক্লাস
class Name {
  String title;
  String first;
  String last;

  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    title: json["title"] ?? 'Unknown',
    first: json["first"] ?? 'Unknown',
    last: json["last"] ?? 'Unknown',
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "first": first,
    "last": last,
  };
}

// Picture মডেল ক্লাস
class Picture {
  String large;
  String medium;
  String thumbnail;

  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
    large: json["large"] ?? 'Unknown',
    medium: json["medium"] ?? 'Unknown',
    thumbnail: json["thumbnail"] ?? 'Unknown',
  );

  Map<String, dynamic> toJson() => {
    "large": large,
    "medium": medium,
    "thumbnail": thumbnail,
  };
}
